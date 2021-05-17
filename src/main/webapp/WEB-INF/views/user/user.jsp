<!-- user.jsp -->
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
									<!-- <button type="button" class="btn btn-primary btn-sm" id="btnSearch">검색</button>&nbsp;&nbsp; -->
									<button type="button" class="btn btn-primary btn-sm" data-toggle="modal" id="btnAdd">등록</button>
								</div> 
							</div>
						</div>  
						<table id="dataTable" class="table table-bordered table-hover w-100">
                        	<thead>
                            	<tr>												
									<th>아이디</th> 
									<th>이름</th>  
									<th>부서</th>   
									<th>직급</th>   
									<th>전화</th>   
						            <th>이메일</th>  
						            <th>유형</th>   
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

<!-- Start Modal -->
<!-- 
  <div id="modal-form" class="modal fade" data-body-scroll="false" 
  data-offset="false" data-placement="right" data-fixed="true" data-backdrop="false" tabindex="-1">
  data-backdrop="static" : modal 영역밖 선택시 modal 닫힘 방지
  data-keyboard="false" : ESC model 닫힘 방지
-->       
<div id="form_modal" class="modal fade" data-backdrop="static" data-keyboard="false" tabindex="-1" role="dialog"> 
	<div class="modal-dialog modal-dialog-centered" role="document" style="max-width:600px;">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="modal_title"></h5> 
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true"><i class="fal fa-times"></i></span> 
                </button>
            </div>
            <div class="modal-body px-6">
            	<div class="form-group">
            		<div class="row">
            			<div class="col-md-2">
                    		<label class="form-label pt-2" for="user_id">아이디</label>    
                    	</div>
                    	<div class="col-md-8">
                    		<input id="user_id" type="text" class="form-control" autocomplete="off">  
                    	</div>
                    	<div class="col-md-2 text-right" style="padding-top:2px !important;padding-left:0px !important;"> 
							<input 	id="check_id_flag" 	type="hidden" value='N'>   
							<button id="btnCheckId"  	type="button" class="btn btn-warning btn-sm">중복확인</button>    
						</div>
                    </div>
                </div>
                <div class="form-group">
                	<div class="row">
            			<div class="col-md-2">
                    		<label class="form-label pt-2" for="user_nm">이름</label>
                    	</div>
                    	<div class="col-md-10">
                    		<input id="user_nm" type="text" class="form-control" autocomplete="off">
                    	</div>
                    </div>
                </div>
                <div class="form-group">
                	<div class="row">
            			<div class="col-md-2">
                    		<label class="form-label pt-2" for="user_dep">부서</label>
                    	</div>
                    	<div class="col-md-10">
                    		<input id="user_dep" type="text" class="form-control" autocomplete="off">
                    	</div>
                    </div>
                </div>
                <div class="form-group">
                	<div class="row">
            			<div class="col-md-2">
                    		<label class="form-label pt-2" for="user_pos">직급</label>
                    	</div>
                    	<div class="col-md-10">
                    		<input id="user_pos" type="text" class="form-control" autocomplete="off">
                    	</div>
                    </div>
                </div>
                <div class="form-group">
                	<div class="row">
            			<div class="col-md-2">
                    		<label class="form-label pt-2" for="user_mobile">전화</label> 
                    	</div>
                    	<div class="col-md-10">
                    		<input id="user_mobile" type="text" class="form-control" autocomplete="off">
                    	</div>
                    </div>
                </div>
                <div class="form-group">
                	<div class="row">
            			<div class="col-md-2">
                    		<label class="form-label pt-2" for="user_email">이메일</label>
                    	</div>
                    	<div class="col-md-10">
                    		<input id="user_email" type="text" class="form-control" autocomplete="off"> 
                    	</div>
                    </div>
                </div>
                <div class="form-group">
                	<div class="row">
            			<div class="col-md-2">
                    		<label class="form-label pt-2" for="user_type">유형</label>
                    	</div>
                    	<div class="col-md-10">
                    		<select id="user_type" type="text" class="form-control"></select> 
                    	</div>
                    </div>
                </div>
            </div>
            <div class="modal-footer px-6">
                <button type="button" class="btn btn-default btn-sm" data-dismiss="modal" id="btnClose">닫기</button>  
				<button type="button" class="btn btn-primary btn-sm" id="btnSave">저장</button>  
				<button type="button" class="btn btn-primary btn-sm" id="btnInitPw">비밀번호초기화</button>
            </div>
        </div>
    </div>
