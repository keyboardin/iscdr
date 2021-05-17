package com.insung.isup.common.controller;

import java.io.File;
import java.util.ArrayList;
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

import com.insung.isup.common.model.CommonModel;
import com.insung.isup.common.model.OptionTagModel;
import com.insung.isup.common.util.FileDownloadUtil;
import com.insung.isup.common.util.OptionTagUtil;
import com.insung.isup.code.model.CommCodeModel;
import com.insung.isup.code.service.CommCodeService;

@Controller
public class CommonController extends BaseController {	
	 
	private static final Logger logger = LoggerFactory.getLogger(CommonController.class);
	
	@Autowired
	private CommCodeService commCodeService;
	
	@SuppressWarnings("static-access")
	@RequestMapping("/common/requestFileDownload.do")
	public void requestFileDownload(Map<String, Object> model,HttpServletRequest req, HttpServletResponse res, CommonModel commonModel) {
		logger.debug("/common/requestFileDownload.do");
		logger.debug("file_path : "+commonModel.getFile_path());
		logger.debug("file_name : "+commonModel.getFile_name());
		try {
			FileDownloadUtil fileDownloadUtil=new FileDownloadUtil();
			fileDownloadUtil.download(req, res, new File(commonModel.getFile_path()),commonModel.getFile_name());
		} catch(Exception e){
			e.printStackTrace();
		}
	}
		
	
	//공통코드 셀렉트박스(table : tb_c_comm_code)
	@RequestMapping("/common/createCommCodeSelectBox.json")
	public ModelAndView createCommCodeSelectBox(Map<String, Object> model, CommCodeModel commCodeModel, HttpServletRequest req, HttpServletResponse res) {
		logger.debug("/common/createCommCodeSelectBox.json");
		logger.debug("group_id : "+commCodeModel.getGroup_id());	
		
		List<OptionTagModel> resultList = new ArrayList<OptionTagModel>();	
		try {
			commCodeModel.setUse_yn("Y");
			commCodeModel.setSidx("priority");
			commCodeModel.setSord("asc");
			List<CommCodeModel> list = commCodeService.requestList(commCodeModel);
			if(list!=null){        	
				for(int i=0; i<list.size(); i++){
					commCodeModel = (CommCodeModel)list.get(i);
					resultList.add( new OptionTagModel(commCodeModel.getCode_nm(),commCodeModel.getCode_id()));
	        	}
			}		
			String html = OptionTagUtil.generateOptionsTag(resultList, req.getParameter("selected"));
			model.put("html",html);
		} catch(Exception e){
			e.printStackTrace();
		}	
		return new ModelAndView("jsonView",model);	
	}
	
	
	
	
}
