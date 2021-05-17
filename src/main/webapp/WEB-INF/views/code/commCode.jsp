<!-- commCode.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/CommonCss.jsp" %>
<%@ include file="/WEB-INF/views/common/CommonHeader.jsp" %> 

<!-- BEGIN Page Content -->
<main id="js-page-content" role="main" class="page-content">
	<ol class="breadcrumb page-breadcrumb" id="menu_title">
		&nbsp; 
	</ol>
   
	<div class="row">  
		<div class="col-lg-3 col-xl-3">
			<!--Basic tables-->
			<div id="panel-1" class="panel">
				<div class="panel-hdr">
					<h2><!-- 코드트리 --></h2>  
					<div class="panel-toolbar"> 
						<button class="btn btn-panel" data-action="panel-collapse" data-toggle="tooltip" data-offset="0,10" data-original-title="Collapse"></button>
						<button class="btn btn-panel" data-action="panel-fullscreen" data-toggle="tooltip" data-offset="0,10" data-original-title="Fullscreen"></button>
						<button class="btn btn-panel" data-action="panel-close" data-toggle="tooltip" data-offset="0,10" data-original-title="Close"></button>
					</div>
				</div>
				<div class="panel-container show custom-scroll" style="height:755px;overflow-x:scroll;overflow-y:scroll;">   
					<div class="panel-content">
						<div class="frame-wrap">
							<div class="form-group">
								<div class="row">
									<div class="col-lg-12 text-right">  
										<button id="btnAdd" type="button" class="btn btn-primary btn-sm" data-toggle="modal">등록</button>
									</div> 
								</div>
							</div>  
							<div id="resultTree">      
								<ul></ul>   
							</div>
						</div>                                          
					</div>
				</div>
			</div>
		</div>    
		
		<div class="col-lg-9 col-xl-9">
			<div id="panel-2" class="panel">
				<div class="panel-hdr">
					<h2><!-- 코드리스트 --></h2>  
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
										<th>그룹코드</th> 
										<th>그룹명</th>  
										<th>코드</th>   
										<th>코드명</th>   
										<th>코드별칭</th>   
							            <th>코드값</th>  
							            <th>우선순위</th>   
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
            				<label class="form-label pt-2" for="group_id">그룹코드</label> 
            			</div>
            			<div class="col-md-10">
            				<input type="text" id="group_id" class="form-control">     
            			</div>  
            		</div>
                </div>
                <div class="form-group">
            		<div class="row">
            			<div class="col-md-2">
            				<label class="form-label pt-2" for="group_nm">그룹명</label>
            			</div>
            			<div class="col-md-10">
            				<input id="group_nm" type="text" class="form-control" autocomplete="off">
            			</div>  
            		</div>
                </div>
                <div class="form-group">
                	<div class="row">
            			<div class="col-md-2">
            				<label class="form-label pt-2" for="code_id">코드</label>
            			</div>
                    	<div class="col-md-10">
                    		<input id="code_id" type="text" class="form-control" autocomplete="off">
                    	</div>
                    </div>
                </div>
                <div class="form-group">
                	<div class="row">
                    	<div class="col-md-2">
                    	<label class="form-label pt-2" for="code_nm">코드명</label></div>
                    	<div class="col-md-10">
                    	<input type="text" id="code_nm" class="form-control" autocomplete="off"></div>
                   </div>
                </div>
                <div class="form-group">
               		<div class="row">
	                    <div class="col-md-2">
	                    	<label class="form-label pt-2" for="code_alias">코드별칭</label>
	                    </div>
	                    <div class="col-md-10">
	                    	<input id="code_alias" type="text" class="form-control" autocomplete="off">
	                    </div>
                    </div>
                </div>
                <div class="form-group">
                	<div class="row">
	                    <div class="col-md-2">
	                    	<label class="form-label pt-2" for="code_value">코드값</label>
	                    </div>
	                    <div class="col-md-10">
	                    <input id="code_value" type="text" class="form-control" autocomplete="off"></div>
                    </div>
                </div>
                <div class="form-group">
                	<div class="row">
                    	<div class="col-md-2">
                    		<label class="form-label pt-2" for="priority">우선순위</label>
                    	</div>
                    	<div class="col-md-10">
                    		<input id="priority" type="text" class="form-control" autocomplete="off">
                    	</div> 
                   </div>
                </div>
                <div class="form-group">
                	<div class="row">
                   		<div class="col-md-2"><label class="form-label pt-2" for="use_yn">사용여부</label></div>
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
                <button id="btnClose" 	type="button" 	class="btn btn-default btn-sm" data-dismiss="modal">닫기</button>
                <button id="btnSave"	type="button" 	class="btn btn-primary btn-sm">저장</button>
            </div>
        </div>
    </div>
</div>
<!-- END Modal -->

<input id="search_group_id" type="hidden" />
<!-- <input id="group_nm" type="hidden" /> -->

