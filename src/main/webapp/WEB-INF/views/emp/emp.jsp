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
						<div class="form-group">
							<div class="row">
								<div class="col-lg-12">  
									<!--
									<button id="btnAdd" 	type="button" class="btn btn-primary btn-sm" data-toggle="modal" style="display:none;">등록</button>&nbsp;&nbsp; 
									<button id="btnExcelDownload" 	type="button" class="btn btn-primary btn-sm" data-toggle="modal">엑셀다운로드</button>
									-->
									<button id="btnExcelUpload" 	type="button" class="btn btn-primary btn-sm" data-toggle="modal">엑셀업로드</button>&nbsp;&nbsp; 
									<button id="btnSyncEmp" type="button" class="btn btn-primary btn-sm" data-toggle="modal">인사정보동기화</button>&nbsp;&nbsp;
									<button id="btnSyncOrg" type="button" class="btn btn-primary btn-sm" data-toggle="modal">조직정보동기화</button>
								</div> 
							</div>
						</div>  
						<table id="dataTable" class="table table-bordered table-hover w-100">
                        	<thead>
                            	<tr>												
									<th>사번</th> 
									<th>이름</th>  
									<th>부서</th>   
									<th>직급</th>   
									<th>전화번호</th>   
						            <th>내선번호</th>  
						            <th>휴대폰</th>   
						            <th>이메일</th>   
						            <th></th>   
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

<!-- Modal -->
<!-- 
  <div id="modal-form" class="modal fade" data-body-scroll="false" 
  data-offset="false" data-placement="right" data-fixed="true" data-backdrop="false" tabindex="-1">
  data-backdrop="static" : modal 영역밖 선택시 modal 닫힘 방지
  data-keyboard="false" : ESC model 닫힘 방지
-->       

<!-- Start Modal - 등록 -->
<div id="form_modal" class="modal fade" data-backdrop="static" data-keyboard="false" tabindex="-1" role="dialog">
	<div class="modal-dialog modal-dialog-centered" role="document" style="max-width:600px;">
		<div class="modal-content" id="form_modal_content">
			<div class="modal-header">
                <h5 class="modal-title">인사정보</h5> 
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true"><i class="fal fa-times"></i></span> 
                </button>
            </div>
			<div class="modal-body px-6">
				<div class="form-group">
                	<div class="row">
            			<div class="col-md-3">
                    		<label class="form-label pt-2" for="emp_no">아이디</label>
                    	</div>
                    	<div class="col-md-9">
                    		<input id="emp_no" type="text" class="form-control" autocomplete="off">
                    	</div>
                    </div>
                </div>
                 <div class="form-group">
                	<div class="row">
            			<div class="col-md-3">
                    		<label class="form-label pt-2" for="emp_nm">이름</label>
                    	</div>
                    	<div class="col-md-9">
                    		<input id="emp_nm" type="text" class="form-control" autocomplete="off">
                    	</div>
                    </div>
                </div>
                <div class="form-group">
                	<div class="row">
            			<div class="col-md-3">
                    		<label class="form-label pt-2" for="org_nm">부서</label>
                    	</div>
                    	<div class="col-md-9">
                    		<input id="org_nm" type="text" class="form-control" autocomplete="off">
                    	</div>
                    </div>
                </div>
                <div class="form-group">
                	<div class="row">
            			<div class="col-md-3">
                    		<label class="form-label pt-2" for="pos_nm">직급</label>
                    	</div>
                    	<div class="col-md-9">
                    		<input id="pos_nm" type="text" class="form-control" autocomplete="off">
                    	</div>
                    </div>
                </div>
                <div class="form-group">
                	<div class="row">
            			<div class="col-md-3">
                    		<label class="form-label pt-2" for="emp_tel">전화번호</label>
                    	</div>
                    	<div class="col-md-9">
                    		<input id="emp_tel" type="text" class="form-control" autocomplete="off">
                    	</div>
                    </div>
                </div>
                 <div class="form-group">
                	<div class="row">
            			<div class="col-md-3">
                    		<label class="form-label pt-2" for="extension">내선번호</label>
                    	</div>
                    	<div class="col-md-9">
                    		<input id="extension" type="text" class="form-control" autocomplete="off">
                    	</div>
                    </div>
                </div>
			</div>
			<div class="modal-footer px-6">
				<button id="btnClose" 	type="button" class="btn btn-default btn-sm" data-dismiss="modal">닫기</button>
				<button id="btnSave"  	type="button" class="btn btn-primary btn-sm">저장</button>
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal-dialog -->
</div><!-- /.modal -->
<!-- End Modal - 등록 -->		


