package com.insung.isup.log.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.insung.isup.common.controller.BaseController;
import com.insung.isup.common.util.CommonUtil;
import com.insung.isup.log.model.BatchLogModel;
import com.insung.isup.log.service.BatchLogService;

@Controller
public class BatchLogController extends BaseController {

	private static final Logger logger = LoggerFactory.getLogger(BatchLogController.class);
	
	@Autowired
	BatchLogService batchLogService;
	
	//requestListBatchLog
	@RequestMapping(value="/log/batchLogList.json")
	public ModelAndView batchLogList(Map<String, Object> model, BatchLogModel batchLogModel, HttpServletRequest req, HttpServletResponse res){
		logger.debug("/log/batchLogList.json");
		logger.debug("draw : "+ batchLogModel.getDraw());
		logger.debug("start : "+ batchLogModel.getStart());
		logger.debug("length : "+ batchLogModel.getLength());
		logger.debug("filter : "+ CommonUtil.getFilter(req));		

		String draw = batchLogModel.getDraw();
		batchLogModel.setFilter(CommonUtil.getFilter(req));			//filter		
		batchLogModel.setSidx(CommonUtil.getOrderColumn(req));		
		batchLogModel.setSord(CommonUtil.getOrderDir(req));			//ASC, DESC
		
		try {		
			String records = batchLogService.requestListCount(batchLogModel).getRecords()+"";
			List<BatchLogModel> resultList = batchLogService.requestList(batchLogModel);		
			
			model.put("draw", draw);
			model.put("recordsTotal", records);
			model.put("recordsFiltered", records);
			model.put("data", resultList);	
		} catch (Exception e) {
			logger.debug("Exception", e);
		}
		return new ModelAndView("jsonView", model);
	}
	

}
