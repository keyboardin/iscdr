<!-- systemSettingEmpDb.jsp -->
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
               		  <div class="row"> 	
               	    	<div class="col-lg-6 col-xl-6">
	                        <div class="form-group">
	                        	<div class="row">
		            				<div class="col-md-2">
	                               		<label class="form-label pt-2" for="driver">DRIVER</label>   
	                            	</div>
	                            	<div class="col-md-10">
	                               		<input id="driver" type="text" class="form-control" autocomplete="off">
	                               	</div>
	                           </div>
	                        </div>
	                        <div class="form-group">
	                        	<div class="row">
		            				<div class="col-md-2">
	                               		<label class="form-label pt-2" for="url">URL</label>   
	                            	</div>
	                            	<div class="col-md-10">  
	                               		<input id="url" type="text" class="form-control" autocomplete="off">
	                               	</div>
	                           </div>
	                        </div>
	                        <div class="form-group">
	                        	<div class="row">
		            				<div class="col-md-2">
	                               		<label class="form-label pt-2" for="id">ID</label>  
	                            	</div>
	                            	<div class="col-md-10">
	                               		<input id="id" type="text" class="form-control" autocomplete="off">
	                               	</div>
	                           </div>
							</div>
							<div class="form-group">
	                        	<div class="row">
		            				<div class="col-md-2">
	                               		<label class="form-label pt-2" for="pw">PW</label>  
	                            	</div>
	                            	<div class="col-md-10">
	                               		<input id="pw" type="text" class="form-control" autocomplete="off">
	                               	</div>
	                           </div>
							</div>
							<div class="form-group">
	                        	<div class="row">
		            				<div class="col-md-2">
	                               		<label class="form-label pt-2" for="pw">QUERY</label>  
	                            	</div>
	                            	<div class="col-md-10">
	                            		<textarea id="query" class="form-control" autocomplete="off" style="width:100%;height:150px;"></textarea>
	                               	</div>
	                           </div>
							</div>
							<div class="form-group">
	                        	<div class="row">
		            				<div class="col-md-2">
	                               		<label class="form-label pt-2" for="pw">내선처리</label>  
	                            	</div>
	                            	<div class="col-md-10">
	                               		<select id="split_flag" class="form-control">
	                               			<option value="1">앞4자리</option>
	                               			<option value="2">뒤4자리</option>
	                               		</select>
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
                  		
                  		<div class="col-lg-6 col-xl-6">
                  			<div id="query_result"></div>
                  		</div>
                  	  </div>
                  	</div>
                  	<div class="py-3"></div>
            	</div><!-- end "panel-content" -->
           	</div><!-- end panel-container -->
		</div><!-- end panel -->  
	</div><!-- end col -->                                      
</div><!-- end row -->

<input id="db_id" type="hidden" value="1" />   

<script type="text/javascript">
$(function() {
	
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
	
});//jQuery


var Service = {				   
	//입력 폼 체크
	checkForm : function(){
		if(!$.notnull($('#driver'), 'DRIVER')) return false;
		if(!$.notnull($('#url'), 'URL')) return false;
		if(!$.notnull($('#id'), 'ID')) return false;
		if(!$.notnull($('#pw'), 'PW')) return false;  
		
		return true;
	},		
	//Detail
	requestDetail : function() {
		var ajaxParam = {
            'url' : '${contextpath}/conf/empDbConfigDetail.json',
            'type' : 'POST',
            'data' : {
            	'db_id': $("#db_id").val()	
            }            
        }; 
        Common.ajaxJSON(ajaxParam, function(data) {
        	if(data.result!=null) {
	        	$("#db_id").val(data.result.db_id);
	        	$("#driver").val(data.result.driver);
	        	$("#url").val(data.result.url);
	        	$("#id").val(data.result.id);
	        	$("#pw").val(data.result.pw);	
	        	$("#query").val(data.result.query);	
	        	$("#split_flag").val(data.result.split_flag);	
        	}
        });
	},
	//Update
	requestUpdate : function() {
		console.log($('#db_id').val()); 
		var ajaxParam = {
            'url' : '${contextpath}/conf/empDbConfigUpdate.json', 
            'type' : 'POST',
        	'data' : {  
        		'db_id' : $('#db_id').val(),
        		'driver' : $('#driver').val(),
    			'url' : $('#url').val(),
        		'id' : $('#id').val(),  
        		'pw' : $('#pw').val(),
        		'query' : $('#query').val(),
        		'split_flag' : $('#split_flag').val()
        		
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
            'url' : '${contextpath}/conf/empDbConfigValid.json',
            'type' : 'POST',
            'data' : {
            	'driver' : $('#driver').val(),
    			'url' : $('#url').val(),
        		'id' : $('#id').val(),
        		'pw' : $('#pw').val(),
        		'query' : $('#query').val(),
        		'split_flag' : $('#split_flag').val(),
            }            
        };
        Common.ajaxJSON(ajaxParam, function(data) {
        	//console.log(JSON.stringify(data.rows));
        	if(data.success==1){
        		$('#valid_msg').html(data.msg);
        		$('#valid_msg').css('color', 'green');
        		$('#query_result').html(JSON.stringify(data.data));
        	}else{
        		$('#valid_msg').html(data.msg);
        		$('#valid_msg').css('color', 'red');
        	}
        });
	},
	
}
</script>	