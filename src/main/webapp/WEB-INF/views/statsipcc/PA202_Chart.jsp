<!-- PA202_Chart.jsp 상담월실적챠트 -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/CommonCss.jsp" %>
<%@ include file="/WEB-INF/views/common/CommonHeader.jsp" %> 
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
    font-size: 0.77rem;
}
.table th {
    padding: 0.4rem 0.2rem 0.4rem 0.2rem;
}
-->
</style>
<!-- BEGIN Page Content -->
<main id="js-page-content" role="main" class="page-content">
	<ol class="breadcrumb page-breadcrumb" id="menu_title">
		&nbsp; 
	</ol>
   
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
											<div class="col-lg-2">
							                    <select class="form-control" id="dttype" style="width:140px;">
							                    	<option value="D">일별</option>
							                    	<option value="M">월별</option>
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
											<div class="col-lg-3" style="padding-top:2px;">  
												<button id="btnSearch" 	type="button" class="btn btn-primary btn-sm">검색</button>&nbsp;&nbsp;
											</div> 
										</div>
									</div>  
								</div>
							</div>  
						</div>
						<div class="frame-wrap">
							<div id="widget" style="height:300px !important;"></div>
						</div>                                            
					</div>
				</div>
			</div>  
		</div>                                      
	</div>
</main>
<!-- END Page Content -->     

       
<%@ include file="/WEB-INF/views/common/CommonFooter.jsp" %>                    
<%@ include file="/WEB-INF/views/common/CommonJs.jsp" %>
<!-- C3 Chart -->
<script src="${contextpath}/static/plugin/c3/d3-5.4.0.min.js"></script>
<script src="${contextpath}/static/plugin/c3/c3.js"></script>
<script src="${contextpath}/static/common/js/common.js"></script> 
<script type="text/javascript"> 
$(function() { 
	
	setTitle("${param.menu_par_id}","${param.menu_id}");
	
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
	$('#todt').datepicker({
        todayHighlight: true,
        orientation: "bottom left",
        templates: controls,
      	format : "yyyy-mm-dd"
    });
	
	//$("#frdt").val(getCurrentDate(0,"-")); 
	//$("#todt").val(getCurrentDate(0,"-")); 
	
	$("#frdt").val('2019-01-07'); 
	$("#todt").val('2019-01-07'); 
	
	getSelectHour('frtm', '00', '시');
	getSelectHour('totm', '23', '시');
	
	
	/***** Start - Chart *****/
	var widget, widget_data, widget_tick, widget_color;
	function createWidget(){
		var strUrl = "${contextpath}/statsipcc/reportList.json";
		strUrl += '?rid='+encodeURIComponent('PA202');
		strUrl += '&dttype='+encodeURIComponent($("#dttype").val());
		strUrl += '&frdt='+encodeURIComponent($('#frdt').val());
		strUrl += '&frtm='+encodeURIComponent($('#frtm').val());
		strUrl += '&todt='+encodeURIComponent($('#todt').val());
		strUrl += '&totm='+encodeURIComponent($('#totm').val());
		strUrl += '&maintel='+encodeURIComponent('');
		
		var ajaxParam = {
	    	"url" : strUrl,
	        "type" : "POST",
	       	"data" : {	       		
	        },
	        //"loading" : "widget_body"    
	   	}; 
		
		var widget_data=new Array;
		var widget_data1=new Array;
		//var widget_data2=new Array;
		//var widget_data3=new Array;
		var widget_tick=new Array;
		var widget_color=new Array; 
	   	
		Common.ajaxJSON(ajaxParam, function(data) {  
			widget_data1.push("IbAgtCall");
			//widget_data2.push("ArsEndCall");
			//widget_data3.push("AgtReqCall");
			widget_tick.push("x");

			$.each(data.data, function(index, item){
				widget_data1.push(item.IbAgtCall);
				//widget_data2.push(item.ArsEndCall); 
				//widget_data3.push(item.AgtReqCall); 
				widget_tick.push(item.AgentName);
			}); 
			widget_data.push(widget_data1);
			//widget_data.push(widget_data2);
			//widget_data.push(widget_data3);
			widget_data.push(widget_tick);
			var widget_colors={
				IbAgtCall: '#6a9ab5'
	   			//,ArsEndCall: '#c14530'
	   			//,ArsEndCall: '#ffa72c'
	        }
			
			var bar_chart = Chart.drawC3BarChart("widget", widget_data, widget_colors, 20);
		
	   	});
	}
	createWidget();
	/***** End - Chart *****/
	
	//조회
	$("#btnSearch").click(clickBtnSearch=function(){
		createWidget();
	});
	
	
});//jQuery

var Chart = {
	drawC3BarChart:function(_id, _data, _colors, _width){
		var bar_chart = c3.generate({
			bindto: '#'+_id, 
			data: {
				type: "bar",
		    	x: "x",
		    	columns: _data,
		   	 	colors: _colors
		  	},
		  	axis: {	 
		  		x: {
		  			type: "category" 
		  		}
		  	},
		  	legend: {
		  		show: false
		  	},
		  	bar:{
		  		width: _width		  	
		  	}
		});
		return bar_chart;
	}
}
</script>		
<%@ include file="/WEB-INF/views/common/CommonBottom.jsp" %>
