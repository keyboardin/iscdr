package com.insung.isup.statsipcc.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.insung.isup.statsipcc.model.StatsIpccModel;
import com.insung.isup.statsipcc.service.StatsIpccService;

@Controller
public class StatsIpccController {

	private static final Logger logger = LoggerFactory.getLogger(StatsIpccController.class);

	@Autowired
	private StatsIpccService statsIpccService;
	
//	//통계장표 - 팝업
//	/*
//     * 통계 RD Page PopUp 호츨;
//     */
//    @RequestMapping(value = "/statsipcc/popRD.do")
//	public String popRD(
//			@RequestParam(value="rdid", defaultValue="") String rdid
//			, Model model
//    		, HttpSession session
//    		, HttpServletRequest request
//    		, HttpServletResponse response) throws Exception {
//    	
//    	logger.debug("################# StatsIpccController > popRD : rdid = "+rdid);
//		String rtnURL = "";
//		
//		
//		rtnURL = "statsipcc/"+rdid;
//		
//		return rtnURL;
//	}
//    
//    
//    /*
//     * 통계장표 Precedure 조회
//     */
//    @ResponseBody
//    @RequestMapping(value = "/stat/ajaxStatProc.do")
//    public ModelMap ajaxStatProc(
//    		@ModelAttribute("statsIpccModel") StatsIpccModel paramVO
//    		, HttpSession session
//    		, HttpServletRequest request
//    		, HttpServletResponse response) throws Exception {
//
//    	logger.debug("################# StatsController > ajaxStatProc");
//    	
//    	ModelMap rtn = new ModelMap();
//    	
//    	if(paramVO.getStable().equalsIgnoreCase("RD001")) {
//    		//[RD001] 1.종합콜 현황
//    	}else if(paramVO.getStable().equalsIgnoreCase("RD002")) {
//    		//[RD002] 2.응답콜 현황
//    	}else if(paramVO.getStable().equalsIgnoreCase("RD003")) {
//    		//[RD003] 3.인바운드 상담실적
//    	}    		
//    	
//    	return rtn;
//    }
    
    
    
	//report
	@RequestMapping(value="/statsipcc/report.do")
	public String report(@RequestParam(value="rid", defaultValue="") String rid, HttpServletRequest req, HttpServletResponse res){
		logger.debug("/statsipcc/report.do >>>>> statsipcc/"+rid+".jsp");
		return "statsipcc/"+rid;
	}
	
    //reportList
  	@RequestMapping(value="/statsipcc/reportList.json")
  	public ModelAndView reportList(Map<String, Object> model, StatsIpccModel statsIpccModel, HttpServletRequest req, HttpServletResponse res){
  		logger.debug("/statsipcc/reportList.json");
  		logger.debug("rid : "+statsIpccModel.getRid());
  		logger.debug("dttype : "+statsIpccModel.getDttype());
  		logger.debug("frdt : "+statsIpccModel.getFrdt());
  		logger.debug("frtm : "+statsIpccModel.getFrtm());
  		logger.debug("todt : "+statsIpccModel.getTodt());
  		logger.debug("totm : "+statsIpccModel.getTotm());
  		logger.debug("maintel : "+statsIpccModel.getMaintel());
  		logger.debug("agent : "+statsIpccModel.getAgent());
  		logger.debug("ani : "+statsIpccModel.getAni());
  		
  		String rid = statsIpccModel.getRid();
  		  		
  		try {		
  			if("st001".equals(rid)) { 
  	    		//[RD001] 1.종합콜 현황
  				statsIpccModel.setProc_nm("CSTM_APP.dbo.PROC_APP_CALL_TOTAL");
  	    	} else {
  	    		statsIpccModel.setProc_nm("CSTM_APP.dbo."+rid);
  	    	}
  			List<HashMap<String, Object>> resultList = statsIpccService.requestList(statsIpccModel);		
  			model.put("data", resultList);	
  			//model.put("rows", resultList);	
  		} catch (Exception e) {
  			logger.debug("Exception", e);
  		}
  		return new ModelAndView("jsonView", model);
  	}
    
    
    
}
