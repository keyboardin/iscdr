<!-- PA101.jsp 종합콜현황 -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/CommonCss.jsp" %>
<style>
<!--
.table.dataTable th {
    background: #6a9ab5 !important;
    color: #ffffff !important;
}
.table th, .table td {
    padding: 0.2rem; 
    vertical-align: top;
    border-top: 1px solid #e9e9e9;
    font-size: 0.8rem;
}
.table th {
    padding: 0.4rem 0.2rem 0.4rem 0.2rem;
}
.form-group {
    margin-bottom: 0.5rem;
}
-->
</style>
<!-- BEGIN Page Content -->
<main id="js-page-content" role="main" class="page-content">
	<div class="row">  
		<div class="col-lg-12 col-xl-12">
			<div id="panel-1" class="panel">
				<div class="panel-container show">
					<div class="panel-content"> 
						<div class="frame-wrap mb-0">
							<div class="card mb-g">
								<div class="card-body">
									<div class="form-group">
					            		<div class="row">
					            			<div class="col-md-1">
					                    		<label class="form-label pt-2" for="report_type_nm">보고서 타입</label> 
					                    	</div>
					                    	<div class="col-md-4">
					                    		<input id="report_type_nm" type="text" class="form-control" autocomplete="off">  
					                    	</div>
					                    </div>
					                </div>
					                <div class="form-group">
					            		<div class="row">
					            			<div class="col-md-1">
					                    		<label class="form-label pt-2" for="report_temp_nm">보고서 양식</label> 
					                    	</div>
					                    	<div class="col-md-4">
					                    		<input id="report_temp_nm" type="text" class="form-control" autocomplete="off">  
					                    	</div>
					                    </div>
					                </div>
					                <div class="form-group" id="where_dttype">
					            		<div class="row">
					            			<div class="col-md-1">
					                    		<label class="form-label pt-2" for="dttype">구분</label> 
					                    	</div>
					                    	<div class="col-md-6">
					                    		<select class="form-control" id="dttype" style="width:140px;">
							                    	<!-- 
							                    	<option value="D">일별</option>
							                    	<option value="M">월별</option>
													<option value="H">시간대별</option>
							                    	<option value="DH">일별시간대별</option> 
							                    	-->
							                    </select>
					                    	</div>
					                    </div>
					                </div>
					                <div class="form-group" id="where_datetime">
					            		<div class="row">
					            			<div class="col-md-1">
					                    		<label class="form-label pt-2" for="">기간</label> 
					                    	</div>
							                <div class="col-lg-2">
					                            <div class="input-daterange input-group"">
					                            	<div class="input-group-prepend">
			                                            <span class="input-group-text fs-xl"><i class="fal fa-calendar"></i></span>
			                                         </div>
					                                <input type="text" class="form-control" name="frdt" id="frdt" onkeydown="onlyDatepicker(event)"  style="width:100px;">
					                                <select class="form-control" id="frtm" style="width:70px;"></select>
					                            </div>
					                        </div>
											<div class="col-lg-2">
					                            <div class="input-daterange input-group">
					                            	<div class="input-group-prepend">
			                                            <span class="input-group-text fs-xl"><i class="fal fa-calendar"></i></span>
			                                        </div>
					                                <input type="text" class="form-control" name="todt" id="todt" onkeydown="onlyDatepicker(event)" style="width:100px;">
					                                <select class="form-control" id="totm" style="width:70px;"></select>
					                            </div>
					                        </div>
										</div>
									</div>
					                <div class="form-group" id="where_maintel">
					            		<div class="row">
					            			<div class="col-md-1">
					                    		<label class="form-label pt-2" for="maintel">대표번호</label> 
					                    	</div>
					                    	<div class="col-md-4">
					                    		<select id="maintel" class="form-control"></select>
					                    		<input type="hidden" id="maintelAll">
					                    	</div>
					                    </div>
					                </div>
					                <div class="form-group" id="where_agent">
					            		<div class="row">
					            			<div class="col-md-1">
					                    		<label class="form-label pt-2" for="maintel">상담원</label> 
					                    	</div>
					                    	<div class="col-md-4">
					                    		<select id="agent" class="form-control"></select>
					                    		<input type="hidden" id="agentAll">
					                    	</div>
					                    </div>
					                </div>
					                <div class="form-group" id="where_ani">
					            		<div class="row">
					            			<div class="col-md-1">
					                    		<label class="form-label pt-2" for="maintel">고객번호</label> 
					                    	</div>
					                    	<div class="col-md-4">
					                    		<input id="ani" type="text" class="form-control" autocomplete="off">  
					                    	</div>
					                    </div>
					                </div>
					                <div class="form-group">
					            		<div class="row">
					            			<div class="col-md-1">
					                    		<label class="form-label pt-2" for="report_nm">보고서명</label> 
					                    	</div>
					                    	<div class="col-md-4">
					                    		<input id="report_nm" type="text" class="form-control" autocomplete="off">  
					                    	</div>
					                    	<div class="col-lg-3" style="padding-top:2px;">  
												<button id="btnSearch" 	type="button" class="btn btn-primary btn-sm">검색</button>&nbsp;&nbsp;
												<button id="btnSave" 	type="button" class="btn btn-primary btn-sm">저장</button>&nbsp;&nbsp;
											</div> 
					                    </div>
					                </div>
								</div>
							</div>  
						</div>
						<div class="frame-wrap">
							<table id="dataTable" class="table table-bordered table-hover w-100">
	                        </table> 
						</div>                                            
					</div>
				</div>
			</div>  
		</div>                                      
	</div>
