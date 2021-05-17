<!-- PA108.jsp 인입콜이력조회 -->
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
										<th class="text-center">시간</th> 
										<th class="text-center">대표번호</th> 
										<th class="text-center">대표번호명</th>     
										<th class="text-center">발신번호</th> 
										<th class="text-center">처리결과</th> 
										
										<th class="text-center">인입스킬</th> 
										<th class="text-center">팀명</th> 
										<th class="text-center">상담원</th> 
										<th class="text-center">내선</th> 
										<th class="text-center">대기시간</th> 
										
										<th class="text-center">Ring시간</th> 
										<th class="text-center">통화시간</th>
										<!-- <th class="text-center">콜키</th>  -->
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

   
<!-- BEGIN Modal -->
<!-- 
  <div id="modal-form" class="modal fade" data-body-scroll="false" 
  data-offset="false" data-placement="right" data-fixed="true" data-backdrop="false" tabindex="-1">
  data-backdrop="static" : modal 영역밖 선택시 modal 닫힘 방지
  data-keyboard="false" : ESC model 닫힘 방지
-->       
<div id="form_modal" class="modal fade" data-backdrop="static" data-keyboard="false" tabindex="-1" role="dialog"> 
	<div class="modal-dialog modal-dialog-centered" role="document" style="max-width:900px;">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">상세보기</h5> 
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true"><i class="fal fa-times"></i></span> 
                </button>
            </div>
            <div class="modal-body px-6">
            	<table id="dataTableDetail" class="table table-bordered table-hover w-100">
                	<thead>
						<tr>	
							<th class="text-center">시간</th> 
							<th class="text-center">대표번호</th> 
							<th class="text-center">대표번호명</th>     
							<th class="text-center">발신번호</th> 
							<th class="text-center">처리결과</th> 
							
							<th class="text-center">팀명</th> 
							<th class="text-center">상담원</th> 
							<th class="text-center">대기시간</th> 
							<th class="text-center">통화시간</th>
						</tr>
                     </thead>
                 </table> 
            </div>
            <div class="modal-footer px-6">
                <button id="btnClose" 	type="button" 	class="btn btn-default btn-sm" data-dismiss="modal">닫기</button>
            </div>
        </div>
    </div>
