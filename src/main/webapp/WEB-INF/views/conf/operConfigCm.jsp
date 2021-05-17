<!-- systemSettingCm.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" 		uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" 		uri="http://java.sun.com/jsp/jstl/functions" %>  
<%@ taglib prefix="form" 	uri="http://www.springframework.org/tags/form"%> 
<%@ taglib prefix="spring" 	uri="http://www.springframework.org/tags" %>
<c:set var="contextpath" value="<%= request.getContextPath()%>"></c:set> 

<div class="row">  
	<div class="col-lg-3 col-xl-3">
		<div id="panel-1" class="panel">
			<div class="panel-hdr">
				<h2></h2>  
				<div class="panel-toolbar"> 
					<button class="btn btn-panel" data-action="panel-collapse" data-toggle="tooltip" data-offset="0,10" data-original-title="Collapse"></button>
					<button class="btn btn-panel" data-action="panel-fullscreen" data-toggle="tooltip" data-offset="0,10" data-original-title="Fullscreen"></button>
					<button class="btn btn-panel" data-action="panel-close" data-toggle="tooltip" data-offset="0,10" data-original-title="Close"></button>
				</div>
			</div>
			<div class="panel-container show custom-scroll" style="height:650px;overflow-x:scroll;overflow-y:scroll;">   
				<div class="panel-content">
					<div class="frame-wrap">
						<button id="btnAdd" type="button" class="btn btn-primary btn-sm fa-pull-right" data-toggle="modal">등록</button>
						<br><br>
						<div id="cmTree">      
							<ul></ul>   
						</div>
					</div>                                          
				</div>
			</div>
		</div>
	</div>    
	
	<div class="col-lg-9 col-xl-9">
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
					<div class="py-3"></div>
					<div class="frame-wrap px-5">
						<div class="col-lg-6 col-xl-6">
	                        <div class="form-group">
	                        	<div class="row"> 
		            				<div class="col-md-2">
	                               		<label class="form-label pt-2" for="cm_nm">CM명</label>   
	                            	</div>
	                            	<div class="col-md-10">
	                               		<input id="cm_nm" type="text" class="form-control" autocomplete="off">
	                               	</div>
	                           </div>
	                        </div>
	                        <div class="form-group">
	                        	<div class="row">
		            				<div class="col-md-2">
	                               		<label class="form-label pt-2" for="cm_ip">IP</label>   
	                            	</div>
	                            	<div class="col-md-10">  
	                               		<input id="cm_ip" type="text" class="form-control" autocomplete="off">
	                               	</div>
	                           </div>
	                        </div>
	                        <div class="form-group">
	                        	<div class="row">
		            				<div class="col-md-2">
	                               		<label class="form-label pt-2" for="cm_port">Port</label>  
	                            	</div>
	                            	<div class="col-md-10">
	                               		<input id="cm_port" type="text" class="form-control" autocomplete="off">
	                               	</div>
	                           </div>
							</div>
							<div class="form-group">
	                        	<div class="row">
		            				<div class="col-md-2">
	                               		<label class="form-label pt-2" for="cm_id">ID</label>  
	                            	</div>
	                            	<div class="col-md-10">
	                               		<input id="cm_id" type="text" class="form-control" autocomplete="off">
	                               	</div>
	                           </div>
							</div>
							<div class="form-group">
	                        	<div class="row">
		            				<div class="col-md-2">
	                               		<label class="form-label pt-2" for="cm_pw">PW</label>  
	                            	</div>
	                            	<div class="col-md-10">
	                               		<input id="cm_pw" type="text" class="form-control" autocomplete="off">
	                               	</div>
	                           </div>
							</div>
							<div class="form-group">
	                        	<div class="row">
		            				<div class="col-md-2">
	                               		<label class="form-label pt-2" for="cm_ver">버전</label>  
	                            	</div>
	                            	<div class="col-md-10">
	                               		<input id="cm_ver" type="text" class="form-control" autocomplete="off">
	                               	</div>
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
	                            	<div class="col-md-8">
	                            		<label control-label" id="valid_msg"></label> 
	                            	</div>
	                            	<div class="col-md-4 text-right">
										<button  id="btnSave" 	type="button" class="btn btn-primary btn-sm">저장</button>&nbsp;&nbsp;&nbsp;  
										<button  id="btnDelete" type="button" class="btn btn-primary btn-sm">삭제</button>  
									</div>
	                        	</div>
	                    	</div>
                  		</div>
					</div>
					<div class="py-3"></div>                                             
				</div>
			</div>
		</div>  
	</div>                                      