</main>
<!-- END Page Content -->     
<input type="hidden" id="p_report_type" >
<input type="hidden" id="p_report_temp" >
<input type="hidden" id="p_procnm" >
<input type="hidden" id="p_condition" >
<input type="hidden" id="p_dt_condition" >
<input type="hidden" id="p_dttype" >
<input type="hidden" id="p_frdt" >
<input type="hidden" id="p_todt" >
<input type="hidden" id="p_frtm" >
<input type="hidden" id="p_totm" >
<input type="hidden" id="p_maintel" >
<input type="hidden" id="p_agent" >
<input type="hidden" id="p_ani" >
<input type="hidden" id="p_header" >
<input type="hidden" id="p_cols" >
<input type="hidden" id="p_align" >
<%@ include file="/WEB-INF/views/common/CommonJs.jsp" %>
<script src="${contextpath}/static/common/js/common.js"></script> 
<script type="text/javascript"> 
$(function() { 
	
	var report_type = '${result.report_type}';
	var report_type_nm = '${result.report_type_nm}';
	var report_temp = '${result.report_temp}';
	var report_temp_nm = '${result.report_temp_nm}';
	var procnm = '${result.procnm}';
	var condition = '${result.condition}';
	var dt_condition = '${result.dt_condition}';
	var dttype = '${result.dttype}';
	var frdt = '${result.frdt}';
	var todt = '${result.todt}';
	var frtm = '${result.frtm}';
	var totm = '${result.totm}';
	var maintel = '${result.maintel}';
	var agent = '${result.agent}';
	var ani = '${result.ani}';
	var header = '${result.header}';
	var cols = '${result.cols}';
	var align = '${result.align}';
	console.log("report_type : "+report_type);
	console.log("report_type_nm : "+report_type_nm);
	console.log("report_type : "+report_temp);
	console.log("report_temp_nm : "+report_temp_nm);
	console.log("procnm : "+procnm);	
	console.log("condition : "+condition);	
	console.log("dt_condition : "+dt_condition);	
	console.log("dttype : "+dttype);
	console.log("frdt : "+frdt);
	console.log("todt : "+todt);
	console.log("frtm : "+frtm); 
	console.log("totm : "+totm);
	console.log("maintel : "+maintel);	
	console.log("agent : "+agent);	
	console.log("ani : "+ani);	
	console.log("header : "+header);
	console.log("cols : "+cols);
	console.log("align : "+align);
	
	//params
	$("#p_report_type").val(report_type);
	$("#p_report_temp").val(report_temp);
	$("#p_procnm").val(procnm);
	$("#p_condition").val(condition);
	$("#p_dt_condition").val(dt_condition);
	$("#p_dttype").val(dttype);
	$("#p_frdt").val(frdt);
	$("#p_todt").val(todt);
	$("#p_frtm").val(frtm);
	$("#p_totm").val(totm);
	$("#p_maintel").val(maintel);
	$("#p_agent").val(agent);
	$("#p_ani").val(ani);
	$("#p_header").val(header);
	$("#p_cols").val(cols);
	$("#p_align").val(align);
	
	/***** Start - 검색조건 *****/
	$("#report_type_nm").val(report_type_nm).attr("disabled", true);
	$("#report_temp_nm").val(report_temp_nm).attr("disabled", true);
	
	//일자
	var controls = {
        leftArrow: '<i class="fal fa-angle-left" style="font-size: 1.25rem"></i>',
        rightArrow: '<i class="fal fa-angle-right" style="font-size: 1.25rem"></i>' 
    }
	$('#frdt').datepicker({
        todayHighlight: true,
        orientation: "bottom left",
        templates: controls,
      	format : "yyyy-mm-dd"
    }).val(frdt);
    //.attr('disabled', true);
	
	$('#todt').datepicker({
        todayHighlight: true,
        orientation: "bottom left",
        templates: controls,
      	format : "yyyy-mm-dd"
    }).val(todt);
    //.attr('disabled', true);
	
	getSelectHour('frtm', frtm, '시');
	getSelectHour('totm', totm, '시');
		
	//일자구분
	if(dt_condition!=""){
		$("#dttype option").remove();
		var dt_condition2 = dt_condition.split("/");
		dt_condition2.forEach(function(item, i){
			//console.log(item);
			var item_nm = "";
			if(item=='D') item_nm="일별";
			if(item=='M') item_nm="월별";
			if(item=='H') item_nm="시간대별";
			if(item=='DH') item_nm="일별시간대별";
			$("#dttype").append("<option value='"+item+"'>"+item_nm+"</option>");
		});
		$("#dttype").val(dttype); //.attr("disabled", true);
	}	
	
	//대표번호
	var maintelAll="";
	if(maintel!=""){
		$("#maintel option").remove();
		$("#maintel").append("<option value=''>선택</option>");
		var json = eval(maintel);
		json.forEach(function(item, i){
			$("#maintel").append("<option value='"+item.id+"'>"+item.text+"</option>");
			if((json.length-1)==i) maintelAll += item.id;
			else maintelAll += item.id+",";
		});
		$("#maintelAll").val(maintelAll);
		console.log(maintelAll);
	}
	
	//상담원
	var agentAll="";
	if(agent!=""){
		$("#agent option").remove();
		$("#agent").append("<option value=''>선택</option>");
		var json = eval(agent);
		json.forEach(function(item, i){
			//console.log(item.id);
			//console.log(item.text);
			$("#agent").append("<option value='"+item.id+"'>"+item.text+"</option>");
			if((json.length-1)==i) agentAll += item.id;
			else agentAll += item.id+",";
		});
		$("#agentAll").val(agentAll);
		console.log(agentAll);
	}
	
	//검색조건보기
	$("#where_dttype").hide();
	$("#where_datetime").hide();
	$("#where_maintel").hide();
	$("#where_agent").hide();
	$("#where_ani").hide();
	var conditions = condition.split(",");	
	conditions.forEach(function(item){
		//console.log(item);
		$("#"+item).show();
	});
	/***** End - 조건구성 *****/
	
	
	/***** Start - DataTables *****/
	var headerArr = header.split(',');
	var colsArr = cols.split(',');
	var alignArr = align.split(',');
		
	var htmlHeader="";
	htmlHeader += "<thead>";
	htmlHeader += "  <tr>";
	headerArr.forEach(function(element, i, array){
		htmlHeader += "  	<th class='text-center'>";
		htmlHeader += element;
		htmlHeader += "  	</th>";
	});
	htmlHeader += "  </tr>";
	htmlHeader += "</thead>";
	$("#dataTable").html(htmlHeader);	
	
	var colJsonArray = new Array();
	var dataJsonArray = new Array();
	colsArr.forEach(function(element, i, array){
		var colJson = new Object();
		colJson.targets=[i];
		colJson.searchable=false;
		colJson.sortable=false;
		colJsonArray.push(colJson);
		
		var dataJson= {		data:element, className:'text-'+alignArr[i]	};
		//console.log(dataJson);
		dataJsonArray.push(dataJson);
		//var dataJson = new Object();
		//dataJson.data=element;
		//dataJson.className=alignArr[i];
		//dataJsonArray.push(dataJson);
	});	
	
	var _columnDefs = JSON.stringify(colJsonArray);
	//var _columns = JSON.stringify(dataJsonArray);
	//console.log(_columnDefs);
	//console.log(dataJsonArray); 
	
	var strUrl = "${contextpath}/statsipcc/reportList.json";
	strUrl += '?rid='+encodeURIComponent(procnm);
	strUrl += '&dttype='+encodeURIComponent(dttype);
	strUrl += '&frdt='+encodeURIComponent(frdt);
	strUrl += '&frtm='+encodeURIComponent(frtm);
	strUrl += '&todt='+encodeURIComponent(todt);
	strUrl += '&totm='+encodeURIComponent(totm);
	strUrl += '&maintel='+encodeURIComponent($("#maintelAll").val());
	strUrl += '&agent='+encodeURIComponent($("#agentAll").val());
	strUrl += '&ani='+encodeURIComponent("");
	
	var	dataTable = $('#dataTable').dataTable({
		"searching": false,
		"search":{		
			"caseInsensitive": false	//대소문자구분
		},
		"lengthChange": false,  
    	//"pageLength": 10, 
    	//"lengthMenu": [10, 20, 30],
    	"info": false,
    	"paging": false,
    	"serverSide": false, 
    	"processing": true, 
    	"responsive": true,
	  	"autoWidth": true, 
	  	"language": {
           "loadingRecords": ""
        },	
      	"ajax":{ 
      		"url":strUrl,
		  	"type":"POST" 
	  	},
	  	"dom": '<"top"lf>rt<"bottom"ip><"clear">',
	  	"columnDefs": _columnDefs,	  	
	  	"columns": dataJsonArray, 
    	//"order":[0,"asc"],
	    "ordering":false,
	    "fnRowCallback":function(nRow, aData, iDisplayIndex, iDisplayIndexFull ) {
	    	//dataTable.api().column(1).visible(false);
   	  	} 
    });	
	
	//조회
	$("#btnSearch").click(clickBtnSearch=function(){
		updateResultTable();
	});
	
	//조회
	function updateResultTable(){
		var strUrl = "${contextpath}/statsipcc/reportList.json";
		strUrl += '?rid='+encodeURIComponent(procnm);
		var dttype 	= ($("#dttype").val()==null||$("#dttype").val()=='') ? '' : $("#dttype").val();
		var maintel = ($("#maintel").val()==null||$("#maintel").val()=='') ? $("#maintelAll").val() : $("#maintel").val();
		var agent 	= ($("#agent").val()==null||$("#agent").val()=='') ? $("#agentAll").val() : $("#agent").val();
		
		strUrl += '&dttype='+encodeURIComponent(dttype);
		strUrl += '&frdt='+encodeURIComponent($("#frdt").val());
		strUrl += '&frtm='+encodeURIComponent($("#frtm").val());
		strUrl += '&todt='+encodeURIComponent($("#todt").val());
		strUrl += '&totm='+encodeURIComponent($("#totm").val());
		strUrl += '&maintel='+encodeURIComponent(maintel);
		strUrl += '&agent='+encodeURIComponent(agent);
		strUrl += '&ani='+encodeURIComponent($("#ani").val());
		dataTable.api().ajax.url(strUrl).load();	
		//dataTable.DataTable().ajax.reload(null, false);	
	}
	/***** End - DataTables *****/
	
	//저장
	$('#btnSave').click(clickBtnSave=function(){
		if(!Service.checkForm()) return;
		Service.requestInsert();
	});	
	
	
});//jQuery

