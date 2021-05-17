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
											<div class="col-lg-1" id="where_dt">
							                    <select class="form-control" id="dttype" style="width:140px;">
							                    </select>
											</div>
											<div class="col-lg-2">
					                            <div class="input-daterange input-group"">
					                            	<div class="input-group-prepend">
                                                        <span class="input-group-text fs-xl">
                                                             <i class="fal fa-calendar"></i>  
                                                         </span>
                                                    </div>
					                                <input type="text" class="form-control" name="frdt" id="frdt" onkeydown="onlyDatepicker(event)"  style="width:100px;">
					                                <select class="form-control" id="frtm" style="width:70px;"></select>
					                            </div>
					                        </div>
											<div class="col-lg-2">
					                            <div class="input-daterange input-group">
					                            	<div class="input-group-prepend">
                                                        <span class="input-group-text fs-xl">
                                                             <i class="fal fa-calendar"></i>  
                                                         </span>
                                                    </div>
					                                <input type="text" class="form-control" name="todt" id="todt" onkeydown="onlyDatepicker(event)" style="width:100px;">
					                                <select class="form-control" id="totm" style="width:70px;"></select>
					                            </div>
					                        </div>
					                        <div class="col-lg-2" id="where_maintel">
				                                <select class="form-control" id="maintel" style="width:140px;"></select>
					                        </div>
					                        <div class="col-lg-2" id="where_agent">
				                                <select class="form-control" id="agent" style="width:70px;"></select>
					                        </div>
					                        <div class="col-lg-2" id="where_ani">
				                                <select class="form-control" id="ani" style="width:70px;"></select>
					                        </div>
											<div class="col-lg-2" style="padding-top:2px;">  
												<button id="btnSearch" 	type="button" class="btn btn-primary btn-sm">검색</button>&nbsp;&nbsp;
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

       
<%@ include file="/WEB-INF/views/common/CommonJs.jsp" %>
<script src="${contextpath}/static/common/js/common.js"></script> 
<script type="text/javascript"> 
$(function() { 
	
	var report_id = '${result.report_id}'
	var report_nm = '${result.report_nm}'
	var report_type = '${result.report_type}'
	var report_type_nm = '${result.report_type_nm}'
	var report_temp = '${result.report_temp}'
	var report_temp_nm = '${result.report_temp_nm}'
	var report_div = '${result.report_div}'
	var procnm = '${result.procnm}';
	var dttype = '${result.dttype}';
	var header = '${result.header}';
	var cols = '${result.cols}';
	var align = '${result.align}';
	var frdt = '${result.frdt}';
	var todt = '${result.todt}';
	var frtm = '${result.frtm}';
	var totm = '${result.totm}';
	var maintel = '${result.maintel}';
	var agent = '${result.agent}';
	
	if(maintel=='') $("#maintel").hide();
	if(agent=='') $("#agent").hide();
	 
	/*
	console.log(report_id);
	console.log(report_nm);
	console.log(report_type);
	console.log(report_type_nm);
	console.log(report_temp);
	console.log(report_temp_nm);
	console.log(report_div);
	console.log(procnm);
	console.log(dttype);
	console.log(header);
	console.log(cols);
	console.log(align);
	console.log(frdt);
	console.log(todt);
	console.log(frtm); 
	console.log(totm);
	console.log(maintel);
	console.log(agent);
	*/
	
	//조건만들기
	Service.requestChildList(report_temp, dttype, maintel);
	
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
		
	console.log(_columnDefs);
	console.log(dataJsonArray); 
	
	
	//$("#dttype").attr("disabled", true);
	
	var controls = {
        leftArrow: '<i class="fal fa-angle-left" style="font-size: 1.25rem"></i>',
        rightArrow: '<i class="fal fa-angle-right" style="font-size: 1.25rem"></i>' 
    }
	$('#frdt').datepicker({
        todayHighlight: true,
        orientation: "bottom left",
        templates: controls,
      	format : "yyyy-mm-dd"
    });
    //.attr('disabled', true);
	
	$('#todt').datepicker({
        todayHighlight: true,
        orientation: "bottom left",
        templates: controls,
      	format : "yyyy-mm-dd"
    });
    //.attr('disabled', true);
	
	//$("#frdt").val(getCurrentDate(0,"-")); 
	//$("#todt").val(getCurrentDate(0,"-")); 
	
	$("#frdt").val(frdt); 
	$("#todt").val(todt); 
	
	
	//$("#frtm").attr('disabled', true);
	//$("#totm").attr('disabled', true);
	getSelectHour('frtm', frtm, '시');
	getSelectHour('totm', totm, '시');
	
	
	var strUrl = "${contextpath}/statsipcc/reportList.json";
	strUrl += '?rid='+encodeURIComponent(procnm);
	strUrl += '&dttype='+encodeURIComponent(dttype);
	strUrl += '&frdt='+encodeURIComponent(frdt);
	strUrl += '&frtm='+encodeURIComponent(frtm);
	strUrl += '&todt='+encodeURIComponent(todt);
	strUrl += '&totm='+encodeURIComponent(totm);
	strUrl += '&maintel='+encodeURIComponent(maintel);
	
	
	/***** Start - DataTables *****/
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
	function updateResultTable(){
		var dttype = $("#dttype").val();
		var strUrl = "${contextpath}/statsipcc/reportList.json";
		strUrl += '?rid='+encodeURIComponent(procnm);
		strUrl += '&dttype='+encodeURIComponent(dttype);
		strUrl += '&frdt='+encodeURIComponent($('#frdt').val());
		strUrl += '&frtm='+encodeURIComponent($('#frtm').val());
		strUrl += '&todt='+encodeURIComponent($('#todt').val());
		strUrl += '&totm='+encodeURIComponent($('#totm').val());
		strUrl += '&maintel='+encodeURIComponent($('#maintel').val());
		console.log(strUrl);
		dataTable.api().ajax.url(strUrl).load();	
		//dataTable.DataTable().ajax.reload(null, false);	
	}
	/***** End - DataTables *****/
	
	//조회
	$("#btnSearch").click(clickBtnSearch=function(){
		updateResultTable();
	});
	
	
	
	
});//jQuery

