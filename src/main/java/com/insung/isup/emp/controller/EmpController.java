package com.insung.isup.emp.controller;

import java.io.InputStream;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.insung.isup.common.controller.BaseController;
import com.insung.isup.common.util.CommonUtil;
import com.insung.isup.common.util.XlsxView;
import com.insung.isup.emp.model.EmpModel;
import com.insung.isup.emp.service.EmpService;
import com.insung.isup.emp.service.EmpSourceService;

@Controller
//@PropertySource("classpath:application.properties")
public class EmpController extends BaseController {

	private static final Logger logger = LoggerFactory.getLogger(EmpController.class);
	
	@Value("${db.encrypt_key}") 
	private String db_encrypt_key;	
	
	@Autowired
	EmpService empService;
	
	@Autowired
	EmpSourceService empSourceService;
		
	//사용자관리
	@RequestMapping(value="/emp.do")
	public String emp(Map<String, Object> model, EmpModel empModel, HttpServletRequest req, HttpServletResponse res){
		logger.debug("/emp.do >>>>> emp/emp.jsp");
		return "emp/emp";
	}	
	
	//Tree
	@RequestMapping(value="/emp/empTree.json")
	public ModelAndView empTree(Map<String, Object> model, EmpModel empModel, HttpServletRequest req, HttpServletResponse res){
		logger.debug("/emp/empTree.json");
		logger.debug("search_column : "+empModel.getSearch_column());
		logger.debug("search_value : "+empModel.getSearch_value());	
		String contextpath = req.getContextPath();	//DB쿼리에서 contextpath+imagepath 만들기 위해
		empModel.setContextpath(contextpath);
		try {			
			List<LinkedHashMap<String, Object>> resultTree = empService.requestTree(empModel);
			for(int i=0; i<resultTree.size(); i++) {
				LinkedHashMap<String, Object> map = resultTree.get(i);
				LinkedHashMap<String, Object> _tmp = new LinkedHashMap<String, Object>();
				_tmp.put("org_nm", map.get("org_nm"));
				_tmp.put("emp_email", map.get("emp_email"));
				map.put("data", _tmp);
				//map.put("data", map.get("org_nm"));
				resultTree.set(i, map);
				//map.get("org_nm");
				//map.get("emp_email")
			}
			model.put("resultTree", resultTree);	
		} catch (Exception e) {
			logger.debug("Exception", e);
		}
		
		return new ModelAndView("jsonView", model);
	}
	
	
	//requestListAll
	@RequestMapping(value="/emp/empListAll.json")
	public ModelAndView empListAll(Map<String, Object> model, EmpModel empModel, HttpServletRequest req, HttpServletResponse res){
		logger.debug("/emp/empListAll.json");
		try {		
			List<EmpModel> resultList = empService.requestList(empModel);		
			model.put("data", resultList);	
		} catch (Exception e) {
			logger.debug("Exception", e);
		}
		return new ModelAndView("jsonView", model);
	}	
	
