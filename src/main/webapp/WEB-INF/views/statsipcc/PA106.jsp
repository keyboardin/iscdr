<!-- PA106.jsp 응답콜분포통계 -->
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
							                    	<option value="H">시간대별</option>
							                    	<option value="DH">일별시간대별</option>
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
							<table id="dataTable" class="table table-bordered table-hover w-100">
	                        	<thead>
									<tr>	
										<th class="text-center" style="width: 8%;">일자</th> 
										<th class="text-center" style="width: 4%;">시간</th> 
										<th class="text-center">요청콜</th>   
										<th class="text-center">응답콜</th>   
										<th class="text-center">응답율(%)</th>   
										
										<th class="text-center">평균응답시간</th> 
										<th class="text-center">10초이내</th>   
										<th class="text-center">20초이내</th>   
										<th class="text-center">30초이내</th>   
										<th class="text-center">40초이내</th>  

										<th class="text-center">50초이내</th>   
										<th class="text-center">60초이내</th>   
										<th class="text-center">60초이상</th>   
									</tr>
	                        	</thead>
	                        </table> 
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
	
	var strUrl = "${contextpath}/statsipcc/reportList.json";
	strUrl += '?rid='+encodeURIComponent('PA106');
	strUrl += '&dttype='+encodeURIComponent($("#dttype").val());
	strUrl += '&frdt='+encodeURIComponent($('#frdt').val());
	strUrl += '&frtm='+encodeURIComponent($('#frtm').val());
	strUrl += '&todt='+encodeURIComponent($('#todt').val());
	strUrl += '&totm='+encodeURIComponent($('#totm').val());
	strUrl += '&maintel='+encodeURIComponent('');
	
	
	/***** Start - DataTables *****/
	var dataTable = $('#dataTable').dataTable({
		"searching": false,
		"search":{		
			"caseInsensitive": false	//대소문자구분
		},
		"lengthChange": false,  
    	"pageLength": 10, 
    	"lengthMenu": [10, 20, 30],
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
	  	"columnDefs": [  
	  		{ 	"targets":[0], "searchable":false, "sortable":false		},	
			{ 	"targets":[1], "searchable":false, "sortable":false, "visible":false	},
			{ 	"targets":[2], "searchable":false, "sortable":false		},
			{ 	"targets":[3], "searchable":false, "sortable":false		}, 
			{ 	"targets":[4], "searchable":false, "sortable":false		}, 
			
			{ 	"targets":[5], "searchable":false, "sortable":false		},
			{ 	"targets":[6], "searchable":false, "sortable":false		},
			{ 	"targets":[7], "searchable":false, "sortable":false		},
			{ 	"targets":[8], "searchable":false, "sortable":false		},
			{ 	"targets":[9], "searchable":false, "sortable":false		}, 
			
			{ 	"targets":[10], "searchable":false, "sortable":false	},
			{ 	"targets":[11], "searchable":false, "sortable":false	},
			{ 	"targets":[12], "searchable":false, "sortable":false	}
       	],	  	
	  	"columns": [
	    	{ 	"data":"DT", 				className:"text-center"		},	 
	    	{ 	"data":"TM", 				className:"text-center"		},	 
	    	{ 	"data":"AgtReqCall",		className:"text-right"		},
	    	{ 	"data":"AgtAnsCall",		className:"text-right" 		},
	    	{ 	"data":"AgtAnsCallRate",	className:"text-right" 		},	    

			{ 	"data":"AbnTimeAvg",		className:"text-center" 	},
	    	{ 	"data":"AgtAns10sCall",		className:"text-right" 		},
	    	{ 	"data":"AgtAns20sCall",		className:"text-right" 		},
	    	{ 	"data":"AgtAns30sCall",		className:"text-right" 		},
	    	{ 	"data":"AgtAns40sCall",		className:"text-right"		},

			{ 	"data":"AgtAns50sCall",		className:"text-right"		},
	    	{ 	"data":"AgtAns60sCall",		className:"text-right"		},
	    	{ 	"data":"AgtAns60sOverCall",	className:"text-right"		}
	    ],
	    //"order":[0,"asc"],
	    "ordering":false,
	    "fnRowCallback":function(nRow, aData, iDisplayIndex, iDisplayIndexFull ) {
	    	//dataTable.api().column(1).visible(false);
   	  	}
    });	
	
	$('div.dataTables_filter input').unbind();
	$('div.dataTables_filter input').bind('keyup', function(e) {
    	if(e.keyCode == 13) {
        	dataTable.fnFilter(this.value);   
    	}
	}); 
	
	//조회
	function updateResultTable(){
		var dttype = $("#dttype").val();
		if(dttype=='H'){
			dataTable.api().column(0).visible(false);
			dataTable.api().column(1).visible(true);
		} else if(dttype=='DH') {
			dataTable.api().column(0).visible(true);
			dataTable.api().column(1).visible(true);	
		} else {
			dataTable.api().column(0).visible(true);
			dataTable.api().column(1).visible(false);
		}
		
		var strUrl = "${contextpath}/statsipcc/reportList.json";
		strUrl += '?rid='+encodeURIComponent('PA106');
		strUrl += '&dttype='+encodeURIComponent(dttype);
		strUrl += '&frdt='+encodeURIComponent($('#frdt').val());
		strUrl += '&frtm='+encodeURIComponent($('#frtm').val());
		strUrl += '&todt='+encodeURIComponent($('#todt').val());
		strUrl += '&totm='+encodeURIComponent($('#totm').val());
		strUrl += '&maintel='+encodeURIComponent('');
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
	
}
</script>		
<%@ include file="/WEB-INF/views/common/CommonBottom.jsp" %>
