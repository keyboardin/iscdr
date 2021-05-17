<!-- PA203.jsp 상담원근무현황 -->
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
										<th class="text-center">일자</th> 
										<th class="text-center">조직</th> 
										<th class="text-center">상담직원</th>     
										<th class="text-center">내선</th> 
										<th class="text-center">로그인</th> 
										<th class="text-center">로그아웃</th> 
										<th class="text-center">근무시간</th> 
										<th class="text-center">상담시간</th> 
										<th class="text-center">대기시간</th> 
										<th class="text-center">후처리시간</th> 
										<th class="text-center">이석시간</th> 
										<th class="text-center">로그인준비</th> 
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
	strUrl += '?rid='+encodeURIComponent('PA203');
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
	  		{ 	"targets":[11], "searchable":false, "sortable":false	}
       	],	  	
	  	"columns": [
	    	{ 	"data":"DT", 				className:"text-center"		},	//일자     	
	    	{ 	"data":"AgentTeamName",		className:"text-center" 	},	//조직
	    	{ 	"data":"AgentName",			className:"text-center" 	},	//상담직원
	    	{ 	"data":"AgentID",			className:"text-center" 	},	//내선
	    	{ 	"data":"LoginTime",			className:"text-center" 	},	//로그인
	    	
	    	{ 	"data":"LogoutTime",		className:"text-center" 	},	//로그아웃
	    	{ 	"data":"TotLoginTime",		className:"text-center" 	},	//근무시간
	    	{ 	"data":"TotTalkTime",		className:"text-center" 	},	//상담시간
	    	{ 	"data":"AvailTime",			className:"text-center" 	},	//대기시간
	    	{ 	"data":"WorkTime",			className:"text-center" 	},	//후처리시간
	    	
	    	{ 	"data":"ReasonTime",		className:"text-center" 	},	//이석시간
	    	{ 	"data":"Reason0Time",		className:"text-center" 	}	//로그인준비시간
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
		strUrl += '?rid='+encodeURIComponent('PA203');
		strUrl += '&dttype='+encodeURIComponent(dttype);
		strUrl += '&frdt='+encodeURIComponent($('#frdt').val());
		strUrl += '&frtm='+encodeURIComponent($('#frtm').val());
		strUrl += '&todt='+encodeURIComponent($('#todt').val());
		strUrl += '&totm='+encodeURIComponent($('#totm').val());
		strUrl += '&agent='+encodeURIComponent('');
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