</div>

<input id="cm_no" type="hidden" />

<script type="text/javascript">
$(function() {

	//********** CM설정 - Start **********//
	/***** CM Tree - Start *****/   
	var cmTree;
	
	function createCmTree(){
		$.post( 
			'${contextpath}/conf/cmConfigTree.json',	
			function(data,textStatus,jqXHR){ 
				if(!data){ alert('return data error');
					return false; 
				}	
				cmTree = $('#cmTree').jstree({		 			
					//"state" : { "key":"EquGroupList" },
					"plugins" : ["sort", "dnd", "types", "json_data"],
				    //"plugins" : ["sort", "contextmenu", "dnd", "types", "json_data"], 
				    //"plugins":["sort","state","wholerow"(dotsless)],
					"core" : {
						"data" : data.cmTree, 
						"check_callback" : true,
						"themes" : { "name":"default", "dots":true, "icons":true }
					},
					//"core" : { "themes" : { "name" : "default-dark", "icons":true } }
					//"contextmenu" : {
					//    "items" : customMenu
					//} 
				}).bind('select_node.jstree',function(e,data){ 	
					//console.log(debug(data.node.original));				
					if(data.node.original.row_type=='equ'){
						$('#cm_no').val(data.node.id);
						Service.cmsConfigDetail(); 
						$('#btnDelete').show(); 
					}else{
						$('#cm_no').val('');  
						$('#cm_nm').val('');
			        	$('#cm_ip').val('');
			        	$('#cm_port').val('');
			        	$('#cm_id').val('');
			        	$('#cm_pw').val('');  
			        	$('#cm_ver').val('');  
			        	$('#priority').val('');  
			        	$('#btnDelete').hide(); 
					}		
				}).on('loaded.jstree', function() {
		        	$(this).jstree('open_all');  
		            var nodes = $(this).jstree(true).get_json('#', {'flat': true});  
		            $(this).jstree('select_node', nodes[0].id); 	//최상위 루트그룹 선택         
		        }).on('refresh.jstree', function(event, data) { 
		        	//$(this).jstree("deselect_all");
		            $(this).jstree('open_all'); 		        
		            var nodes = $(this).jstree(true).get_json('#', {'flat': true});
		            $(this).jstree('select_node', nodes[0].id); 	//최상위 루트그룹 선택      
		        });				    
			},
			'json'  
		); // $.post(  
	}
	
	createCmTree(); //CM 트리구성 호출	
	
 	$.updateCmTree=function(){
		$.post(     
			"${contextpath}/conf/cmConfigTree.json",			
			function(data,textStatus,jqXHR){ 
				if(!data){ alert('return data error');
					return false;  
				}
				cmTree.jstree(true).settings.core.data = data.cmTree;
				cmTree.jstree(true).refresh(); 
			}  
		);	
		cmTree.jstree(true).deselect_all();  
		cmTree.jstree('select_node', 0);   
	}
	/***** CM Tree - End *****/   
	
	//등록
	$("#btnAdd").click(clickBtnAdd=function(){ 
		$('#cm_no').val('');  
		$('#cm_nm').val('');
       	$('#cm_ip').val('');
       	$('#cm_port').val('');
       	$('#cm_id').val('');
       	$('#cm_pw').val('');    
       	$('#cm_ver').val('');    
       	$('#priority').val('');    
       	$('#btnDelete').hide(); 
       	cmTree.jstree(true).deselect_all();   
       	cmTree.jstree('select_node', 0); 
	}); 
	
	//저장
    $("#btnSave").click(clickBtnSave=function(){
        if(!Service.checkForm()) return;
        if($('#cm_no').val()!=''){
        	Service.requestUpdate();
        }else{
        	Service.requestInsert();  
        }  
    });
	
	//삭제
    $("#btnDelete").click(clickBtnSave=function(){
       	Service.requestDelete();  
    });
	//********** CM설정 - End **********//  
	
});//jQuery