	//requestList
	@RequestMapping(value="/emp/empList.json")
	public ModelAndView empList(Map<String, Object> model, EmpModel empModel, HttpServletRequest req, HttpServletResponse res){
		logger.debug("/emp/empList.json");
		logger.debug("draw : "+ empModel.getDraw());
		logger.debug("start : "+ empModel.getStart());
		logger.debug("length : "+ empModel.getLength());
		logger.debug("filter : "+ CommonUtil.getFilter(req)); 
		
		String draw = empModel.getDraw();
		empModel.setFilter(CommonUtil.getFilter(req));			//filter		
		empModel.setSidx(CommonUtil.getOrderColumn(req));		
		empModel.setSord(CommonUtil.getOrderDir(req));			//ASC, DESC	
		
		try {		
			String records = empService.requestListCount(empModel).getRecords()+"";
			List<EmpModel> resultList = empService.requestList(empModel);		
			
			model.put("draw", draw);
			model.put("recordsTotal", records);
			model.put("recordsFiltered", records);
			model.put("data", resultList);	
		} catch (Exception e) {
			logger.debug("Exception", e);
		}
		return new ModelAndView("jsonView", model);
	}	
	
	
	//Detail
	@RequestMapping(value="/emp/empDetail.json")
	public ModelAndView empDetail(Map<String, Object> model, EmpModel empModel, HttpServletRequest req, HttpServletResponse res){
		logger.debug("/emp/empDetail.json");
		logger.debug("emp_no : "+empModel.getEmp_no());
		try {		
			empModel = empService.requestDetail(empModel);		
			model.put("result", empModel);	
		} catch (Exception e) {
			logger.debug("Exception", e);
		}
		return new ModelAndView("jsonView", model);
	}
	
		
	//requestInsert
	@RequestMapping(value="/emp/empInsert.json")
	public ModelAndView empInsert(Map<String, Object> model, EmpModel empModel, HttpServletRequest req, HttpServletResponse res){
		logger.debug("/emp/arsSpecDayTtsInsert.json");
		try {	
			empService.requestInsert(empModel);
			model.put("msg","등록 되었습니다");
			model.put("success",1);			
		} catch (Exception e) {
			model.put("msg","오류가 발생했습니다");
			model.put("success",0);
			logger.debug("Exception", e);
		}
		return new ModelAndView("jsonView",model);
	}
	
	
	//requestUpdate
	@RequestMapping(value="/emp/empUpdate.json")
	public ModelAndView empUpdate(Map<String, Object> model, EmpModel empModel, HttpServletRequest req, HttpServletResponse res){
		logger.debug("/emp/empUpdate.json");
		try {	
			empService.requestUpdate(empModel);
			model.put("msg","수정 되었습니다");
			model.put("success",1);
		} catch (Exception e) {
			model.put("msg","오류가 발생했습니다");
			model.put("success",0);
			logger.debug("Exception", e);
		}
		return new ModelAndView("jsonView",model);
	}
	
	
	//requestDelete
	@RequestMapping(value="/emp/empDelete.json")
	public ModelAndView empDelete(Map<String, Object> model, EmpModel empModel, HttpServletRequest req, HttpServletResponse res){
		logger.debug("/emp/empDelete.json");
		try {	
			empService.requestDelete(empModel);
			model.put("msg","삭제 되었습니다");
			model.put("success",1);			
		} catch (Exception e) {
			model.put("msg","오류가 발생했습니다");
			model.put("success",0);
			logger.debug("Exception", e);
		}
		return new ModelAndView("jsonView",model);
	}
	
	//requestPwReset
	@RequestMapping(value="/emp/empPwReset.json")
	public ModelAndView empPwReset(Map<String, Object> model, EmpModel empModel, HttpServletRequest req, HttpServletResponse res){
		logger.debug("/emp/empPwReset.json");
		try {	
			empService.requestPwReset(empModel);
			model.put("msg","초기화 되었습니다");
			model.put("success",1);			
		} catch (Exception e) {
			model.put("msg","오류가 발생했습니다");
			model.put("success",0);
			logger.debug("Exception", e);
		}
		return new ModelAndView("jsonView",model);
	}

	
	
	
	//인사정보 Sync
	@RequestMapping("/emp/empSync.json")
	public ModelAndView empSync(Map<String, Object> model, EmpModel empModel, HttpServletRequest req, HttpServletResponse res) throws Throwable {
		logger.debug("/emp/empSync.json");
		try {		
			empService.requestSyncEmp(empModel);
			model.put("msg","완료 되었습니다");
			model.put("success",1);			
		} catch (Exception e) {
			model.put("msg","오류가 발생했습니다");
			model.put("success",0);
			logger.debug("Exception", e);
		}
		return new ModelAndView("jsonView",model);
	}	
	
	//조직정보 Sync
	@RequestMapping("/emp/orgSync.json")
	public ModelAndView orgSync(Map<String, Object> model, HttpServletRequest req, HttpServletResponse res) {
		logger.debug("/emp/orgSync.json");
		try {
			List<LinkedHashMap<String, Object>> insertList = empSourceService.requestOrgList();			
			LinkedHashMap<String, Object> linkedHashMap = new LinkedHashMap<String, Object>();
			linkedHashMap.put("insertList", insertList);			
			empService.requestSyncOrg(linkedHashMap);
			model.put("msg","완료 되었습니다");
			model.put("success",1);			
		} catch (Exception e) {
			model.put("msg","오류가 발생했습니다");
			model.put("success",0);
			logger.debug("Exception", e);
		}
		return new ModelAndView("jsonView",model);
	}
	