var Service = {
	//입력 폼 체크
	checkForm : function(){
		if(!$.notnull($('#report_nm'), '보고서명')) return false;
		return true;
	},	
	//insert
	requestInsert : function() {
		var ajaxParam = {
            "url" : "${contextpath}/wizard/reportInsert.json",
            "type" : "POST",
        	"data" : {
        		"report_nm" : $("#report_nm").val(),
    			"report_type" : $("#p_report_type").val(),
    			"report_temp" : $("#p_report_temp").val(),
    			"procnm" : $("#p_procnm").val(),
    			"condition" : $("#p_condition").val(),
    			"dt_condition" : $("#p_dt_condition").val(),
    			"dttype" : $("#p_dttype").val(),
    			"frdt" : $("#p_frdt").val(),
    			"todt" : $("#p_todt").val(),
    			"frtm" : $("#p_frtm").val(),
    			"totm" : $("#p_totm").val(),
    			"maintel" : $("#p_maintel").val(),
    			"agent" : $("#p_agent").val(),
    			"header" : $("#p_header").val(),
    			"cols" : $("#p_cols").val(),
    			"align" : $("#p_align").val()
            }
        };
        Common.ajaxJSON(ajaxParam, function(data) {
        	if(!data){
				alert('return data error');
				return false;
			}
			alert(data.msg);
			window.close();
			opener.location.href="${contextpath}/wizard/report.do?menu_par_id=R000&menu_id=R000"
			if(!data.success) return;
        });
	},
}
</script>		
