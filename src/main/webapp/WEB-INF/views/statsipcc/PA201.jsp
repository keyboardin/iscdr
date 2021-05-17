<!-- PA201.jsp 상담콜처리현황 -->
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
							<table id="dataTable" class="table table-bordered table-hover w-100">
	                        	<thead>
									<tr>	
										<th class="text-center" rowspan="2" style="vertical-align: middle;">일자</th> 
										<th class="text-center" rowspan="2" style="vertical-align: middle;">조직</th> 
										<th class="text-center" rowspan="2" style="vertical-align: middle;">상담직원</th>     
										<th class="text-center" rowspan="2" style="vertical-align: middle;">내선</th> 
										<th class="text-center" colspan="10">인입</th> 
										
										<th class="text-center" rowspan="2" style="vertical-align: middle;">이석시간</th>
										<th class="text-center" rowspan="2" style="vertical-align: middle;">대기시간</th> 
										<th class="text-center" colspan="7">발신</th>
									</tr>
									<tr>	
										<th class="text-center">인입콜</th> 
										
										<th class="text-center">통화콜</th> 
										<th class="text-center">링포기</th> 
										<th class="text-center">무시콜</th> 
										<th class="text-center">호전환수신</th> 
										<th class="text-center">호전환발신</th> 
										
										<th class="text-center">통화시간</th> 
										<th class="text-center">1콜통화시간</th> 
										<th class="text-center">후처리</th> 
										<th class="text-center">1콜후처리시간</th> 
										
										<th class="text-center">시도콜</th>  
										<th class="text-center">발신성공</th>
										<th class="text-center">호전환발신</th> 
										<th class="text-center">통화시간</th>
										<th class="text-center">1콜당통화시간</th> 
										<th class="text-center">후처리</th> 
										<th class="text-center">1콜후처리시간</th> 
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
	strUrl += '?rid='+encodeURIComponent('PA201');
	strUrl += '&dttype='+encodeURIComponent($("#dttype").val());
	strUrl += '&frdt='+encodeURIComponent($('#frdt').val());
	strUrl += '&frtm='+encodeURIComponent($('#frtm').val());
	strUrl += '&todt='+encodeURIComponent($('#todt').val());
	strUrl += '&totm='+encodeURIComponent($('#totm').val());
	strUrl += '&agent='+encodeURIComponent('');

	
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
	  		{ 	"targets":[1], "searchable":false, "sortable":false		},
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
	  		{ 	"targets":[12], "searchable":false, "sortable":false	},
	  		{ 	"targets":[13], "searchable":false, "sortable":false	},
	  		{ 	"targets":[14], "searchable":false, "sortable":false	},
	  		
	  		{ 	"targets":[15], "searchable":false, "sortable":false	},
	  		{ 	"targets":[16], "searchable":false, "sortable":false	},
	  		{ 	"targets":[17], "searchable":false, "sortable":false	},
	  		{ 	"targets":[18], "searchable":false, "sortable":false	},
	  		{ 	"targets":[19], "searchable":false, "sortable":false	},
	  		
	  		{ 	"targets":[20], "searchable":false, "sortable":false	},
	  		{ 	"targets":[21], "searchable":false, "sortable":false	},
	  		{ 	"targets":[22], "searchable":false, "sortable":false	},
       	],	  	
	  	"columns": [
	    	{ 	"data":"DT", 				className:"text-center"		},	//일자   	
	    	{ 	"data":"AgentTeamName",		className:"text-center" 	},	//조직
	    	{ 	"data":"AgentName",			className:"text-center" 	},	//상담직원
	    	{ 	"data":"AgentID",			className:"text-center" 	},	//내선
	    	{ 	"data":"IbAgtCall",			className:"text-right" 		},	//인입콜
	    	
	    	{ 	"data":"IbAgtAnsCall",		className:"text-right" 		},	//통화콜
	    	{ 	"data":"IbAbnRingCall",		className:"text-right" 		},	//링포기
	    	{ 	"data":"IbAgtRonaCall",		className:"text-right" 		},	//무시콜
	    	{ 	"data":"IbTransferIn",		className:"text-right" 		},	//호전환수신
	    	{ 	"data":"IbTransferOut",		className:"text-right" 		},	//호전환발신
	    	
	    	{ 	"data":"IbTalkTime",		className:"text-center" 	},	//통화시간
	    	{ 	"data":"IbTalkTimeAvg",		className:"text-center" 	},	//1콜당통화시간
	    	{ 	"data":"IbWorkTime",		className:"text-center" 	},	//후처리
	    	{ 	"data":"IbWorkTimeAvg",		className:"text-center" 	},	//1콜당후처리시간
	    	{ 	"data":"ReasonTime",		className:"text-center" 	},	//이석시간
	    	
	    	{ 	"data":"AvailTime",			className:"text-center" 	},	//대기시간
	    	{ 	"data":"ObTryCall",			className:"text-right" 		},	//시도콜
	    	{ 	"data":"ObAnsCall",			className:"text-right" 		},	//발신성공
	    	{ 	"data":"ObTransferCall",	className:"text-right" 		},	//호전환발신
	    	{ 	"data":"ObTalkTime",		className:"text-center" 	},	//발신통화시간
	    	
	    	{ 	"data":"ObTalkTimeAvg",		className:"text-center" 	},	//1콜당통화시간
	    	{ 	"data":"ObWorkTime",		className:"text-center" 	},	//후처리시간
	    	{ 	"data":"ObWorkTimeAvg",		className:"text-center" 	}	//1콜당후처리시간
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
		
		var strUrl = "${contextpath}/statsipcc/reportList.json";
		strUrl += '?rid='+encodeURIComponent('PA201');
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
