<!-- report.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/CommonCss.jsp" %>
<%@ include file="/WEB-INF/views/common/CommonHeader.jsp" %> 

<!-- BEGIN Page Content -->
<main id="js-page-content" role="main" class="page-content">
	<ol class="breadcrumb page-breadcrumb" id="menu_title">
		&nbsp; 
	</ol>
   
	<div class="row">  
		<div class="col-lg-12 col-xl-12">
			<div id="panel-1" class="panel">
				<div class="panel-hdr">
					<h2></h2>
					<div class="panel-toolbar">
						<button class="btn btn-panel" data-action="panel-collapse" data-toggle="tooltip" data-offset="0,10" data-original-title="Collapse"></button>
						<button class="btn btn-panel" data-action="panel-fullscreen" data-toggle="tooltip" data-offset="0,10" data-original-title="Fullscreen"></button>
						<button class="btn btn-panel" data-action="panel-close" data-toggle="tooltip" data-offset="0,10" data-original-title="Close"></button>
					</div>
				</div>
				<div class="panel-container show">
					<div class="panel-content"> 
						<div class="frame-wrap">
							<table id="dataTable" class="table table-bordered table-hover w-100">
	                        	<thead>
	                            	<tr>												
										<th></th> 
										<th>보고서명</th> 
										<th>타입</th> 
										<th>양식</th>  
										<th>기준</th>  
										<th>일자</th>  
										<th>검색조건</th>  
										<th></th>  
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
	
	/***** Start - DataTables *****/
	var dataTable = $('#dataTable').dataTable({
		"searching": true,
		"search":{		
			"caseInsensitive": false	//대소문자구분
		},
		"lengthChange": true, 
    	"pageLength": 10,
    	"lengthMenu": [10, 20, 30],
    	"info": true,
    	"paging": true,
    	"serverSide": false, 
    	"processing": true, 
    	"responsive": true,
	  	"autoWidth": true, 
	  	"language": {
           "loadingRecords": ""
        },	
      	"ajax":{ 
      		"url":"${contextpath}/wizard/reportList.json",
		  	"type":"POST" 
	  	},
	  	//"dom": '<"top"lf>rt<"bottom"ip><"clear">',
	  	"columnDefs": [  
	  		{ 	"targets":[0], "searchable":false, "visible":false	},	
	  		{ 	"targets":[1], "searchable":true	},	
			{ 	"targets":[2], "searchable":true	},
			{ 	"targets":[3], "searchable":true	},
			{ 	"targets":[4], "searchable":true	},
			{ 	"targets":[5], "searchable":false	},
			{ 	"targets":[6], "searchable":false	},
			{ 	"targets":[7], "searchable":false, "orderable":false	}
       	],	  	
	  	"columns": [
	    	{ 	data:"report_id" 		},	 
	    	{ 	data:"report_nm" 		},	 
	    	{ 	data:"report_type_nm" 	},	    	    	
	    	{ 	data:"report_temp_nm" 	},
	    	{ 	data:"report_div" 		},
	    	{ 	data:"dt" 				},
	    	{ 	data:"condition" 			},
	    	{ 	data:null, "width":"12%"	}      	
	    ],
	    "order":[0,"desc"],
	    "fnRowCallback":function(nRow, aData, iDisplayIndex, iDisplayIndexFull ) {
	    	var report_id = aData["report_id"];
	    	var rtn_value = '&nbsp;<button type="button" class="btn btn-warning btn-xs" title="수정"  onClick="clickBtnView('
				+ "'" + report_id + "'"
				+ ')"><i class="fal fa-search"></i></button>'; 
	    		rtn_value += '&nbsp;<button type="button" class="btn btn-warning btn-xs" title="수정"  onClick="clickBtnDelete('
					+ "'" + report_id + "'"
				+ ')"><i class="fal fa-trash-alt"></i></button>'; 
	    	$('td:eq(6)', nRow).html(rtn_value);
	    	var condition = aData["condition"];
	    	condition = condition.replace("where_datetime", "기간");
	    	condition = condition.replace("where_dttype", "구분");
	    	condition = condition.replace("where_maintel", "대표번호");
	    	condition = condition.replace("where_agent", "상담원");
	    	condition = condition.replace("where_ani", "고객번호");
   	  		$('td:eq(5)', nRow).html(condition);
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
		var strUrl = "${contextpath}/wizard/reportList.json";
		dataTable.api().ajax.url(strUrl).load();	
		//dataTable.DataTable().ajax.reload(null, false);	
	}
	/***** End - DataTables *****/
	
	//조회
	$('#btnSearch').click(clickBtnSearch=function(){
		updateResultTable();
	});
	
	//수정
	$('#btnView').click(clickBtnView=function(report_id){ 
		window.open('${contextpath}/wizard/reportPopup.do?report_id='+report_id,'_blank');
	});	
	
	//삭제
	$('#btnDelete').click(clickBtnDelete=function(report_id){
		Service.requestDelete(menu_id);
	});	
	
});//jQuery

var Service = {	
	
	requestDetail : function(report_id) {
		var ajaxParam = {
            "url" : "${contextpath}/user/userDetail.json",
            "type" : "POST",
        	"data" : {
        		"report_id" : report_id
            }
        };
        Common.ajaxJSON(ajaxParam, function(data) {
        	
        });
	},
	//delete
	requestDelete : function(report_id) {
		if(confirm('삭제하시겠습니까?')){
			var ajaxParam = {
				"url" : '${contextpath}/wizard/reportDelete.json',
			    "type" : "POST",
			    "data" : {
			    	"report_id" : report_id
			    }
			}			
			Common.ajaxJSON(ajaxParam, function(data) { 
				if(!data){
					alert("return data error");
					return false;
				}
				alert(data.msg);
				if(!data.success) return;
				clickBtnSearch(); 
		    }); 
		}
	}
	
}
</script>	
<%@ include file="/WEB-INF/views/common/CommonBottom.jsp" %>
