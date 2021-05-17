<!-- batchConfig.jsp -->
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
						<div class="">
							<div class="row">
								<div class="col-lg-12">  
									<button id="btnAdd"		type="button"  	class="btn btn-primary btn-sm" data-toggle="modal">등록</button>
								</div> 
							</div>
						</div>  
						<table id="dataTable" class="table table-bordered table-hover w-100">
                        	<thead>
                            	<tr>												
									<th>ID</th> 
									<th>배치명</th>  
									<th>요일</th>   
									<th>시간</th>   
									<th>설명</th>   
						            <th>사용여부</th>  
						            <th></th>   
								</tr>
                        	</thead>
                        </table> 
					</div>
				</div>
			</div>  
		</div>                                      
	</div>
	
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
						<table id="dataTable2" class="table table-bordered table-hover w-100">
                        	<thead>
                            	<tr>												
									<th>No</th> 
									<th>배치명</th> 
									<th>내용</th>  
									<th>등록일</th> 
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
                    		<label class="form-label pt-2" for="user_id">배치명</label>    
                    	</div>
                    	<div class="col-md-10">
                    		<input id="batch_nm" type="text" class="form-control" autocomplete="off">
                    		<input type="hidden" id="batch_id" >
                    	</div>
                    </div>
                </div>
                <div class="form-group">
                	<div class="row">
            			<div class="col-md-2">
                    		<label class="form-label pt-2" for="batch_day">요일</label>
                    	</div>
                    	<div class="frame-wrap" style="padding-left: 13px;">
                           <div class="custom-control custom-checkbox custom-control-inline">
                               <input type="checkbox" class="custom-control-input" id="mon">
                               <label class="custom-control-label" for="mon">월</label>
                           </div>
                           <div class="custom-control custom-checkbox custom-control-inline">
                               <input type="checkbox" class="custom-control-input" id="tue">
                               <label class="custom-control-label" for="tue">화</label>
                           </div>
                           <div class="custom-control custom-checkbox custom-control-inline">
                               <input type="checkbox" class="custom-control-input" id="wed">
                               <label class="custom-control-label" for="wed">수</label>
                           </div>
                           <div class="custom-control custom-checkbox custom-control-inline">
                               <input type="checkbox" class="custom-control-input" id="thu">
                               <label class="custom-control-label" for="thu">목</label>
                           </div>
                           <div class="custom-control custom-checkbox custom-control-inline">
                               <input type="checkbox" class="custom-control-input" id="fri">
                               <label class="custom-control-label" for="fri">금</label>
                           </div>
                           <div class="custom-control custom-checkbox custom-control-inline">
                               <input type="checkbox" class="custom-control-input" id="sat">
                               <label class="custom-control-label" for="sat">토</label>
                           </div>
                           <div class="custom-control custom-checkbox custom-control-inline">
                               <input type="checkbox" class="custom-control-input" id="sun">
                               <label class="custom-control-label" for="sun">일</label>
                           </div>
                       </div>
                    </div>
                </div>
                <div class="form-group">
                	<div class="row">
            			<div class="col-md-2">
                    		<label class="form-label pt-2" for="batch_time">시간</label>
                    	</div>
                    	<div class="col-md-2" style="width:12%;"> 
							<select id="batch_hour" class="form-control" style="padding-left:5px;"></select> 
						</div>
						<div class="col-md-2" style="width:10%;padding-left:0px;"> 
							<select id="batch_min" class="form-control" style="padding-left:5px;"></select>
						</div>
                    </div>
                </div>
                <div class="form-group">
                	<div class="row">
            			<div class="col-md-2">
                    		<label class="form-label pt-2" for="batch_desc">설명</label>
                    	</div>
                    	<div class="col-md-10">
                    		<input id="batch_desc" type="text" class="form-control" autocomplete="off">
                    	</div>
                    </div>
                </div>
                <div class="form-group">
                	<div class="row">
            			<div class="col-md-2">
                   			<label class="form-label pt-2" for="use_yn">사용여부</label>
                   		</div>
                   		<div class="col-md-10">
	                       	<select class="form-control" id="use_yn">
	                           	<option value="Y">사용</option>
								<option value="N">사용안함</option>
	                       	</select>
	                    </div>
	            	</div>
               	</div>
            </div>
            <div class="modal-footer px-6">
                <button id="btnClose"	type="button"  	class="btn btn-default btn-sm" data-dismiss="modal">닫기</button>  
				<button id="btnSave" 	type="button" 	class="btn btn-primary btn-sm">저장</button>  
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
	
	getSelectHour('batch_hour', '00', 1, '시');
	getSelectMinute('batch_min', '00', 5, '분');
	
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
      		"url":"${contextpath}/conf/batchConfigList.json",
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
			{ 	"targets":[6], "searchable":false, "orderable":false	}
       	],	  	
	  	"columns": [
	    	{ 	"data":"batch_id" 		},	 
	    	{ 	"data":"batch_nm" 		},	    	    	
	    	{ 	"data":"batch_day" 		}, 
	    	{ 	"data":"batch_time" 		},
	    	{ 	"data":"batch_desc" 	},
	    	{ 	"data":"use_yn"		},	 	
	    	{ 	"data":null, "width":"12%"			}      	
	    ],
	    "order":[0,"asc"],
	    "fnRowCallback":function(nRow, aData, iDisplayIndex, iDisplayIndexFull ) {
	    	var batch_id = aData["batch_id"];
	    	var batch_day = aData["batch_day"];
	    	
	    	var rtn_value="";
			if(batch_day.substr(0,1)=="1") rtn_value+="월,";
			if(batch_day.substr(1,1)=="1") rtn_value+="화,";
			if(batch_day.substr(2,1)=="1") rtn_value+="수,";
			if(batch_day.substr(3,1)=="1") rtn_value+="목,";
			if(batch_day.substr(4,1)=="1") rtn_value+="금,";
			if(batch_day.substr(5,1)=="1") rtn_value+="토,";
			if(batch_day.substr(6,1)=="1") rtn_value+="일"
			var last_val = rtn_value.substr(rtn_value.length-1);
			if(last_val==","){
				rtn_value = rtn_value.substring(0, rtn_value.length-1); 
			}
			$('td:eq(2)', nRow).html(rtn_value);
			
	    	rtn_value = '<button type="button" class="btn btn-warning btn-xs" title="수정"  onClick="clickBtnEdit('
				+ "'" + batch_id + "'"
				+ ')"><i class="fal fa-edit"></i></button>'; 
	    		rtn_value += '&nbsp;<button type="button" class="btn btn-warning btn-xs" title="삭제"  onClick="clickBtnDelete('
					+ "'" + batch_id + "'"
				+ ')"><i class="fal fa-trash-alt"></i></button>'; 
	    	$('td:eq(6)', nRow).html(rtn_value);
   	  	}
    });
	
	//reload
	function updateResultTable(){
		var strUrl = "${contextpath}/conf/batchConfigList.json";
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
	var form_fields = ["batch_nm","batch_day","batch_time","batch_hour","batch_min","batch_desc","upd_date","use_yn"];
	
	//추가
	$("#btnAdd").click(clickBtnAdd=function(){
		act = "insert";
		$.resetField(form_fields);
		$("input[type=checkbox]").each(function(){
			$(this).prop("checked", false);
		});
		$("#batch_id").val("");
		$("#btnSave").show();
		$("#btnEdit").hide();
		$("#btnDelete").hide();
		$("#form_modal").modal("show");
	}); 
	
	//저장
	$("#btnSave").click(clickBtnSave=function(){
		if(act=="insert"){
			if(!Service.checkForm()) return;
			Service.requestInsert();
		}else{
			if(!Service.checkForm()) return;
			Service.requestUpdate(); 
		}
	});	
	
	//수정
	$("#btnEdit").click(clickBtnEdit=function(batch_id){
		act = "update";
		Service.requestDetail(batch_id);
		$("#btnSave").show();
		$("#form_modal").modal("show");
	});	
	
	//삭제
	$("#btnDelete").click(clickBtnDelete=function(batch_id){
		Service.requestDelete(batch_id);
	});		
	
	
	/***** Start - DataTables2 *****/
	var dataTable2 = $('#dataTable2').dataTable({
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
           "searchPlaceholder": "내용,등록일"
           
        },	
      	"ajax":{ 
      		"url":"${contextpath}/log/batchLogList.json",
		  	"type":"POST" 
	  	},
	  	//"dom": '<"top"lf>rt<"bottom"ip><"clear">',
	  	"columnDefs": [  
	  		{ 	"targets":[0], "searchable":true	},	
			{ 	"targets":[1], "searchable":true	},
			{ 	"targets":[2], "searchable":true	},
			{ 	"targets":[3], "searchable":true	}
       	],	  	
	  	"columns": [
	    	{ 	"data":"seq_no" 		},	 
	    	{ 	"data":"batch_nm" 		},	    	    	
	    	{ 	"data":"content" 		},	    	    	
	    	{ 	"data":"upd_date" 		}  	
	    ],
	    "order":[0,"desc"],
	    "fnRowCallback":function(nRow, aData, iDisplayIndex, iDisplayIndexFull ) {	    
   	  	}
    });	
	
	$('#dataTable2_filter input').unbind();
	$('#dataTable2_filter input').bind('keyup', function(e) {
    	if(e.keyCode == 13) {
    		dataTable2.fnFilter(this.value);   
    	}
	});
	$('#dataTable2_length > label').css('margin-bottom','0px');
	$('#dataTable2_filter > label').css('margin-bottom','0px');
	$('#dataTable2_info').css('padding-top','0.5em');
	/***** End - DataTables2 *****/
	
});//jQuery

