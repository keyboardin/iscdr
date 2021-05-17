<!-- systemSettingLdap.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" 		uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" 		uri="http://java.sun.com/jsp/jstl/functions" %>  
<%@ taglib prefix="form" 	uri="http://www.springframework.org/tags/form"%> 
<%@ taglib prefix="spring" 	uri="http://www.springframework.org/tags" %>
<c:set var="contextpath" value="<%= request.getContextPath()%>"></c:set> 

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
               		<div class="py-3"></div>
               		<div class="frame-wrap px-5">  
               	    	<div class="col-lg-6 col-xl-6">
	                        <div class="form-group">
	                        	<div class="row">
		            				<div class="col-md-2">
	                               		<label class="form-label pt-2" for="ad_ip">IP</label>   
	                            	</div>
	                            	<div class="col-md-10">
	                               		<input id="ad_ip" type="text" class="form-control" autocomplete="off">
	                               	</div>
	                           </div>
	                        </div>
	                        <div class="form-group">
	                        	<div class="row">
		            				<div class="col-md-2">
	                               		<label class="form-label pt-2" for="ad_port">Port</label>   
	                            	</div>
	                            	<div class="col-md-10">  
	                               		<input id="ad_port" type="text" class="form-control" autocomplete="off">
	                               	</div>
	                           </div>
	                        </div>
	                        <div class="form-group">  
	                        	<div class="row">
		            				<div class="col-md-2">
	                               		<label class="form-label pt-2" for="ad_id">ID</label>  
	                            	</div>
	                            	<div class="col-md-10">
	                               		<input id="ad_id" type="text" class="form-control" autocomplete="off">
	                               	</div>
	                           </div>
							</div>
							<div class="form-group">
	                        	<div class="row">
		            				<div class="col-md-2">
	                               		<label class="form-label pt-2" for="ad_pw">PW</label>  
	                            	</div>
	                            	<div class="col-md-10">
	                               		<input id="ad_pw" type="text" class="form-control" autocomplete="off">
	                               	</div>
	                           </div>
							</div>
							<div class="form-group">
	                        	<div class="row">
		            				<div class="col-md-2">
	                               		<label class="form-label pt-2" for="base_dn">Base DN</label>  
	                            	</div>
	                            	<div class="col-md-10">
	                               		<input id="base_dn" type="text" class="form-control" autocomplete="off">
	                               	</div>
	                           </div>
							</div>
							<div class="form-group">
	                        	<div class="row">
	                            	<div class="col-md-8">
	                            		<label control-label" id="valid_msg"></label> 
	                            	</div> 
	                            	<div class="col-md-4 text-right">
										<button  id="btnValid" type="button" class="btn btn-primary btn-sm">Valid</button>&nbsp;&nbsp;&nbsp;  
										<button  id="btnSave"  type="button" class="btn btn-primary btn-sm">저장</button>  
									</div>
	                        	</div>
	                    	</div>
                  			</div>
                  		</div><!-- end frame-wrap -->
                  		<div class="py-3"></div>
                  </div><!-- end "panel-content" -->
           	</div><!-- end panel-container -->
		</div><!-- end panel -->  
	</div><!-- end col -->                                      
</div><!-- end row -->

<input id="ad_no" type="hidden" value="1" />

<script type="text/javascript">
$(function() {
	
	//********** LDAP설정 - Start **********//
	Service.requestDetail(); 
	
	//저장
	$('#btnSave').click(clickBtnSave=function(){
		if(!Service.checkForm()) return;
		Service.requestUpdate(); 
	});		
	
	
	//Connect Valid
	$('#btnValid').click(clickBtnValid=function(){
		if(!Service.checkForm()) return;
		Service.requestValid(); 
	});		
	//********** LDAP설정 - Start **********//
	
});//jQuery

var Service = {	 
		
	//입력 폼 체크
	checkForm : function(){
		if(!$.notnull($('#ad_ip'), 'Server')) return false;
		if(!$.notnull($('#ad_port'), 'Port')) return false;
		if(!$.notnull($('#ad_id'), 'ID')) return false;
		if(!$.notnull($('#ad_pw'), 'PW')) return false;
		if(!$.notnull($('#base_dn'), 'Base DN')) return false;  
		
		return true;
	},		
	//Detail
	requestDetail : function() {
		var ajaxParam = {
            'url' : '${contextpath}/conf/empAdConfigDetail.json',
            'type' : 'POST',
            'data' : {
            	'ad_no': $("#ad_no").val()	
            }            
        }; 
        Common.ajaxJSON(ajaxParam, function(data) {
        	if(data.result!=null) {
	        	$("#ad_ip").val(data.result.ad_ip);
	        	$("#ad_port").val(data.result.ad_port);
	        	$("#ad_id").val(data.result.ad_id);
	        	$("#ad_pw").val(data.result.ad_pw);
	        	$("#base_dn").val(data.result.base_dn);
        	}
        });
	},
	//Update
	requestUpdate : function() {
		//console.log($('#ad_no').val()); 
		var ajaxParam = {
            'url' : '${contextpath}/conf/empAdConfigUpdate.json', 
            'type' : 'POST',
        	'data' : {  
        		'ad_ip' : $('#ad_ip').val(),
        		'ad_port' : $('#ad_port').val(),
    			'ad_id' : $('#ad_id').val(),
        		'ad_pw' : $('#ad_pw').val(),  
        		'base_dn' : $('#base_dn').val()
            }
        };
        Common.ajaxJSON(ajaxParam, function(data) {
        	if(!data){
				alert('return data error');
				return false;
			}
			alert(data.msg);
			if(!data.success) return;
        });
	},
	//Connect
	requestValid : function() {
		var ajaxParam = {
            'url' : '${contextpath}/conf/empAdConfigValid.json',
            'type' : 'POST',
            'data' : {
            	'ad_ip' : $('#ad_ip').val(),
        		'ad_port' : $('#ad_port').val(),
    			'ad_id' : $('#ad_id').val(),
        		'ad_pw' : $('#ad_pw').val(),  
        		'base_dn' : $('#base_dn').val()
            },
            'loading' : 'content_body'
        };
        Common.ajaxJSON(ajaxParam, function(data) {
        	if(data.success==1){
        		$('#valid_msg').html(data.msg);
        		$('#valid_msg').css('color', 'green');
        	}else{
        		$('#valid_msg').html(data.msg);  
        		$('#valid_msg').css('color', 'red');
        	}
        });
	}    
    
}
</script>			
<%@ include file="/WEB-INF/views/common/CommonBottom.jsp" %>

