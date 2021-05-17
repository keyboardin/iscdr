package com.insung.isup.common.batch;

import java.util.Date;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;

import com.insung.isup.common.util.CommonUtil;
import com.insung.isup.conf.model.BatchConfigModel;
import com.insung.isup.conf.service.BatchConfigService;
import com.insung.isup.emp.model.EmpModel;
import com.insung.isup.emp.service.EmpService;
import com.insung.isup.log.model.BatchLogModel;
import com.insung.isup.log.service.BatchLogService;

@Configuration
@EnableAsync
@EnableScheduling
public class BatchJobScheduler {

	private static final Logger logger = LoggerFactory.getLogger(BatchJobScheduler.class);
	
	@Autowired
	BatchConfigService batchConfigService;
	
	@Autowired
	BatchLogService batchLogService;
	
	@Autowired
	EmpService empService;
	
	
	//@Scheduled(cron="0 5 0 * * *")
	//@Scheduled(fixedRate=1000*60*60*24)  	//24시간마다
	@Scheduled(cron="*/60 * * * * *")  		//매분60초에(60초마다) 	root-context.xml 에 설정할 경우 service 객체가 생성안됨
	public void scheduleTask() {
		
		BatchLogModel batchLogModel = null;
		
		/*
		 * 1.인사정보동기화(tb_m_emp)
 		 */
		try {
			Date sys_date = CommonUtil.getSysDate(0);
			logger.debug("########## scheduleTask "+ sys_date+" ##########");
			
			String current_date = CommonUtil.getDateToString(sys_date, "yyyy-MM-dd");
			String current_time = CommonUtil.getDateToString(sys_date, "HH:mm");
			int current_week = CommonUtil.getDateDay(current_date, "yyyy-MM-dd");
			
			logger.debug("current_date : "+ current_date);
			logger.debug("current_time : "+ current_time);
			logger.debug("current_week : "+ current_week);
			
			BatchConfigModel batchConfigModel = new BatchConfigModel(); 
			batchConfigModel.setUse_yn("Y");
			batchConfigModel.setSidx("batch_id");
			batchConfigModel.setSord("asc");
			List<BatchConfigModel> resultList = batchConfigService.requestList(batchConfigModel);

			for(int i=0; i<resultList.size(); i++) {
				String result="";
				batchConfigModel = resultList.get(i);
				int batch_id = batchConfigModel.getBatch_id();
				String batch_nm = batchConfigModel.getBatch_nm();
				String batch_day = batchConfigModel.getBatch_day();		//0111110
				String batch_time = batchConfigModel.getBatch_time();	//02:00
				batch_day = batch_day.substring(current_week-1, current_week);	//0111110 중 오늘해당값을 자름
				
				batchLogModel = new BatchLogModel();	
				batchLogModel.setBatch_id(batch_id);
				batchLogModel.setBatch_nm(batch_nm);
				
				if(batch_day.equals("1") && batch_time.equals(current_time)) {	//요일이 체크되어 있고 시간이 일치하면
					//1.인사정보동기화(tb_m_emp)
					if(batch_id==1) {			
						EmpModel empModel = new EmpModel();
						result = empService.requestSyncEmp(empModel);
					}
					
					batchLogModel.setContent("Success >>>>> "+result);
					batchLogService.requestInsert(batchLogModel);
				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			batchLogModel.setContent("Error >>>>> "+e.getMessage());
			try {
				batchLogService.requestInsert(batchLogModel);
			}catch(Exception ex) {
				ex.printStackTrace();
			}
		}
	}
}