<%@ include file="/WEB-INF/views/common/CommonFooter.jsp" %>                    
<%@ include file="/WEB-INF/views/common/CommonJs.jsp" %>
<script src="${contextpath}/static/plugin/jstree/js/jstree.min.js"></script>
<script src="${contextpath}/static/common/js/common.js"></script> 
<script type="text/javascript">
$(function() {
	
	setTitle('${param.menu_par_id}','${param.menu_id}');  
	
	var init_flag=0;
	
	/***** Start - Tree *****/   
	var resultTree;
	
	function createResultTree(){
		$.post( 
			'${contextpath}/code/commCodeTree.json',	
			function(data,textStatus,jqXHR){ 
				if(!data){ alert('return data error');
					return false; 
				}	
				resultTree = $('#resultTree').jstree({		 			
					"plugins" : ["sort", "dnd", "types", "json_data"],
				    //"plugins" : ["sort", "contextmenu", "dnd", "types", "json_data"], 
				    //"plugins":["sort","state","wholerow"(dotsless)],
					"core" : {
						"data" : data.resultTree, 
						"check_callback" : true,
						"themes" : { "name":"default", "dots":true, "icons":true }
					},
					//"core" : { "themes" : { "name" : "default-dark", "icons":true } }
					//"contextmenu" : {
					//    "items" : customMenu
					//} 
				}).bind('select_node.jstree',function(e,data){ 	
					//console.log(debug(data.node.original));			
					//console.log(data.node.original.level);
					if(data.node.original.level==0){ 
						$("#search_group_id").val("");
						if(init_flag==1){
							updateResultTable();	
						}
						init_flag=1;						
					}else if(data.node.original.level==1){						
						//console.log(data.node.original.id);
						//console.log(data.node.original.text);
						$("#search_group_id").val(data.node.original.id);
						//$("#group_nm").val(data.node.original.text);
						updateResultTable();
					}
				
				}).on('loaded.jstree', function() {
		        	//if('${sessionScope.tree_open_flag}'=='Y'){
		        		$(this).jstree('open_all'); 
		        	//}		
		        	$(this).jstree('open_node', 'CD00'); 
		            var nodes = $(this).jstree(true).get_json('#', {'flat': true});
		            $(this).jstree('select_node', nodes[0].id); //최상위 루트그룹 선택
		            
		        }).on('refresh.jstree', function(event, data) { 
		        	//$(this).jstree("deselect_all");
		            //$(this).jstree('open_all'); 	
		            //$(this).jstree('open_node', 'CD00');  
		        });				    
			},
			'json'
		); // $.post(
	}
	
	createResultTree(); //그룹&호스트 트리구성 호출	
	
 	function updateResultTree(){
		$.post(     
			"${contextpath}/code/commCodeTree.json",			
			function(data,textStatus,jqXHR){ 
				if(!data){ alert('return data error');
					return false;  
				}
				resultTree.jstree(true).settings.core.data = data.resultTree;
				resultTree.jstree(true).refresh(); 
			}
		);	
	} 
	/***** End - Tree *****/  
	
	
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
      		"url":"${contextpath}/code/commCodeListAll.json",
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
	    	{ 	"data":"group_id" 		},	 
	    	{ 	"data":"group_nm" 		},	    	    	
	    	{ 	"data":"code_id" 		}, 
	    	{ 	"data":"code_nm" 		},
	    	{ 	"data":"code_alias" 	},
	    	{ 	"data":"code_value"		},	
	    	{ 	"data":"priority" 		},      	
	    	{ 	"data":"use_yn_nm" 	},      	
	    	{ 	"data":null, "width":"12%"			}      	
	    ],
	    "order":[[0,"asc"],[2,"asc"]],
	    "fnRowCallback":function(nRow, aData, iDisplayIndex, iDisplayIndexFull ) {
	    	var use_yn = aData["use_yn"];
	    	if(use_yn=='N'){
	    		$(nRow).css('color', '#ff0000');
	    	}
	    	var group_id = aData["group_id"];
	    	var code_id = aData["code_id"];
	    	var rtn_value = '<button type="button" class="btn btn-warning btn-xs" title="수정"  onClick="clickBtnEdit('
				+ "'" + group_id + "',"
				+ "'" + code_id + "'"
				+ ')"><i class="fal fa-edit"></i></button>'; 
	    		rtn_value += '&nbsp;<button type="button" class="btn btn-warning btn-xs" title="삭제"  onClick="clickBtnDelete('
	    			+ "'" + group_id + "',"
					+ "'" + code_id + "'"
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
	
	//조회
	function updateResultTable(){
		var strUrl = "${contextpath}/code/commCodeListAll.json";
		strUrl += '?group_id='+encodeURIComponent($("#search_group_id").val());
		dataTable.api().ajax.url(strUrl).load();	
		//dataTable.DataTable().ajax.reload(null, false);	
	}
	/***** End - DataTables *****/
	
	
	var act = "insert"; 
	var str_url = "";
	var form_fields = ['group_id','group_nm','code_id','code_nm','code_alias','code_value','priority','use_yn'];
	
	//조회
	$('#btnSearch').click(clickBtnSearch=function(){  
		updateResultTable();
		updateResultTree();
	});
	
	//추가
	$("#btnAdd").click(clickBtnAdd=function(){
		act = "insert";
		$.resetField(form_fields);
		//console.log('==== '+$('#group_id').val()); 
		/* if($('#group_id').val() != ''){
			$('#group_id').val($('#group_id_search').val());
			var group_nm = $('#group_id_search option:selected').text();
			$('#group_nm').val(group_nm.split('[')[0]); 
		} */
		$('#btnSave').show();
		$("#form_modal").modal("show"); 
	}); 
	
	//저장
	$('#btnSave').click(clickBtnSave=function(){
		if(!Service.checkForm()) return;
		if(act=='insert'){
			Service.requestInsert();
		}else{
			Service.requestUpdate(); 
		}
	});	
	
	//수정
	$('#btnEdit').click(clickBtnEdit=function(group_id, code_id){
		act = "update";
		Service.requestDetail(group_id, code_id);
		$('#group_id').attr('readonly', true);
		$('#code_id').attr('readonly', true);
		$('#btnSave').show();
		$("#form_modal").modal("show");		
	});	
	
	//삭제
	$('#btnDelete').click(clickBtnDelete=function(group_id, code_id){
		Service.requestDelete(group_id, code_id);
	});	
	
	//Service.requestGroupList();
	
});//jQuery