<!-- Start - 엑셀업로드 Modal -->
<div id="excel_modal" class="modal fade" tabindex="-1" data-backdrop="static" data-keyboard="false" tabindex="-1" role="dialog">
	<div class="modal-dialog modal-dialog-centered" role="document" style="max-width:700px;">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="excel_modal_title">직원정보 엑셀등록</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true"><i class="fal fa-times"></i></span> 
                </button>
			</div>
			<div class="modal-body px-6">
				<div class="form-group">
					<div class="row">
						<div class="col-md-3">
							<label class="form-label pt-2">직원정보파일</label> 
						</div>
						<div class="col-md-9">
							<input type="file" id="excel_file" class="btn btn-default" id="exampleInputFile1" style="width:300px !important;">
						</div>
					</div>
					<div class="row pt-2">
						<div class="col-md-12" style="height:40px; padding-left:150px;">
							* 아래와 같은 Format으로 <span style="color:red; font-weight:bold;">Excel File</span> 을 만들어 Upload해 주세요!
						</div>
					</div>
					<div class="col-md-12">
						<table class="table table-bordered">
							<thead>
								<tr>
									<th class="bg-info text-center text-white">사번</th>
									<th class="bg-info text-center text-white">부서</th>
									<th class="bg-info text-center text-white">직급</th>
									<th class="bg-info text-center text-white">이름</th>
									<th class="bg-info text-center text-white">내선번호</th>
								</tr>
							</thead>
							<tbody>
								<tr style="text-align:center;">
									<td>i129851</td>
									<td>UC사업부</td>
									<td>차장</td>
									<td>서원일</td>
									<td>7393</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
			<div class="modal-footer px-6">
				<button id="btnClose" 		type="button" class="btn btn-default btn-sm" data-dismiss="modal">닫기</button>
				<button id="btnExcelSave" 	type="button" class="btn btn-primary btn-sm">저장</button>
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal-dialog -->
</div><!-- /.modal -->
<!-- End - 엑셀업로드 Modal -->
       
       
<%@ include file="/WEB-INF/views/common/CommonFooter.jsp" %>                     
<%@ include file="/WEB-INF/views/common/CommonJs.jsp" %>
<script src="${contextpath}/static/common/js/common.js"></script> 
<script type="text/javascript">
var act = "insert"; 
var form_fields = ["emp_no","emp_nm","org_nm","pos_nm","emp_tel","extension","emp_mobile","emp_email"];
var form_fields_xml = ["cfadestination","busytrigger","cfbdestination","cfnaduration","cfnadestination","display","label","e164mask"];

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
           "searchPlaceholder": "사번,이름,부서,내선"
        },	
      	"ajax":{ 
      		"url":"${contextpath}/emp/empList.json",
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
			{ 	"targets":[7], "searchable":true	},
			{ 	"targets":[8], "searchable":false, "orderable":false	}
       	],	  	
	  	"columns": [
	    	{ 	"data":"emp_no" 		},	 
	    	{ 	"data":"emp_nm" 		},	    	    	
	    	{ 	"data":"org_nm" 		}, 
	    	{ 	"data":"pos_nm" 		},
	    	{ 	"data":"emp_tel" 		},
	    	{ 	"data":"extension"		},	
	    	{ 	"data":"emp_mobile" 	},      	
	    	{ 	"data":"emp_email" 		},      	
	    	{ 	"data":null, "width":"12%"	}      	
	    ],
	    "order":[1,"asc"],
	    "fnRowCallback":function(nRow, aData, iDisplayIndex, iDisplayIndexFull ) {
	    	var emp_no = aData["emp_no"];
	    	var rtn_value = '<button type="button" class="btn btn-warning btn-xs" title="수정"  onClick="clickBtnEdit('
				+ "'" + emp_no + "'"
				+ ')"><i class="fal fa-edit"></i></button>'; 
	    		rtn_value += '&nbsp;<button type="button" class="btn btn-warning btn-xs" title="삭제"  onClick="clickBtnDelete('
					+ "'" + emp_no + "'"
				+ ')"><i class="fal fa-trash-alt"></i></button>'; 
	    	$('td:eq(8)', nRow).html(rtn_value);
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
		var strUrl = "${contextpath}/emp/empList.json";
		strUrl += '?group_id='+encodeURIComponent($("#search_group_id").val());
		dataTable.api().ajax.url(strUrl).load();	
		//dataTable.DataTable().ajax.reload(null, false);	
	}
	
	//조회
	$("#btnSearch").click(clickBtnSearch=function(){
		updateResultTable();
	});
	/***** End - DataTables *****/
	
		
	$("#btnExcelUpload").click(function(){
		$("#excel_modal").modal("show");
	});
	
	$("#btnSyncEmp").click(function(){
		Service.requestSyncEmp();
	});
	
	$("#btnSyncOrg").click(function(){
		Service.requestSyncOrg();
	});
	
	
	//인사정보 버튼 클릭
	$('#btnEdit').click(clickBtnEdit=function(emp_no){
		act = 'update';
		$("#emp_no").val(emp_no);
		Service.requestDetail(emp_no);
	});	
	
	
	//인사정보 비밀번호 초기화
	$('#btnPwReset').click(clickBtnPwReset=function(emp_no){
		$("#emp_no").val(emp_no);
		Service.requestPwReset(emp_no);
	});	
	
	//인사정보 삭제
	$('#btnDelete').click(clickBtnDelete=function(emp_no){
		$("#emp_no").val(emp_no);
		Service.requestDelete();
	});	
		
	
	/***** Start - Modal(사용자) *****/
	//저장
	$("#btnSave").click(clickBtnSave=function(){
		//폼 체크
		if(!Service.checkForm()) return;
		if(act=="insert"){
			Service.requestInsert();
		}else{
			Service.requestUpdate(); 
		}
	});	
	
	
	
	/***** Start - Model(Excel Upload) *****/
	var reg = /xls|xlsx/i;
	$("#excel_file").unbind("change");
	$("#excel_file").change(function(){
		$("#excel_file").each(function(index){
			var _file = this.files[index];
			var _filename = _file.name;	
			var _fileExt = _filename.substring(_filename.lastIndexOf(".")+1);
			if(reg.test(_fileExt)==false){
				alert("파일형식을 확인하시기 바랍니다.");
				$("#excel_file").val("");
				return false; 
			} 
		});
	});		
	
	$("#btnExcelSave").click(clickBtnExcelSave=function(){
		if(!$.notnull($("#excel_file"),"파일명")) return false;				
		var formData = new FormData(); 	
		formData.append("file", $("#excel_file")[0].files[0]); 		
		$.ajax({ 
			url: "${contextpath}/emp/empExcelUpload.json", 
			data: formData, 
			processData: false, 
			contentType: false, 
			type: "POST", 
			success:function(data){
				if(!data){
					alert("return data error");
					return false;
				} 
				alert(data.msg);
				if(!data.success) return;
				$("#excel_modal").modal("hide");			
				clickBtnSearch();				
			},
			error:function (xhr, ajaxOptions, thrownError){
				alert(xhr.status+"\n"+thrownError);
			} 
		}); 
	});	
	/***** End - Model(Excel Upload) *****/
	
});//jQuery