var Service = {	
	//아이디 중복 체크
	checkId : function(){
		return true;
	},		
	//입력 폼 체크
	checkForm : function(){
		if(!$.notnull($("#batch_nm"), "이름")) return false;
		if($("input[type='checkbox']:checked").length<1){
			alert("요일을 선택하세요");
			//$('#chk1').focus();
			return false;
		}
		//if(!$.notnull($("#batch_day"), "요일")) return false;
		//if(!$.notnull($("#batch_hour"), "시간")) return false;	
		//if(!$.notnull($("#batch_min"), "시간")) return false;	
		return true;
	},	
	//detail
	requestDetail : function(batch_id) {
		var ajaxParam = {
			"url" : "${contextpath}/conf/batchConfigDetail.json",
            "type" : "POST",
        	"data" : {
        		"batch_id" : batch_id
            }
        };
        Common.ajaxJSON(ajaxParam, function(data) {
        	$("#batch_id").val(data.result.batch_id);
        	$("#batch_nm").val(data.result.batch_nm);
			var batch_day = data.result.batch_day;
			$("input[type=checkbox]").each(function(i){
				//var checked = gridData.batch_day.substr(i, 1);
				var checked = batch_day.substr(i, 1);
				if(checked=="1"){
					$(this).prop("checked", true);
				}else {
					$(this).prop("checked", false);
				}
			});		
			$("#batch_hour").val(data.result.batch_time.substr(0,2));
			$("#batch_min").val(data.result.batch_time.substr(3,4));
			$("#batch_desc").val(data.result.batch_desc);
			$("#use_yn").val(data.result.use_yn); 
        });
	},
	//insert
	requestInsert : function() {
		var batch_day='';
		$("input[type=checkbox]").each(function(){
			if($(this).prop("checked")) batch_day+='1';
			else  batch_day+='0';
		});
		var batch_time = $("#batch_hour").val()+':'+$("#batch_min").val();		
		var ajaxParam = {
            "url" : "${contextpath}/conf/batchConfigInsert.json",
            "type" : "POST",
        	"data" : {
    			"batch_nm" : $("#batch_nm").val(),
    			"batch_day" : batch_day,
    			"batch_time" : batch_time,
    			"batch_desc" : $("#batch_desc").val(),
    			"use_yn" : $("#use_yn").val()
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
		var batch_day="";
		$("input[type=checkbox]").each(function(){
			if($(this).prop("checked")) batch_day+="1";
			else  batch_day+="0";
		});
		var batch_time = $("#batch_hour").val()+":"+$("#batch_min").val();	
		var ajaxParam = {
			"url" : "${contextpath}/conf/batchConfigUpdate.json",
            "type" : "POST",
        	"data" : {
        		"batch_id" : $("#batch_id").val(),
        		"batch_nm" : $("#batch_nm").val(),
    			"batch_day" : batch_day,
    			"batch_time" : batch_time,
    			"batch_desc" : $("#batch_desc").val(),
    			"use_yn" : $("#use_yn").val()
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
	requestDelete : function(batch_id) {
		if(confirm('삭제하시겠습니까?')){
			var ajaxParam = {
				"url" : "${contextpath}/conf/batchConfigDelete.json",
			    "type" : "POST",
			    "data" : {
			    	"batch_id" : batch_id
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
	}
	
}

//시 Select
function getSelectHour(idSelect, selected, per, display){		//01분(display)
	$('#'+idSelect+ 'option').remove();
	//$("#"+idSelect).append('<option value="">분</option>');
	for(var i=0;i<24;i=i+per) {
		if(getZerofill(i,2)==selected) $("#"+idSelect).append('<option value="'+getZerofill(i,2)+'" selected >'+getZerofill(i,2)+display+'</option>');
		else $("#"+idSelect).append('<option value="'+getZerofill(i,2)+'">'+getZerofill(i,2)+display+'</option>');
	}
}

//분 Select
function getSelectMinute(idSelect, selected, per, display){		//01분(display)
	$('#'+idSelect+ 'option').remove();
	for(var i=0;i<60;i=i+per) {
		if(getZerofill(i,2)==selected) $("#"+idSelect).append('<option value="'+getZerofill(i,2)+'" selected >'+getZerofill(i,2)+display+'</option>');
		else $("#"+idSelect).append('<option value="'+getZerofill(i,2)+'">'+getZerofill(i,2)+display+'</option>');
	}
}
</script>	
<%@ include file="/WEB-INF/views/common/CommonBottom.jsp" %>
