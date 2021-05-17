<!-- emp.jsp -->
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
						<table id="dataTable" class="table table-bordered table-hover w-100">
                        	<thead>
                            	<tr>												
									<th>No</th> 
									<th>아이디</th>  
									<th>이름</th>   
									<th>부서</th>   
									<th>직급</th>   
						            <th>내선</th>  
						            <th>IP</th>   
						            <th>접속일자</th>   
								</tr>
                        	</thead>
                        </table> 
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
    	"serverSide": true, 
    	"processing": true, 
    	"responsive": true,
	  	"autoWidth": true, 
	  	"language": {
           "loadingRecords": "",
           "searchPlaceholder": "Search"
        },	
      	"ajax":{ 
      		"url":"${contextpath}/log/userLogList.json",
		  	"type":"POST" 
	  	},
	  	//"dom": '<"top"lf>rt<"bottom"ip><"clear">',
	  	"columnDefs": [  
	  		{ 	"targets":[0], "searchable":true	},	
			{ 	"targets":[1], "searchable":true	},
			{ 	"targets":[2], "searchable":true	},
			{ 	"targets":[3], "searchable":true	},
			{ 	"targets":[4], "searchable":true	}, 
			{ 	"targets":[5], "searchable":true	},
			{ 	"targets":[6], "searchable":true	},
			{ 	"targets":[7], "searchable":true	}
       	],	  	
	  	"columns": [
	    	{ 	"data":"seq_no" 	},	 
	    	{ 	"data":"user_id" 	},	    	    	
	    	{ 	"data":"emp_nm" 	}, 
	    	{ 	"data":"org_nm" 	},
	    	{ 	"data":"pos_nm" 	},
	    	{ 	"data":"extension"	},	
	    	{ 	"data":"ip_addr" 	},      	
	    	{ 	"data":"upd_date" 	}
	    ],
	    "order":[0,"desc"],
	    "fnRowCallback":function(nRow, aData, iDisplayIndex, iDisplayIndexFull ) {
   	  	}
    });	
	
	$('div.dataTables_filter input').unbind();
	$('div.dataTables_filter input').bind('keyup', function(e) {
    	if(e.keyCode == 13) {
        	dataTable.fnFilter(this.value);   
    	}
	});
	$('.dataTables_length > label').css('margin-bottom','0px');
	$('.dataTables_filter > label').css('margin-bottom','0px');
	$('.dataTables_info').css('padding-top','0.5em');
	
	//reload
	function updateResultTable(){
		var strUrl = "${contextpath}/log/userLogList.json";
		dataTable.api().ajax.url(strUrl).load();	
		//dataTable.DataTable().ajax.reload(null, false);	
	}
	
	//조회
	$("#btnSearch").click(clickBtnSearch=function(){
		updateResultTable();
	});
	/***** End - DataTables *****/
	
});//jQuery
</script>		
<%@ include file="/WEB-INF/views/common/CommonBottom.jsp" %>