</div>
<!-- End Modal -->
       
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
      		"url":"${contextpath}/user/userList.json",
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
			{ 	"targets":[7], "searchable":false, "orderable":false	}
       	],	  	
	  	"columns": [
	    	{ 	"data":"user_id" 		},	 
	    	{ 	"data":"user_nm" 		},	    	    	
	    	{ 	"data":"user_dep" 		}, 
	    	{ 	"data":"user_pos" 		},
	    	{ 	"data":"user_mobile" 	},
	    	{ 	"data":"user_email"		},	
	    	{ 	"data":"user_type_nm" 	},      	
	    	{ 	"data":null, "width":"12%"			}      	
	    ],
	    "order":[0,"asc"],
	    "fnRowCallback":function(nRow, aData, iDisplayIndex, iDisplayIndexFull ) {
	    	var user_id = aData["user_id"];
	    	var rtn_value = '<button type="button" class="btn btn-warning btn-xs" title="수정"  onClick="clickBtnEdit('
				+ "'" + user_id + "'"
				+ ')"><i class="fal fa-edit"></i></button>'; 
	    		rtn_value += '&nbsp;<button type="button" class="btn btn-warning btn-xs" title="삭제"  onClick="clickBtnDelete('
					+ "'" + user_id + "'"
				+ ')"><i class="fal fa-trash-alt"></i></button>'; 
	    	$('td:eq(7)', nRow).html(rtn_value);
   	  	}
    });	
	
	$('.dataTables_filter input').unbind();
	$('.dataTables_filter input').bind('keyup', function(e) {
    	if(e.keyCode == 13) {
        	dataTable.fnFilter(this.value);   
    	}
	});
	$('.dataTables_length > label').css('margin-bottom','0px');
	$('.dataTables_filter > label').css('margin-bottom','0px');
	$('.dataTables_info').css('padding-top','0.5em');
	
	//reload
	function updateResultTable(){
		var strUrl = "${contextpath}/user/userList.json";
		dataTable.api().ajax.url(strUrl).load();	
		//dataTable.DataTable().ajax.reload(null, false);	
	}
	
	//조회
	$("#btnSearch").click(clickBtnSearch=function(){
		updateResultTable();
	});
	/***** End - DataTables *****/
	
	
	var act = "insert";
	var str_url = "";
	var form_fields = ["user_id","user_nm","user_dep","user_pos","user_mobile","user_email","user_type"];
	
	//추가
	$("#btnAdd").click(clickBtnAdd=function(){
		act = "insert";
		$.resetField(form_fields);
		$("#btnSave").show();
		$("#btnInitPw").hide();
		$("#btnCheckId").show();
		$("#check_id_flag").val("N");
		$("#form_modal").modal("show");
	}); 
	
	//저장
	$("#btnSave").click(clickBtnSave=function(){
		if(act=="insert"){
			if(!Service.checkId()) return;			
			if(!Service.checkForm()) return;
			Service.requestInsert();
		}else{
			if(!Service.checkForm()) return;
			Service.requestUpdate(); 
		}
	});	
	
	//수정
	$("#btnEdit").click(clickBtnEdit=function(user_id){
		act = "update";
		Service.requestDetail(user_id)
		$("#user_id").attr("readonly", true);
		$("#btnSave").show();
		$("#btnInitPw").show();
		$("#btnCheckId").hide();
		$("#form_modal").modal("show");		
	});	
	
	//삭제
	$("#btnDelete").click(clickBtnDelete=function(){
		Service.requestDelete();
	});	
	
	//비밀번호 초기화
	$("#btnInitPw").click(clickBtnInitPw=function(){
		Service.requestInitPw();
	});	
	
	//ID중복확인
	$("#btnCheckId").click(clickBtnCheckId=function(){
		Service.requestCheckId();
	});	
	
	if('${ISUP_USER.user_type}'=='0002'){		//관리자
		$.createCommCodeSelectBox("${contextpath}","user_type", "CD01", "", "선택", "0001");	//관리자는 select box 에서 시스템관리자 제외
	} else {
		$.createCommCodeSelectBox("${contextpath}","user_type", "CD01", "", "선택");
	}
	
});//jQuery