var Service = {				
	//입력 폼 체크
	checkForm : function(){
		if(!$.notnull($("#emp_no"), "사번")) return false;
		if(!$.notnull($("#emp_nm"), "이름")) return false;
		return true;
	},	
	//Detail
	requestDetail : function() {
		var ajaxParam = {
            "url" : "${contextpath}/emp/empDetail.json",
            "type" : "POST",
        	"data" : {
    			"emp_no" : $("#emp_no").val()
            }
        };
        Common.ajaxJSON(ajaxParam, function(data) {
        	$('#emp_no').val(data.result.emp_no).prop('readonly', true);
        	$('#emp_nm').val(data.result.emp_nm);
        	$('#org_nm').val(data.result.org_nm);						
        	$('#pos_nm').val(data.result.pos_nm);								
        	$('#emp_tel').val(data.result.emp_tel);								
        	$('#extension').val(data.result.extension);		

    		$("#form_modal").modal("show");
        });
	},
	//insert
	requestInsert : function() {
		var ajaxParam = {
            "url" : "${contextpath}/emp/empInsert.json",
            "type" : "POST",
        	"data" : {
    			"emp_no" : $("#emp_no").val(),
    			"emp_nm" : $("#emp_nm").val(),
    			"org_nm" : $("#org_nm").val(),
    			"pos_nm" : $("#pos_nm").val()
            }
        };
        Common.ajaxJSON(ajaxParam, function(data) {
        	if(!data){
				alert("return data error");
				return false;
			}
			alert(data.msg);
			if(!data.success) return;
			$("#form_modal").modal("hide");			
			clickBtnSearch();
        });
	},
	//update
	requestUpdate : function() {
		var ajaxParam = {
            "url" : "${contextpath}/emp/empUpdate.json", 
            "type" : "POST",
        	"data" : {
    			"emp_no" : $("#emp_no").val(),
    			"emp_nm" : $("#emp_nm").val(),
    			"org_nm" : $("#org_nm").val(),
    			"pos_nm" : $("#pos_nm").val(),
    			"emp_tel" : $("#emp_tel").val(),
    			"extension" : $("#extension").val()
            }
        };
        Common.ajaxJSON(ajaxParam, function(data) {
        	if(!data){
				alert("return data error");
				return false;
			}
			alert(data.msg);
			if(!data.success) return;
			$("#form_modal").modal("hide");			
			clickBtnSearch();
        });
	},
	//delete
	requestDelete : function() {
		if(confirm('삭제하시겠습니까?')){
			var ajaxParam = {
				"url" : '${contextpath}/emp/empDelete.json',
			    "type" : "POST",
			    "data" : {
			    	"emp_no" : $("#emp_no").val()
			    }
			}			
			Common.ajaxJSON(ajaxParam, function(data) { 
				if(!data){
					alert("return data error");
					return false;
				}
				alert(data.msg);
				if(!data.success) return;
				$("#form_modal").modal("hide");			
				clickBtnSearch(); 
		    }); 
		}
	},
	
	//인사Sync
	requestSyncEmp : function() {
		var ajaxParam = {
            "url" : "${contextpath}/emp/empSync.json",
            "type" : "POST",
        	"data" : {
        	}
        };
        Common.ajaxJSON(ajaxParam, function(data) {
        	if(!data){
				alert("return data error");
				return false;
			}
			alert(data.msg);
			if(!data.success) return;
			$("#form_modal").modal("hide");			
			clickBtnSearch();
        });
	},
	
	//조직Sync
	requestSyncOrg : function() {
		var ajaxParam = {
            "url" : "${contextpath}/emp/orgSync.json",
            "type" : "POST",
        	"data" : {
        	}
        };
        Common.ajaxJSON(ajaxParam, function(data) {
        	if(!data){
				alert("return data error");
				return false;
			}
			alert(data.msg);
			if(!data.success) return;
			$("#form_modal").modal("hide");			
			clickBtnSearch();
        });
	},
	
	
	//Detail
	requestPwReset : function() {
		if(confirm('비밀번호를 초기화 하시겠습니까?')){
			var ajaxParam = {
	            "url" : "${contextpath}/emp/empPwReset.json",
	            "type" : "POST",
	        	"data" : {
	    			"emp_no" : $("#emp_no").val()
	            }
	        };
	        Common.ajaxJSON(ajaxParam, function(data) {
	        	if(!data){
					alert("return data error");
					return false;
				}			
	        	
	        	alert(data.msg);
				if(!data.success) return;
	        });
		}
	}
	
	
}
</script>		
<%@ include file="/WEB-INF/views/common/CommonBottom.jsp" %>