var Service = {				
	//입력 폼 체크
	checkForm : function(){
		if(!$.notnull($('#code_id'), '코드')) return false;
		if(!$.notnull($('#code_nm'), '코드명')) return false;
		if(!$.notnull($('#group_id'), '그룹코드')) return false;
		if(!$.notnull($('#group_nm'), '그룹명')) return false;
		return true;
	},			
	//detail
	requestDetail : function(group_id, code_id) {
		var ajaxParam = {
            "url" : "${contextpath}/code/commCodeDetail.json",
            "type" : "POST",
        	"data" : {
        		"group_id" : group_id,
        		"code_id" : code_id
            }
        };
        Common.ajaxJSON(ajaxParam, function(data) {
			$("#group_id").val(data.result.group_id);
			$("#group_nm").val(data.result.group_nm);
			$("#code_id").val(data.result.code_id);
			$("#code_nm").val(data.result.code_nm);
			$("#code_alias").val(data.result.code_alias);
			$("#code_value").val(data.result.code_value);
			$("#priority").val(data.result.priority);
			$("#use_yn").val(data.result.use_yn);
        });
	},
	//insert
	requestInsert : function() {
		var ajaxParam = {
            "url" : "${contextpath}/code/commCodeInsert.json",
            "type" : "POST",
        	"data" : {
        		"group_id" : $("#group_id").val(),
    			"group_nm" : $("#group_nm").val(),
        		"code_id" : $("#code_id").val(),
    			"code_nm" : $("#code_nm").val(),
    			"code_alias" : $("#code_alias").val(),
    			"code_value" : $("#code_value").val(),
    			"priority" : $("#priority").val(),
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
			/* var flag=0;
			$('#group_id_search > option').each(function(){
				if($(this).val()==$("#group_id").val()){
					flag=1;
				}
			});
			if(flag==0){
				Service.requestGroupList();
			} */
			clickBtnSearch();
        });
	},
	//update
	requestUpdate : function() {
		var ajaxParam = {
            "url" : "${contextpath}/code/commCodeUpdate.json",
            "type" : "POST",
        	"data" : {
        		"group_id" : $("#group_id").val(),
    			"group_nm" : $("#group_nm").val(),
        		"code_id" : $("#code_id").val(),
    			"code_nm" : $("#code_nm").val(),
    			"code_alias" : $("#code_alias").val(),
    			"code_value" : $("#code_value").val(),
    			"priority" : $("#priority").val(),
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
	requestDelete : function(group_id, code_id) {
		if(confirm('삭제하시겠습니까?')){
			var ajaxParam = {
				"url" : '${contextpath}/code/commCodeDelete.json',
			    "type" : "POST",
			    "data" : {
			    	"group_id" : group_id,
			    	"code_id" : code_id
			    }
			}			
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
		}
	},
	//코드그룹리스트
	requestGroupList : function() {
		var ajaxParam = {
			"url" : '${contextpath}/code/commCodeGroupList.json',
		    "type" : "POST"
		}			
		Common.ajaxJSON(ajaxParam, function(data) { 
			$('#group_id_search option').remove();
	    	$('#group_id_search').append("<option value=''>선택</option>");
	    	$.each(data.resultList, function(index, item) {
				$('#group_id_search').append("<option value='"+item.group_id+"'>"+item.group_nm+"["+item.group_id+"]</option>");							    		
	    	});
	    }); 
	},
}
</script>	
<%@ include file="/WEB-INF/views/common/CommonBottom.jsp" %>