	//Excel File Upload
	@RequestMapping(value="/emp/empExcelUpload.json")
	public ModelAndView empExcelUpload(Map<String, Object> model, EmpModel empModel, HttpServletRequest req, HttpServletResponse res){
		logger.debug("/conf/empExcelUpload.json");
		try {
			List<EmpModel> insertList = new ArrayList<EmpModel>();
			
			//파일 파싱
			MultipartHttpServletRequest multipartReq = (MultipartHttpServletRequest)req;
			MultipartFile multipartFile = multipartReq.getFile("file"); 
			String filename = multipartFile.getOriginalFilename();
			String filetype = CommonUtil.getFiletype(filename);
			logger.debug("filename : "+ filename);
			
			InputStream is = multipartFile.getInputStream();			
			
			if("xlsx".equals(filetype)){
				XSSFWorkbook workbook = new XSSFWorkbook(is);
				XSSFSheet sheet = workbook.getSheetAt(0);			
				
				int rows = sheet.getPhysicalNumberOfRows(); //행 갯수 가져오기		
				
				for(int i=1; i<rows; i++){ 	
					XSSFRow row = sheet.getRow(i); 	
					if(row != null){	
			            Cell cell0 = row.getCell(0); 	//사번
			            Cell cell1 = row.getCell(1); 	//부서
			            Cell cell2 = row.getCell(2); 	//직급
			            Cell cell3 = row.getCell(3); 	//이름
			            Cell cell4 = row.getCell(4); 	//내선번호
			            String emp_no = cell0.toString();
			            String org_nm = cell1.toString();
			            String pos_nm = cell2.toString();
			            String emp_nm = cell3.toString();
			            String emp_tel = cell4.toString();
			            
			            empModel = new EmpModel();
			            empModel.setEmp_no(emp_no);
			            empModel.setOrg_nm(org_nm);
			            empModel.setPos_nm(pos_nm);
			            empModel.setEmp_nm(emp_nm);
			            empModel.setEmp_tel(emp_tel);
			            insertList.add(empModel);
					}
				}
			}else if("xls".equals(filetype)){
				HSSFWorkbook workbook=new HSSFWorkbook(is);
				HSSFSheet sheet = workbook.getSheetAt(0); 		//시트 가져오기
				int rows = sheet.getPhysicalNumberOfRows(); 	//행 갯수 가져오기	
				for(int i=1; i<rows; i++){ 	
					HSSFRow row = sheet.getRow(i); 	
					if(row != null){    
						Cell cell0 = row.getCell(0); 	//사번
			            Cell cell1 = row.getCell(1); 	//부서
			            Cell cell2 = row.getCell(2); 	//직급
			            Cell cell3 = row.getCell(3); 	//이름
			            Cell cell4 = row.getCell(4); 	//내선번호
			            String emp_no = cell0.toString();
			            String org_nm = cell1.toString();
			            String pos_nm = cell2.toString();
			            String emp_nm = cell3.toString();
			            String emp_tel = cell4.toString();
			            
			            empModel = new EmpModel();
			            empModel.setEmp_no(emp_no);
			            empModel.setOrg_nm(org_nm);
			            empModel.setPos_nm(pos_nm);
			            empModel.setEmp_nm(emp_nm);
			            empModel.setEmp_tel(emp_tel);
			            insertList.add(empModel);
					}
				}
			}
			
			LinkedHashMap<String, Object> linkedHashMap = new LinkedHashMap<String, Object>();
			linkedHashMap.put("insertList", insertList);			
			empService.requestSyncEmp(linkedHashMap);
			model.put("msg","등록 되었습니다");
			model.put("success",1);
		} catch (Exception e) {
			model.put("msg","오류가 발생했습니다");
			model.put("success",0);
			logger.debug("Exception", e);
		}
		return new ModelAndView("jsonView",model);
	}
	
	
	//Excel Download
	@RequestMapping(value="/emp/empExcelDownload.json")
	public ModelAndView empExcelDownload(Map<String, Object> model, EmpModel empModel, HttpServletRequest req, HttpServletResponse res){
		logger.debug("/emp/empExcelDownload.json");
		try {		
			List<EmpModel> resultList = empService.requestList(empModel);		
			String[] columnName = {"emp_no","emp_nm","org_cd","ord_nm","pos_cd","pos_nm","duty_cd","duty_nm","extension","emp_tel","emp_email","emp_fax","emp_mobile","pic_path"};
			String[] headerName = {"사번","이름","부서코드","부서","직급코드","직급","직책코드","직책","내선","전화","이메일","팩스","모바일","사진"};		
			
			model.put("columnName", columnName);
			model.put("headerName", headerName);
			model.put("result", resultList);	
			model.put("fileName", "emp_"+CommonUtil.getSysDate(0, "yyyyMMdd"));
			model.put("sheetName", "emp");
		
		} catch (Exception e) {
			logger.debug("Exception", e);
		}
		return new ModelAndView(new XlsxView(), model);
	}	
}