var Service = {	 
		
	checkForm : function(){
        if(!$.notnull($("#cm_nm"), "CM명")) return false;
        if(!$.notnull($("#cm_ip"), "IP")) return false;
        if(!$.notnull($("#cm_port"), "Port")) return false;
        if(!$.notnull($("#cm_id"), "ID")) return false;
        if(!$.notnull($("#cm_pw"), "PW")) return false;
        if(!$.notnull($("#cm_ver"), "버전")) return false;
        if(!$.notnull($("#priority"), "우선순위")) return false;
        return true;
    },
	//CM Detail
    cmsConfigDetail : function() {
       var ajaxParam = {
            "url" : "${contextpath}/conf/cmConfigDetail.json",
            "type" : "POST",
            "data" : {
                "cm_no" : $('#cm_no').val()
            }
        }
        Common.ajaxJSON(ajaxParam, function(data) {
        	$('#cm_no').val(data.result.cm_no);
        	$('#cm_nm').val(data.result.cm_nm);
        	$('#cm_ip').val(data.result.cm_ip);
        	$('#cm_port').val(data.result.cm_port);
        	$('#cm_id').val(data.result.cm_id);
        	$('#cm_pw').val(data.result.cm_pw);
        	$('#cm_ver').val(data.result.cm_ver);
        	$('#priority').val(data.result.priority);
       	});
    }, 
    //CM Insert
    requestInsert : function() {
        var ajaxParam = {
            "url" : "${contextpath}/conf/cmConfigInsert.json",
            "type" : "POST",
            "data" : {
                "cm_nm" : $("#cm_nm").val(),
                "cm_ip" : $("#cm_ip").val(),
                "cm_port" : $("#cm_port").val(),
                "cm_id" : $("#cm_id").val(),
                "cm_pw" : $("#cm_pw").val(),
                "cm_ver" : $("#cm_ver").val(),
                "priority" : $("#priority").val()
            }
        };
        Common.ajaxJSON(ajaxParam, function(data) {
            if(!data){
                alert('return data error');
                return false;
            }
            alert(data.msg);
            if(!data.success) return;
            $.updateCmTree();
        });  
    },
    //CM Update
    requestUpdate : function() {
        var ajaxParam = {
            "url" : "${contextpath}/conf/cmConfigUpdate.json",
            "type" : "POST",
            "data" : {
                "cm_no" : $("#cm_no").val(),
                "cm_nm" : $("#cm_nm").val(),
                "cm_ip" : $("#cm_ip").val(),
                "cm_port" : $("#cm_port").val(),
                "cm_id" : $("#cm_id").val(),
                "cm_pw" : $("#cm_pw").val(),
                "cm_ver" : $("#cm_ver").val(),
                "priority" : $("#priority").val()
            }
        };
        Common.ajaxJSON(ajaxParam, function(data) {
            if(!data){
                alert('return data error');
                return false;
            }
            alert(data.msg);
            if(!data.success) return;
            $.updateCmTree();
        });
    },
    //CM Delete  
    requestDelete : function() {
        if(confirm('삭제하시겠습니까?')){
            var ajaxParam = {
                "url" : '${contextpath}/conf/cmConfigDelete.json',
                "type" : "POST",
                "data" : {
                    "cm_no" : $("#cm_no").val()
                }
            }
            Common.ajaxJSON(ajaxParam, function(data) {
                if(!data){
                    alert("return data error");
                    return false;
                }
                alert(data.msg);
                if(!data.success) return;
                $.updateCmTree();  
            });
        }
    }
    
    
}
</script>	

