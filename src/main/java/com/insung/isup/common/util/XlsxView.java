package com.insung.isup.common.util;

import java.lang.reflect.InvocationTargetException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFCellStyle;
import org.apache.poi.xssf.usermodel.XSSFColor;
import org.apache.poi.xssf.usermodel.XSSFFont;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.springframework.web.servlet.view.document.AbstractXlsxView;

public class XlsxView extends AbstractXlsxView {

	@SuppressWarnings({ "rawtypes", "unused" })
	protected void buildExcelDocument(Map model, Workbook workbook, 
			HttpServletRequest request, HttpServletResponse response){
		//logger.debug(model);
		String fileName = (String)model.get("fileName");
		if(CommonUtil.isNull(fileName)){
			response.setHeader("Content-Disposition", "attachment;filename=filename.xlsx");
		}else{
			response.setHeader("Content-Disposition", "attachment;filename="+fileName+".xlsx");
		}
		
		short currentRow=0;
		String[] headerName=(String[])model.get("headerName");
		String[] columnName=(String[])model.get("columnName");
		String[] styleName=(String[])model.get("styleName");
		List result=(List)model.get("result");
		logger.debug("Data Row Count: "+result.size());
		//logger.debug("Headers: "+headerName);
		//logger.debug("Columns: "+columnName);
		
		// CREATE THE SHEET
		XSSFSheet sheet = (XSSFSheet)workbook.createSheet((String)model.get("sheetName"));
		sheet.setDefaultColumnWidth((short)12);
		sheet.setDefaultRowHeight((short)50);
		
		XSSFCellStyle titleCellStyle = (XSSFCellStyle)workbook.createCellStyle();
		titleCellStyle.setBorderTop(XSSFCellStyle.BORDER_THICK);
		titleCellStyle.setBorderBottom(XSSFCellStyle.BORDER_THIN);
		titleCellStyle.setBorderLeft(XSSFCellStyle.BORDER_THIN);
		titleCellStyle.setBorderRight(XSSFCellStyle.BORDER_THIN);		
		titleCellStyle.setFillForegroundColor(new XSSFColor(new java.awt.Color(255, 255, 0))); //바로 이부분입니다. 전경을 노랑으로 줬습니다. 이것만하면 색이 적용 안되구요
		titleCellStyle.setFillPattern(XSSFCellStyle.SOLID_FOREGROUND); //필패턴을 전경으로 하겠다고 설정을 해야합니다. 이두줄만 적으면 적용됩니다.
		titleCellStyle.setAlignment(XSSFCellStyle.ALIGN_CENTER);
		titleCellStyle.setVerticalAlignment(XSSFCellStyle.VERTICAL_CENTER);
		
		XSSFFont font = (XSSFFont)workbook.createFont();
		font.setBoldweight(XSSFFont.BOLDWEIGHT_BOLD);
		titleCellStyle.setFont(font);

		// LINE 1
		for(int i=0;i<headerName.length;i++){
			XSSFCell header = getCell(sheet,currentRow,i,(short)0x270);
			setText(header, headerName[i]);
			header.setCellStyle(titleCellStyle);			
		}
		currentRow++;

		
		XSSFCellStyle bodyCellStyle = (XSSFCellStyle)workbook.createCellStyle();
		bodyCellStyle.setBorderTop(XSSFCellStyle.BORDER_THIN);
		bodyCellStyle.setBorderBottom(XSSFCellStyle.BORDER_THIN);
		bodyCellStyle.setBorderLeft(XSSFCellStyle.BORDER_THIN);
		bodyCellStyle.setBorderRight(XSSFCellStyle.BORDER_THIN);
		bodyCellStyle.setAlignment(XSSFCellStyle.ALIGN_CENTER);	
		bodyCellStyle.setVerticalAlignment(XSSFCellStyle.VERTICAL_CENTER);
		
		// LINE 2+
		for(int k=0;k<result.size();k++){
			Map data=null;
			try{
				data=BeanUtils.describe(result.get(k));
				//logger.debug("Bean Describe: "+data);
			}catch(IllegalAccessException e){
				e.printStackTrace();
				System.out.println("IllegalAccessException");
			}catch(InvocationTargetException e){
				e.printStackTrace();
				System.out.println("InvocationTargetException");
			}catch(NoSuchMethodException e){
				e.printStackTrace();
				System.out.println("NoSuchMethodException");
			}

			XSSFRow row=sheet.createRow(k+currentRow);
			row.setHeight((short)0x190);
			for(int i=0;i<columnName.length;i++){
				//logger.debug(columnName[i]+" : "+data.get(columnName[i]));				
				XSSFCell body = row.createCell(i);
				body.setCellValue((String)data.get(columnName[i]));	
				body.setCellStyle(bodyCellStyle);	
			}
		}
	}
	
	protected XSSFCell getCell(XSSFSheet sheet, int row, int col, short height) {
		XSSFRow sheetRow = sheet.getRow(row);
		if (sheetRow == null) {
			sheetRow = sheet.createRow(row);
		}
		sheetRow.setHeight(height);
		XSSFCell cell = sheetRow.getCell((short) col);
		if (cell == null) {
			cell = sheetRow.createCell((short) col);
		}
		return cell;
	}

	protected void setText(XSSFCell cell, String text) {
		cell.setCellType(XSSFCell.CELL_TYPE_STRING);
		cell.setCellValue(text);
	}
}