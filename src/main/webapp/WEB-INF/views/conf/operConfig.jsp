<!-- operConfig.jsp -->
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
				<!-- <div class="panel-hdr">
					<h2></h2>
					<div class="panel-toolbar">
						<button class="btn btn-panel" data-action="panel-collapse" data-toggle="tooltip" data-offset="0,10" data-original-title="Collapse"></button>
						<button class="btn btn-panel" data-action="panel-fullscreen" data-toggle="tooltip" data-offset="0,10" data-original-title="Fullscreen"></button>
						<button class="btn btn-panel" data-action="panel-close" data-toggle="tooltip" data-offset="0,10" data-original-title="Close"></button>
					</div>
				</div>  -->
				<div class="panel-container show">
					<div class="panel-content"> 
						<div class="frame-wrap">
							<ul class="nav nav-tabs" role="tablist" id="main_tab">
	                            <li class="nav-item" id="main_tab_0">
	                                <a class="nav-link fs-lg px-4" data-toggle="tab" href="#" role="tab" aria-selected="true">
	                                    <span class="hidden-sm-down ml-1">CM설정</span>
	                                </a>
	                            </li>
	                            <li class="nav-item" id="main_tab_1">
	                                <a class="nav-link fs-lg px-4" data-toggle="tab" href="#" role="tab" aria-selected="false">
	                                    <span class="hidden-sm-down ml-1">인사DB</span>
	                                </a>
	                            </li>
	                            <li class="nav-item" id="main_tab_2">
	                                <a class="nav-link fs-lg px-4" data-toggle="tab" href="#" role="tab" aria-selected="false">
	                                    <span class="hidden-sm-down ml-1">LDAP설정</span>
	                                </a>
	                            </li>
	                            <li class="nav-item" id="main_tab_3">
	                                <a class="nav-link fs-lg px-4" data-toggle="tab" href="#" role="tab" aria-selected="false">
	                                    <span class="hidden-sm-down ml-1">일배치</span>
	                                </a>
	                            </li>
	                        </ul>
	                        <div class="frame-wrap" id="main_content" style="padding-top:30px;"></div>
	                    </div><!-- end frame-wrap -->                               
					</div><!-- end panel-content -->
				</div>
			</div>  
		</div>                                      
	</div>
</main>
<!-- END Page Content -->     

<%@ include file="/WEB-INF/views/common/CommonFooter.jsp" %>                    
<%@ include file="/WEB-INF/views/common/CommonJs.jsp" %>
<script src="${contextpath}/static/plugin/jqgrid/jquery.jqGrid.min.js"></script>
<script src="${contextpath}/static/plugin/jqgrid/grid.locale-en.min.js"></script>
<script src="${contextpath}/static/plugin/jstree/js/jstree.min.js"></script>
<script src="${contextpath}/static/common/js/common.js"></script> 
<script type="text/javascript">
$(function() {

	setTitle('${param.menu_par_id}','${param.menu_id}');
	
	$("#main_tab > li > a").each(function(index){   
		//console.log(index);
		if(index==0){	//첫번째 탭 로드
			$(this).addClass('active');
			$("#main_content").load('${contextpath}/conf/operConfigCm.do');
		}else{
			$(this).removeClass('active');
		}    
	});   		
	
	
	//탭선택시 페이지 이동
	var strPage="";		
	$(document).on("click", "#main_tab > li", function(){	
		//console.log($(this).index());
		if($(this).index()==0)		 strPage = "operConfigCm";	
		else if($(this).index()==1)  strPage = "operConfigEmpDb"; 		
		else if($(this).index()==2)  strPage = "operConfigLdap"; 		
		else if($(this).index()==3)  strPage = "operConfigBatch"; 		
		var loadPage = '${contextpath}/conf/'+strPage+'.do';
		$("#main_content").load(loadPage);
	});
	
});//jQuery
</script>		
<%@ include file="/WEB-INF/views/common/CommonBottom.jsp" %>