var Service = {
	requestChildList : function(rpt_par_id, dttype, maintel) {
		$("#where_dt").hide();
		$("#where_maintel").hide();
	    $("#where_agent").hide();
	    $("#where_ani").hide();
		var ajaxParam = {
            "url" : "${contextpath}/wizard/reportChildList.json",
            "type" : "POST", 
        	"data" : {
        		"rpt_par_id" : rpt_par_id,
        		"rpt_div" : "WHERE"
            }
        };
		Common.ajaxJSON(ajaxParam, function(data) { 
			$.each(data.resultList, function(index, item) {
				console.log(item.tv01);
				if(item.tv01=='where_dt'){
					$("#dttype option").remove();
					var dtArr = item.tv02.split("/");
					dtArr.forEach(function(item, index){
						var item_nm = "";
						if(item=='D') item_nm="일별";
						if(item=='M') item_nm="월별";
						if(item=='H') item_nm="시간대별";
						if(item=='DH') item_nm="일별시간대별";
						$("#dttype").append("<option value='"+item+"'>"+item_nm+"</option>");
					});
					$("#dttype").val(dttype);
					$("#where_dt").show();
				}else if(item.tv01=='where_maintel'){
					$("#maintel option").remove();
					$("#maintel").append("<option value='"+maintel+"'>전체</option>");
					var telArr = maintel.split(",");
					console.log(telArr);
					telArr.forEach(function(item, index){
						$("#maintel").append("<option value='"+item+"'>"+item+"</option>");
					});
					if(maintel==''){
						$("#where_maintel").hide();
					}else{
						$("#where_maintel").show();
					}
				}	
				
				
	    	});
		});
	}
}
</script>		