</div>
<!-- END Modal -->     
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
	
	getSelectHour('frtm', '09', '시');
	getSelectHour('totm', '10', '시');
	
	
	var strUrl = "${contextpath}/statsipcc/reportList.json";
	strUrl += '?rid='+encodeURIComponent('PA108');
	strUrl += '&dttype='+encodeURIComponent("D");
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
	  		{ 	"targets":[12], "searchable":false, "visible":false	}
       	],	  	
	  	"columns": [
	    	{ 	"data":"DateTime", 		className:"text-center"		},	//일자     	
	    	{ 	"data":"MainTel",		className:"text-center" 	},	//대표번호
	    	{ 	"data":"MainTelName",	className:"text-center" 	},	//대표번호명
	    	{ 	"data":"ANI",			className:"text-center" 	},	//발신번호
	    	{ 	"data":"CallResult",	className:"text-center" 	},	//처리결과
	    	
	    	{ 	"data":"SkillGroupSkillTargetNameKor",		className:"text-right" 	},	//스킬명
	    	{ 	"data":"AgentTeamName",	className:"text-center" 	},	//팀명
	    	{ 	"data":"AgentName",		className:"text-center" 	},	//상담원
	    	{ 	"data":"AgentID",		className:"text-center" 	},	//내선
	    	{ 	"data":"AbnTime",		className:"text-center" 	},	//포기시간
	    	
	    	{ 	"data":"RingTime",		className:"text-center" 	},	//링시간
	    	{ 	"data":"TalkTime",		className:"text-center" 	},	//통화시간
	    	{ 	"data":"CallKey",		className:"text-center" 	}	//콜키
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
		var strUrl = "${contextpath}/statsipcc/reportList.json";
		strUrl += '?rid='+encodeURIComponent('PA108');
		strUrl += '&dttype='+encodeURIComponent('D');
		strUrl += '&frdt='+encodeURIComponent($('#frdt').val());
		strUrl += '&frtm='+encodeURIComponent($('#frtm').val());
		strUrl += '&todt='+encodeURIComponent($('#todt').val());
		strUrl += '&totm='+encodeURIComponent($('#totm').val());
		strUrl += '&maintel='+encodeURIComponent('');
		console.log(strUrl);
		dataTable.api().ajax.url(strUrl).load();	
		//dataTable.DataTable().ajax.reload(null, false);	
	}
	
	$('#dataTable tbody').on('click', 'tr', function(){
		var row = $(this).closest('tr');
        var data = $('#dataTable').dataTable().fnGetData(row);
        var CallKey = data.CallKey;
        updateResultTableDetail(CallKey);
        $("#form_modal").modal("show");		
	});
	/***** End - DataTables *****/
	
	//조회
	$("#btnSearch").click(clickBtnSearch=function(){
		updateResultTable();
	});
	
	
	var strUrl2 = "${contextpath}/statsipcc/reportList.json";
	strUrl2 += '?rid='+encodeURIComponent('PA108_1');
	strUrl2 += '&dttype='+encodeURIComponent("D");
	strUrl2 += '&frdt='+encodeURIComponent($('#frdt').val());
	strUrl2 += '&frtm='+encodeURIComponent($('#frtm').val());
	strUrl2 += '&todt='+encodeURIComponent($('#todt').val());
	strUrl2 += '&totm='+encodeURIComponent($('#totm').val());
	strUrl2 += '&maintel='+encodeURIComponent('0000');
	
	/***** Start - DataTables *****/
	var dataTableDetail = $('#dataTableDetail').dataTable({
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
      		"url":strUrl2,
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
	  		{ 	"targets":[8], "searchable":false, "sortable":false		}
       	],	  	
	  	"columns": [
	    	{ 	"data":"DateTime", 		className:"text-center"		},	//일자     	
	    	{ 	"data":"MainTel",		className:"text-center" 	},	//대표번호
	    	{ 	"data":"MainTelName",	className:"text-center" 	},	//대표번호명
	    	{ 	"data":"ANI",			className:"text-center" 	},	//발신번호
	    	{ 	"data":"CallResult",	className:"text-center" 	},	//처리결과
	    	
	    	{ 	"data":"AgentTeamName",	className:"text-right" 		},	//팀명
	    	{ 	"data":"AgentName",		className:"text-center" 	},	//상담원
	    	{ 	"data":"QueueTime",		className:"text-center" 	},	//대기시간
	    	{ 	"data":"TalkTime",		className:"text-center" 	}	//통화시간
	    ],	
	    //"order":[0,"asc"],
	    "ordering":false,
	    "fnRowCallback":function(nRow, aData, iDisplayIndex, iDisplayIndexFull ) {
	    	//dataTable.api().column(1).visible(false);
   	  	}
    });	
	
	
	//상세조회
	function updateResultTableDetail(CallKey){		
		var strUrl2 = "${contextpath}/statsipcc/reportList.json";
		strUrl2 += '?rid='+encodeURIComponent('PA108_1');
		strUrl2 += '&dttype='+encodeURIComponent('D');
		strUrl2 += '&frdt='+encodeURIComponent($('#frdt').val());
		strUrl2 += '&frtm='+encodeURIComponent($('#frtm').val());
		strUrl2 += '&todt='+encodeURIComponent($('#todt').val());
		strUrl2 += '&totm='+encodeURIComponent($('#totm').val());
		strUrl2 += '&MainTel='+encodeURIComponent(CallKey);
		console.log(strUrl2);
		dataTableDetail.api().ajax.url(strUrl2).load();	
		//dataTable.DataTable().ajax.reload(null, false);	
	}
	
});//jQuery

var Service = {
	
}
</script>		
<%@ include file="/WEB-INF/views/common/CommonBottom.jsp" %>
