package com.insung.isup.common.util;

import java.util.List;
import org.apache.commons.lang.StringEscapeUtils;
import com.insung.isup.common.model.OptionTagModel;

public class OptionTagUtil{

	public static String generateOptionsTag(List<OptionTagModel> list, String selectedCode, boolean showCode){
		StringBuilder sb = new StringBuilder();
		if(list==null || list.size()==0) return "";
		for(OptionTagModel vo : list){
			String selectedStr = (selectedCode!=null && selectedCode.equals(vo.code)) ? " selected " : "";
			String showStr = showCode ? StringEscapeUtils.escapeHtml("[" + vo.code + "] " + vo.codename) : StringEscapeUtils.escapeHtml(vo.codename);
			sb.append("<option value=\"").append(vo.code).append("\"").append(selectedStr)
			   .append(">").append(showStr).append("</option>");
		}
		return sb.toString();
	}
	
	public static String generateOptionsTag(List<OptionTagModel> list, String selectedCode){
		return generateOptionsTag(list, selectedCode, false);
	}
	

}