var Service = {	
	//아이디 중복 체크
	checkId : function(){
		if($("#check_id_flag").val()=="N"){ 
			alert("ID중복확인 해주세요");
			return false;
		}
		return true;
	},		
	//입력 폼 체크
	checkForm : function(){
		if(!$.notnull($("#user_id"), "아이디")) return false;
		if(!$.notnull($("#user_nm"), "사용자명")) return false;
		if(!$.notnull($("#user_type"), "사용자유형")) return false;	
		return true;
	},		
	//detail
	requestDetail : function(user_id) {
		var ajaxParam = {
            "url" : "${contextpath}/user/userDetail.json",
            "type" : "POST",
        	"data" : {
        		"user_id" : user_id
            }
        };
        Common.ajaxJSON(ajaxParam, function(data) {
        	$("#user_id").val(data.result.user_id);
			$("#user_nm").val(data.result.user_nm);
			$("#user_dep").val(data.result.user_dep);
			$("#user_pos").val(data.result.user_pos);
			$("#user_mobile").val(data.result.user_mobile);
			$("#user_email").val(data.result.user_email); 
			$("#user_type").val(data.result.user_type);
        });
	},
	//insert
	requestInsert : function() {
		var ajaxParam = {
            "url" : "${contextpath}/user/userInsert.json",
            "type" : "POST",
        	"data" : {
        		"user_id" : $("#user_id").val(),
    			"user_nm" : $("#user_nm").val(),
    			"user_dep" : $("#user_dep").val(),
    			"user_pos" : $("#user_pos").val(),
    			"user_mobile" : $("#user_mobile").val(),
    			"user_email" : $("#user_email").val(),
    			"user_type" : $("#user_type").val()
            }
        };
        Common.ajaxJSON(ajaxParam, function(data) {
        	if(!data){
				alert('return data error');
				return false;
			}
			alert(data.msg);
			if(!data.success) return;
			$('#form_modal').modal('hide');			
			clickBtnSearch();
        });
	},
	//update
	requestUpdate : function() {
		var ajaxParam = {
            "url" : "${contextpath}/user/userUpdate.json",
            "type" : "POST",
        	"data" : {
        		"user_id" : $("#user_id").val(),
    			"user_nm" : $("#user_nm").val(),
    			"user_dep" : $("#user_dep").val(),
    			"user_pos" : $("#user_pos").val(),
    			"user_mobile" : $("#user_mobile").val(),
    			"user_email" : $("#user_email").val(),
    			"user_type" : $("#user_type").val()
            }
        };
        Common.ajaxJSON(ajaxParam, function(data) {
        	if(!data){
				alert('return data error');
				return false;
			}
			alert(data.msg);
			if(!data.success) return;
			$('#form_modal').modal('hide');			
			clickBtnSearch();
        });
	},
	//delete
	requestDelete : function() {
		if(confirm('삭제하시겠습니까?')){
			var ajaxParam = {
				"url" : '${contextpath}/user/userDelete.json',
			    "type" : "POST",
			    "data" : {
			    	"user_id" : $("#user_id").val(),
	    			"user_type" : $("#user_type").val()
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
	//비밀번호초기화
	requestInitPw : function() {
		if(confirm("비밀번호를 초기화 하시겠습니까?")){
			var ajaxParam = {
	            "url" : "${contextpath}/user/userChangePw.json",
	            "type" : "POST",
	        	"data" : {
	        		"user_id" : $("#user_id").val()
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
		}
	},
	//ID 중복확인
	requestCheckId : function() {
		if(!$.notnull($("#user_id"), "아이디")) return false;
		var ajaxParam = {
            "url" : "${contextpath}/user/userCheckId.json",
            "type" : "POST",
        	"data" : {
        		"user_id" : $("#user_id").val()
            }
        };
        Common.ajaxJSON(ajaxParam, function(data) {
        	if(!data){
				alert("return data error");
				return false;
			}
			alert(data.msg);
			if(data.success=="1"){	//사용가능
				$("#check_id_flag").val("Y");
				$("#user_id").attr("readonly", true);
			}else{
				$("#user_id").val("");
			}
			if(!data.success) return;
        });
	}
	
}
</script>	
<%@ include file="/WEB-INF/views/common/CommonBottom.jsp" %>
