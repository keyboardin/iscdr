<!-- systemSetting.jsp -->
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
                		<div class="py-3"></div>          		
                		<!-- 기본설정 Start -->
                		<div class="frame-wrap px-5">  
                	    	<div class="col-lg-6 col-xl-6">
		                        <div class="form-group">
		                        	<div class="row">
			            				<div class="col-md-2">
		                               		<label class="form-label pt-2" for="chart_type">차트타입</label>   
		                            	</div>
		                            	<div class="col-md-10">
		                               		<select id="chart_type" class="form-control">
		                               			<option value="C3">C3</option>
												<option value="Flot">Flot</option> 
												<option value="Google">Google</option> 
		                               		</select>
		                               	</div>
		                           </div>
		                        </div>
		                        <div class="form-group"> 
		                        	<div class="row">
			            				<div class="col-md-2">
		                               		<label class="form-label pt-2" for="bot_use_yn">알림봇</label>   
		                            	</div>
		                            	<div class="col-md-10">
		                               		<select id="bot_use_yn" class="form-control">
												<option value="Y">ON</option>
												<option value="N">OFF</option> 
											</select>
		                               	</div>
		                           </div>
		                        </div>
		                        <div class="form-group"> 
		                        	<div class="row">
			            				<div class="col-md-2">
		                               		<label class="form-label pt-2" for="tree_use_yn">트리사용</label>   
		                            	</div>
		                            	<div class="col-md-10">
		                               		<select id="tree_use_yn" class="form-control">
												<option value="Y">Tree</option>
												<option value="N">Select</option> 
											</select>
		                               	</div>
		                           </div>
		                        </div>
		                        <div class="form-group"> 
		                        	<div class="row">
			            				<div class="col-md-2">
		                               		<label class="form-label pt-2" for="monitoring_polling_time">모티터링폴링</label>   
		                            	</div>
		                            	<div class="col-md-10">
		                               		<select id="monitoring_polling_time" class="form-control">  
												<option value="10000">10초</option>
												<option value="20000">20초</option> 
												<option value="30000">30초</option>
												<option value="40000">40초</option> 
												<option value="50000">50초</option> 
												<option value="60000">60초</option> 
											</select>
		                               	</div>
		                           </div>
		                        </div>
								<div class="form-group">
		                        	<div class="row"> 
		                            	<div class="col-md-12 text-right">
		                               		<button id="btnSave" type="submit" class="btn btn-primary btn-sm">저장</button> 
		                               	</div>
		                           </div>  
								</div>
                   			</div>
                   		</div><!-- end frame-wrap -->
                   		<div class="py-3"></div>
                   		<!-- 기본설정 End -->
                   		
                   </div><!-- end "panel-content" -->
            	</div><!-- end panel-container -->
			</div><!-- end panel -->  
		</div><!-- end col -->                                      
	</div><!-- end row -->
	
</main>
<!-- END Page Content -->     

<%@ include file="/WEB-INF/views/common/CommonFooter.jsp" %>                    
<%@ include file="/WEB-INF/views/common/CommonJs.jsp" %>
<script src="${contextpath}/static/common/js/common.js"></script> 
<script type="text/javascript">
$(function() {
	
	setTitle('${param.menu_par_id}','${param.menu_id}');

	//List
	function requestList() {
		var ajaxParam = {
            'url' : '${contextpath}/conf/systemSettingList.json',
            'type' : 'POST',
            'data' : {
            	'group_id':'CD03'	//운영환경
            }            
        };
        Common.ajaxJSON(ajaxParam, function(data) {
        	$.each(data.resultList, function(i, item){
        		//console.log(item);
        		if(item.code_alias=='chart_type') {
        			$('#'+item.code_alias).val(item.code_value); 
        		} else if(item.code_alias=='bot_use_yn') {
        			$('#'+item.code_alias).val(item.code_value); 
        		} else if(item.code_alias=='tree_use_yn') {
        			$('#'+item.code_alias).val(item.code_value); 
        		} else if(item.code_alias=='monitoring_polling_time') {
        			$('#'+item.code_alias).val(item.code_value); 
        		} 
        		
        	})        	
        });
	}
	
	requestList();  
	
	function createSelectBox(idSelect, group_id, selected){
		var ajaxParam = {
			"url" : '${contextpath}/code/commCodeListAll.json',
		    "type" : "POST",
		    "data" : {
		    	"group_id" : group_id,
		    	"use_yn" : "Y",
		    	"sidx" : "code_id"
		    }
		}			
		Common.ajaxJSON(ajaxParam, function(data) { 
			$("#"+idSelect+" option").remove(); 
	    	$.each(data.rows, function(i, item) {
	    		//console.log(item.code); 
				$('#'+idSelect).append("<option value='"+item.code_nm+"'>"+item.code_nm+"</option>");
	    	});
	    	$('#'+idSelect).val(selected);
	    }); 
	}
	
	//기본설정저장
	$('#btnSave').click(clickBtnSave=function(){
		Service.requestUpdate();
	});
	/* 
	$('.buttons').click(clickBtnSave=function(){
		var code_id = $(this).attr('id').replace('btn_', '');
		$('#code_id').val(code_id);
		$('#code_value').val($('#'+code_id).val());
		
		//폼 체크
		//if(!Service.checkForm()) return;
		Service.requestUpdate(); 
	});		 
	*/
	
});//jQuery


var Service = {				
	//입력 폼 체크
	checkForm : function(){
		if(!$.notnull($('#chart_type'), '차트')) return false;
		if(!$.notnull($('#bot_use_yn'), '알림봇')) return false;
		return true;
	},		
	
	//Update
	requestUpdate : function() {
		var code_id = '0001,0002,0003,0004';
		var code_value = $('#chart_type').val()+',';
		code_value +=    $('#bot_use_yn').val()+',';
		code_value +=    $('#tree_use_yn').val()+',';
		code_value +=    $('#monitoring_polling_time').val();
		var ajaxParam = {
            'url' : '${contextpath}/conf/systemSettingUpdate.json',
            'type' : 'POST',
        	'data' : {
        		'code_id' : code_id,
            	'code_value' : code_value,
        		'group_id' : 'CD03'
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
	}
	
}
</script>	
<%@ include file="/WEB-INF/views/common/CommonBottom.jsp" %>
