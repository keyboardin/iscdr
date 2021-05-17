package com.insung.isup.code.controller;

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
import org.springframework.web.servlet.ModelAndView;

import com.insung.isup.code.model.CommCodeModel;
import com.insung.isup.code.service.CommCodeService;
import com.insung.isup.common.controller.BaseController;
import com.insung.isup.common.util.CommonUtil;

@Controller
public class CommCodeController extends BaseController {

	private static final Logger logger = LoggerFactory.getLogger(CommCodeController.class);

	@Autowired
	CommCodeService commCodeService;

	// initList
	@RequestMapping(value = "/code/commCode.do")
	public String init(Map<String, Object> model, CommCodeModel commCodeModel, HttpServletRequest req,
			HttpServletResponse res) {
		logger.debug("/code/commCode.do >>>>> code/commCode.jsp");
		return "code/commCode";
	}

	// requestListAll
	@RequestMapping(value = "/code/commCodeListAll.json")
	public ModelAndView commCodeListAll(Map<String, Object> model, CommCodeModel commCodeModel, HttpServletRequest req,
			HttpServletResponse res) {
		logger.debug("/code/commCodeListAll.json");
		logger.debug("group_id : " + commCodeModel.getGroup_id());
		try {
			List<CommCodeModel> resultList = commCodeService.requestList(commCodeModel);
			model.put("data", resultList);
		} catch (Exception e) {
			logger.debug("Exception", e);
		}
		return new ModelAndView("jsonView", model);
	}

	// requestList
	@RequestMapping(value = "/code/commCodeList.json")
	public ModelAndView commCodeList(Map<String, Object> model, CommCodeModel commCodeModel, HttpServletRequest req,
			HttpServletResponse res) {
		logger.debug("/code/commCodeList.json");
		logger.debug("draw : " + commCodeModel.getDraw());
		logger.debug("start : " + commCodeModel.getStart());
		logger.debug("length : " + commCodeModel.getLength());
		logger.debug("filter : " + CommonUtil.getFilter(req));
		logger.debug("group_id : " + commCodeModel.getGroup_id());

		String draw = commCodeModel.getDraw();
		commCodeModel.setSearch_value(CommonUtil.getFilter(req)); // filter
		commCodeModel.setSidx(CommonUtil.getOrderColumn(req));
		commCodeModel.setSord(CommonUtil.getOrderDir(req)); // ASC, DESC

		try {
			String records = commCodeService.requestListCount(commCodeModel).getRecords() + "";
			List<CommCodeModel> resultList = commCodeService.requestList(commCodeModel);

			model.put("draw", draw);
			model.put("recordsTotal", records);
			model.put("recordsFiltered", records);
			model.put("data", resultList);
		} catch (Exception e) {
			logger.debug("Exception", e);
		}
		return new ModelAndView("jsonView", model);
	}

	// requestDetail
	@RequestMapping(value = "/code/commCodeDetail.json")
	public ModelAndView commCodeDetail(Map<String, Object> model, CommCodeModel commCodeModel, HttpServletRequest req,
			HttpServletResponse res) {
		logger.debug("/code/commCodeDetail.json");
		logger.debug("group_id : " + commCodeModel.getGroup_id());
		logger.debug("code_id : " + commCodeModel.getCode_id());

		try {
			commCodeModel = commCodeService.requestDetail(commCodeModel);
			model.put("result", commCodeModel);
		} catch (Exception e) {
			logger.debug("Exception", e);
		}
		return new ModelAndView("jsonView", model);
	}

	// requestInsert
	@RequestMapping(value = "/code/commCodeInsert.json")
	public ModelAndView commCodeInsert(Map<String, Object> model, CommCodeModel commCodeModel, HttpServletRequest req,
			HttpServletResponse res) {
		logger.debug("/code/commCodeInsert.json");
		try {
			commCodeService.requestInsert(commCodeModel);
			model.put("msg", "등록 되었습니다");
			model.put("success", 1);
		} catch (Exception e) {
			model.put("msg", "오류가 발생했습니다");
			model.put("success", 0);
			logger.debug("Exception", e);
		}
		return new ModelAndView("jsonView", model);
	}

	// requestUpdate
	@RequestMapping(value = "/code/commCodeUpdate.json")
	public ModelAndView commCodeUpdate(Map<String, Object> model, CommCodeModel commCodeModel, HttpServletRequest req,
			HttpServletResponse res) {
		logger.debug("/code/commCodeUpdate.json");
		logger.debug("code_id : " + commCodeModel.getCode_id());
		logger.debug("group_id : " + commCodeModel.getGroup_id());
		try {
			commCodeService.requestUpdate(commCodeModel);
			model.put("msg", "수정 되었습니다");
			model.put("success", 1);
		} catch (Exception e) {
			model.put("msg", "오류가 발생했습니다");
			model.put("success", 0);
			logger.debug("Exception", e);
		}
		return new ModelAndView("jsonView", model);
	}

	// requestDelete
	@RequestMapping(value = "/code/commCodeDelete.json")
	public ModelAndView commCodeDelete(Map<String, Object> model, CommCodeModel commCodeModel, HttpServletRequest req,
			HttpServletResponse res) {
		logger.debug("/code/commCodeDelete.json");
		logger.debug("code_id : " + commCodeModel.getCode_id());
		logger.debug("group_id : " + commCodeModel.getGroup_id());
		try {
			commCodeService.requestDelete(commCodeModel);
			model.put("msg", "삭제 되었습니다");
			model.put("success", 1);
		} catch (Exception e) {
			model.put("msg", "오류가 발생했습니다");
			model.put("success", 0);
			logger.debug("Exception", e);
		}
		return new ModelAndView("jsonView", model);
	}

	// requestGroupList
	@RequestMapping(value = "/code/commCodeGroupList.json")
	public ModelAndView requestGroupList(Map<String, Object> model, CommCodeModel commCodeModel, HttpServletRequest req,
			HttpServletResponse res) {
		logger.debug("/commcode/requestGroupList.json");
		try {
			List<CommCodeModel> resultList = commCodeService.requestGroupList(commCodeModel);
			model.put("resultList", resultList);
		} catch (Exception e) {
			logger.debug("Exception", e);
		}
		return new ModelAndView("jsonView", model);
	}

	// requestTree
	@RequestMapping(value = "/code/commCodeTree.json")
	public ModelAndView commCodeTree(Map<String, Object> model, CommCodeModel commCodeModel, HttpServletRequest req,
			HttpServletResponse res) {
		logger.debug("/code/requestTree.json");
		String contextpath = req.getContextPath(); // DB쿼리에서 contextpath+imagepath 만들기 위해
		commCodeModel.setContextpath(contextpath);
		try {
			List<HashMap<String, Object>> resultTree = commCodeService.requestTree(commCodeModel);
			/*
			 * for(int i=0; i<resultTree.size(); i++) { HashMap<String, Object> map =
			 * resultTree.get(i); map.put("icon", "<i class=\"fa-fw fa fa-home\"></i>");
			 * resultTree.set(i, map); }
			 */
			model.put("resultTree", resultTree);
		} catch (Exception e) {
			logger.debug("Exception", e);
		}
		return new ModelAndView("jsonView", model);
	}

}
