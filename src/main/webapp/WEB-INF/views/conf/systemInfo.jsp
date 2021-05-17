<!-- systemInfo.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/CommonCss.jsp" %>
<%@ include file="/WEB-INF/views/common/CommonHeader.jsp" %> 

<!-- BEGIN Page Content -->
<main id="js-page-content" role="main" class="page-content">
	<ol class="breadcrumb page-breadcrumb" id="menu_title">
		&nbsp; 
	</ol>
   
	<div class="row">  
		<div class="col-lg-4 col-xl-4">
			<div id="panel-1" class="panel" style="height:500px;">
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
                   		<!-- 기본설정 Start -->
                		<div class="frame-wrap px-5">   
                	    	<div class="col-lg-12 col-xl-12">
                	    		<div class="form-group">
		                        	<div class="row">
			            				<div class="col-md-12 text-left border-bottom-dash">
		                               		<label class="form-label pt-2 h3">기본설정</label>    
		                            	</div>
		                           </div> 
		                        </div>
		                        <div class="form-group">
		                        	<div class="row">
			            				<div class="col-md-3">
		                               		<label class="form-label pt-2" for="system_name">시스템명</label>   
		                            	</div>
		                            	<div class="col-md-9">
		                               		<input id="system_name" type="text" class="form-control" autocomplete="off"> 
		                               	</div>
		                           </div>
		                        </div>
		                        <div class="form-group">
		                        	<div class="row">
			            				<div class="col-md-3">
		                               		<label class="form-label pt-2" for="system_name">솔루션명</label>   
		                            	</div>
		                            	<div class="col-md-9">  
		                               		<input id="solution_name" type="text" class="form-control" autocomplete="off">
		                               	</div>
		                           </div>
		                        </div>
		                        <div class="form-group">  
		                        	<div class="row">
			            				<div class="col-md-3">
		                               		<label class="form-label pt-2" for="system_version">버전</label>  
		                            	</div>
		                            	<div class="col-md-9">
		                               		<input id="system_version" type="text" class="form-control" autocomplete="off">
		                               	</div>
		                           </div>
								</div>
								<div class="form-group">
		                        	<div class="row">
			            				<div class="col-md-3">
		                               		<label class="form-label pt-2" for="company_name">회사명</label>  
		                            	</div>
		                            	<div class="col-md-9">
		                               		<input id="company_name" type="text" class="form-control" autocomplete="off">
		                               	</div>
		                           </div>
								</div>
								<div class="form-group">
		                        	<div class="row">
			            				<div class="col-md-3">
		                               		<label class="form-label pt-2" for="company_en_name">회사영문명</label>   
		                            	</div>
		                            	<div class="col-md-9">
		                               		<input id="company_en_name" type="text" class="form-control" autocomplete="off">
		                               	</div>
		                           </div>
								</div>
								<div class="form-group">
		                        	<div class="row">
		                            	<div class="col-md-12 text-right">
		                               		<button id="btnDefaultSave" type="submit" class="btn btn-primary btn-sm">저장</button> 
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
		                                     
		<div class="col-lg-4 col-xl-4">
			<div id="panel-1" class="panel" style="height:500px;">
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
                		<!-- 화면스킨설정 Start-->  
                   		<div class="frame-wrap px-5">
                   			<div class="col-lg-12 col-xl-12">
                   				<div class="form-group">
		                        	<div class="row">
			            				<div class="col-md-12 text-left border-bottom-dash">
		                               		<label class="form-label pt-2 h3">화면스킨설정</label>    
		                            	</div>
		                           </div>
		                        </div>
		                        <div class="form-group"> 
		                        	<div class="row">
			            				<div class="col-md-3">
		                               		<label class="form-label pt-2" for="system_skin">스킨</label>   
		                            	</div>
		                            	<div class="col-md-5">
		                               		<select id="system_skin" type="text" class="form-control"></select>
		                               	</div>
		                               	<div class="col-md-4" style="padding-top:2px;">
		                               		<button id="btnSkinPreview" type="submit" class="btn btn-info btn-sm" title="미리보기"><i class="fal fa-search"></i></button>   
		                               		<button id="btnSkinSave" type="submit" class="btn btn-primary btn-sm">저장</button>
		                               	</div>
		                           </div>
								</div>
	                    	</div>
                   		</div><!-- end frame-wrap -->
                   		<div class="py-3"></div>
                   		<!-- 화면스킨설정 End-->
                   		
                   		<!-- 로그인폼 Start-->
                   		<div class="frame-wrap px-5">
                   			<div class="col-lg-12 col-xl-12">
                   				<div class="form-group">
		                        	<div class="row">
			            				<div class="col-md-12 text-left border-bottom-dash">
		                               		<label class="form-label pt-2 h3">로그인폼설정</label>    
		                            	</div>
		                           </div>
		                        </div>
		                    	<div class="form-group">
		                        	<div class="row">
			            				<div class="col-md-3">
		                               		<label class="form-label pt-2" for="system_login">로그인폼</label>    
		                            	</div>
		                            	<div class="col-md-5">
		                               		<select id="system_login" class="form-control"></select>
		                               	</div> 
		                               	<div class="col-md-4" style="padding-top:2px;">
		                               		<button id="btnLoginPreview" type="submit" class="btn btn-info btn-sm" title="미리보기"><i class="fal fa-search"></i></button>   
		                               		<button id="btnLoginSave" type="submit" class="btn btn-primary btn-sm">저장</button>
		                               	</div>
		                           </div>
		                       </div>
	                    	</div>
                   		</div>
                   		<div class="py-3"></div>
                   		<!-- 로그인폼 End -->
                	</div><!-- end "panel-content" -->
            	</div><!-- end panel-container -->
			</div><!-- end panel -->  
		</div><!-- end col -->         
		                             
		<div class="col-lg-4 col-xl-4">
			<div id="panel-1" class="panel" style="height:500px;">
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
                   		<!-- 로고설정 Start -->
                   		<div class="frame-wrap x-5">
                   			<div class="col-lg-12 col-xl-12">
                   				<div class="form-group">
		                        	<div class="row">
			            				<div class="col-md-12 text-left border-bottom-dash">
		                               		<label class="form-label pt-2 h3">로고설정</label>    
		                            	</div>
		                           </div>
		                        </div>
		                    	<div class="form-group">
		                        	<div class="row">
			            				<div class="col-md-2"> 
		                               		<label class="form-label pt-3" for="system_name">로고</label>   
		                            	</div>
		                            	<div class="col-md-8">
		                               		<input type="file" id="file" name="file" class="btn btn-default col-12 text-left" style="width:100% !important;">
											<p class="pt-2">파일형식:gif,jpg,png (size: 120 x 35)</p>
		                               	</div>
		                               	<div class="col-md-2 text-right" style="padding-top:4px;"> 
											<button id="btnLogoSave" type="submit" class="btn btn-primary btn-sm">저장</button>   
										</div>
		                        	</div>
		                       	</div>
		                       	<div class="form-group">
		                        	<div class="row">
		                        		<div class="col-md-2">
		                               		<label class="form-label pt-2">&nbsp;</label>   
		                            	</div>
			            				<div class="col-md-10">
			            					<img id="logo_file_img" border="1"/>&nbsp;&nbsp;&nbsp;&nbsp;
			            					<span id="logo_file_nm"></span>&nbsp;&nbsp;&nbsp;&nbsp;
											<button id="btnLogoDelete" type="submit" class="btn btn-primary btn-xs" style="display:none;">삭제</button>
			            				</div>
		                           	</div>
		                    	</div>
	                    	</div>
                   		</div>
                   		<div class="py-3"></div>
                   		<!-- 로고설정 End -->
                	</div><!-- end "panel-content" -->
            	</div><!-- end panel-container -->
			</div><!-- end panel -->  
		</div><!-- end col -->                                      
	
	</div><!-- end row -->
</main>
<!-- END Page Content -->     


<!-- BEGIN Page Settings -->
<div class="modal fade js-modal-settings modal-backdrop-transparent" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-dialog-right modal-md">
        <div class="modal-content">
            <div class="dropdown-header bg-trans-gradient d-flex justify-content-center align-items-center w-100">
                <h4 class="m-0 text-center color-white">
                    Layout Settings
                    <small class="mb-0 opacity-80">User Interface Settings</small>
                </h4>
                <button type="button" class="close text-white position-absolute pos-top pos-right p-2 m-1 mr-2" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true"><i class="fal fa-times"></i></span>
                </button>
            </div>
            <div class="modal-body p-0">
                <div class="settings-panel">
                    <div class="mt-4 d-table w-100 px-5">
                        <div class="d-table-cell align-middle">
                            <h5 class="p-0">
                                App Layout
                            </h5>
                        </div>
                    </div>
                    <div class="list" id="fh">
                        <a href="#" onclick="return false;" class="btn btn-switch" data-action="toggle" data-class="header-function-fixed" id="header-function-fixed"></a>
                        <span class="onoffswitch-title">Fixed Header</span>
                        <span class="onoffswitch-title-desc">header is in a fixed at all times</span>
                    </div>
                    <div class="list" id="nff">
                        <a href="#" onclick="return false;" class="btn btn-switch" data-action="toggle" data-class="nav-function-fixed" id="nav-function-fixed"></a>
                        <span class="onoffswitch-title">Fixed Navigation</span>
                        <span class="onoffswitch-title-desc">left panel is fixed</span>
                    </div>
                    <div class="list" id="nfm">
                        <a href="#" onclick="return false;" class="btn btn-switch" data-action="toggle" data-class="nav-function-minify" id="nav-function-minify"></a>
                        <span class="onoffswitch-title">Minify Navigation</span>
                        <span class="onoffswitch-title-desc">Skew nav to maximize space</span>
                    </div>
                    <div class="list" id="nfh">
                        <a href="#" onclick="return false;" class="btn btn-switch" data-action="toggle" data-class="nav-function-hidden" id="nav-function-hidden"></a>
                        <span class="onoffswitch-title">Hide Navigation</span>
                        <span class="onoffswitch-title-desc">roll mouse on edge to reveal</span>
                    </div>
                    <div class="list" id="nft">
                        <a href="#" onclick="return false;" class="btn btn-switch" data-action="toggle" data-class="nav-function-top" id="nav-function-top"></a>
                        <span class="onoffswitch-title">Top Navigation</span>
                        <span class="onoffswitch-title-desc">Relocate left pane to top</span>
                    </div>
                    <div class="list" id="mmb">
                        <a href="#" onclick="return false;" class="btn btn-switch" data-action="toggle" data-class="mod-main-boxed" id="mod-main-boxed"></a>
                        <span class="onoffswitch-title">Boxed Layout</span>
                        <span class="onoffswitch-title-desc">Encapsulates to a container</span>
                    </div>
                    <div class="expanded">
                        <ul class="">
                            <li>
                                <div class="bg-fusion-50" data-action="toggle" data-class="mod-bg-1"></div>
                            </li>
                            <li>
                                <div class="bg-warning-200" data-action="toggle" data-class="mod-bg-2"></div>
                            </li>
                            <li>
                                <div class="bg-primary-200" data-action="toggle" data-class="mod-bg-3"></div>
                            </li>
                            <li>
                                <div class="bg-success-300" data-action="toggle" data-class="mod-bg-4"></div>
                            </li>
                        </ul>
                        <div class="list" id="mbgf">
                            <a href="#" onclick="return false;" class="btn btn-switch" data-action="toggle" data-class="mod-fixed-bg" id="mod-fixed-bg"></a>
                            <span class="onoffswitch-title">Fixed Background</span>
                        </div>
                    </div>
                    <div class="mt-4 d-table w-100 px-5">
                        <div class="d-table-cell align-middle">
                            <h5 class="p-0">
                                Mobile Menu
                            </h5>
                        </div>
                    </div>
                    <div class="list" id="nmp">
                        <a href="#" onclick="return false;" class="btn btn-switch" data-action="toggle" data-class="nav-mobile-push" id="nav-mobile-push"></a>
                        <span class="onoffswitch-title">Push Content</span>
                        <span class="onoffswitch-title-desc">Content pushed on menu reveal</span>
                    </div>
                    <div class="list" id="nmno">
                        <a href="#" onclick="return false;" class="btn btn-switch" data-action="toggle" data-class="nav-mobile-no-overlay" id="nav-mobile-no-overlay"></a>
                        <span class="onoffswitch-title">No Overlay</span>
                        <span class="onoffswitch-title-desc">Removes mesh on menu reveal</span>
                    </div>
                    <div class="list" id="sldo">
                        <a href="#" onclick="return false;" class="btn btn-switch" data-action="toggle" data-class="nav-mobile-slide-out" id="nav-mobile-slide-out"></a>
                        <span class="onoffswitch-title">Off-Canvas <sup>(beta)</sup></span>
                        <span class="onoffswitch-title-desc">Content overlaps menu</span>
                    </div>
                    <div class="mt-4 d-table w-100 px-5">
                        <div class="d-table-cell align-middle">
                            <h5 class="p-0">
                                Accessibility
                            </h5>
                        </div>
                    </div>
                    <div class="list" id="mbf">
                        <a href="#" onclick="return false;" class="btn btn-switch" data-action="toggle" data-class="mod-bigger-font" id="mod-bigger-font"></a>
                        <span class="onoffswitch-title">Bigger Content Font</span>
                        <span class="onoffswitch-title-desc">content fonts are bigger for readability</span>
                    </div>
                    <div class="list" id="mhc">
                        <a href="#" onclick="return false;" class="btn btn-switch" data-action="toggle" data-class="mod-high-contrast" id="mod-high-contrast"></a>
                        <span class="onoffswitch-title">High Contrast Text (WCAG 2 AA)</span>
                        <span class="onoffswitch-title-desc">4.5:1 text contrast ratio</span>
                    </div>
                    <div class="list" id="mcb">
                        <a href="#" onclick="return false;" class="btn btn-switch" data-action="toggle" data-class="mod-color-blind" id="mod-color-blind"></a>
                        <span class="onoffswitch-title">Daltonism <sup>(beta)</sup> </span>
                        <span class="onoffswitch-title-desc">color vision deficiency</span>
                    </div>
                    <div class="list" id="mpc">
                        <a href="#" onclick="return false;" class="btn btn-switch" data-action="toggle" data-class="mod-pace-custom" id="mod-pace-custom"></a>
                        <span class="onoffswitch-title">Preloader Inside</span>
                        <span class="onoffswitch-title-desc">preloader will be inside content</span>
                    </div>
                    <div class="mt-4 d-table w-100 px-5">
                        <div class="d-table-cell align-middle">
                            <h5 class="p-0">
                                Global Modifications
                            </h5>
                        </div>
                    </div>
                    <div class="list" id="mcbg">
                        <a href="#" onclick="return false;" class="btn btn-switch" data-action="toggle" data-class="mod-clean-page-bg" id="mod-clean-page-bg"></a>
                        <span class="onoffswitch-title">Clean Page Background</span>
                        <span class="onoffswitch-title-desc">adds more whitespace</span>
                    </div>
                    <div class="list" id="mhni">
                        <a href="#" onclick="return false;" class="btn btn-switch" data-action="toggle" data-class="mod-hide-nav-icons" id="mod-hide-nav-icons"></a>
                        <span class="onoffswitch-title">Hide Navigation Icons</span>
                        <span class="onoffswitch-title-desc">invisible navigation icons</span>
                    </div>
                    <div class="list" id="dan">
                        <a href="#" onclick="return false;" class="btn btn-switch" data-action="toggle" data-class="mod-disable-animation" id="mod-disable-animation"></a>
                        <span class="onoffswitch-title">Disable CSS Animation</span>
                        <span class="onoffswitch-title-desc">Disables CSS based animations</span>
                    </div>
                    <div class="list" id="mhic">
                        <a href="#" onclick="return false;" class="btn btn-switch" data-action="toggle" data-class="mod-hide-info-card" id="mod-hide-info-card"></a>
                        <span class="onoffswitch-title">Hide Info Card</span>
                        <span class="onoffswitch-title-desc">Hides info card from left panel</span>
                    </div>
                    <div class="list" id="mlph">
                        <a href="#" onclick="return false;" class="btn btn-switch" data-action="toggle" data-class="mod-lean-subheader" id="mod-lean-subheader"></a>
                        <span class="onoffswitch-title">Lean Subheader</span>
                        <span class="onoffswitch-title-desc">distinguished page header</span>
                    </div>
                    <div class="list" id="mnl">
                        <a href="#" onclick="return false;" class="btn btn-switch" data-action="toggle" data-class="mod-nav-link" id="mod-nav-link"></a>
                        <span class="onoffswitch-title">Hierarchical Navigation</span>
                        <span class="onoffswitch-title-desc">Clear breakdown of nav links</span>
                    </div>
                    <div class="list mt-3">
                        <span class="onoffswitch-title">Global Font Size <small>(RESETS ON REFRESH)</small> </span>
                        <div class="btn-group btn-group-sm btn-group-toggle my-2" data-toggle="buttons">
                            <label class="btn btn-default btn-sm" data-action="toggle-swap" data-class="root-text-sm" data-target="html">
                                <input type="radio" name="changeFrontSize"> SM
                            </label>
                            <label class="btn btn-default btn-sm" data-action="toggle-swap" data-class="root-text" data-target="html">
                                <input type="radio" name="changeFrontSize" checked=""> MD
                            </label>
                            <label class="btn btn-default btn-sm" data-action="toggle-swap" data-class="root-text-lg" data-target="html">
                                <input type="radio" name="changeFrontSize"> LG
                            </label>
                            <label class="btn btn-default btn-sm" data-action="toggle-swap" data-class="root-text-xl" data-target="html">
                                <input type="radio" name="changeFrontSize"> XL
                            </label>
                        </div>
                        <span class="onoffswitch-title-desc d-block mb-g">Change <strong>root</strong> font size to effect rem values</span>
                    </div>
                    <hr class="m-0">
                    <div class="p-3 d-flex align-items-center justify-content-center bg-faded">
                        <a href="#" class="btn btn-outline-danger fw-500 mr-2" data-action="app-reset">Reset Settings</a>
                        <a href="#" class="btn btn-danger fw-500" data-action="#" id="bntSaveSettings">Save Settings</a>
                    </div>
                </div>
                <span id="saving"></span>
            </div>
        </div>
    </div>
</div> <!-- END Page Settings -->
<input type="hidden" id="system_theme" >
<input type="hidden" id="system_font" >

<%@ include file="/WEB-INF/views/common/CommonFooter.jsp" %>                    
<%@ include file="/WEB-INF/views/common/CommonJs.jsp" %>
<script src="${contextpath}/static/common/js/common.js"></script> 
<script type="text/javascript">
$(function() {
	
	setTitle('${param.menu_par_id}','${param.menu_id}');
	
	$('#app_settings').show();

	var system_skin, system_login='';
	<c:forEach var="item" items="${resultList}" varStatus="status">
		//console.log('${item.code_id}');
		if('${item.code_id}'=='0001') $('#system_name').val('${item.code_value}');
		else if('${item.code_id}'=='0002') $('#system_version').val('${item.code_value}');
		else if('${item.code_id}'=='0003') $('#company_name').val('${item.code_value}');
		else if('${item.code_id}'=='0004') $('#company_en_name').val('${item.code_value}');
		else if('${item.code_id}'=='0005') {
			if('${item.code_value}'!=null&&'${item.code_value}'!=''){
				$('#logo_file_img').attr('src', '${contextpath}/static/common/images/${item.code_value}');
				$('#logo_file_nm').html('${item.code_value}');
				$('#btnLogoDelete').show();
			}
		}
		else if('${item.code_id}'=='0006') system_skin = '${item.code_value}';
		else if('${item.code_id}'=='0007') system_login = '${item.code_value}';
		else if('${item.code_id}'=='0008') $('#solution_name').val('${item.code_value}');
	</c:forEach>	
	
	
	function createCommCodeSelectBox(){
		var ajaxParam = {
            'url' : '${contextpath}/common/createCommCodeSelectBox.json',
            'type' : 'POST',
        	'data' : {
        		'group_id' : 'CD04',
        		'selected' : ''
            }
        };
        Common.ajaxJSON(ajaxParam, function(data) {
        	$('#system_skin option').remove();
        	$('#system_skin').append(data.html);
        	$('#system_skin > option').each(function() {
        		if($(this).text() == system_skin) {
		         	$(this).prop('selected', 'selected');
		      	}
		  	});         
        });
	}
	
	function createCommCodeSelectBox2(){
		var ajaxParam = {
            'url' : '${contextpath}/common/createCommCodeSelectBox.json',
            'type' : 'POST',
        	'data' : {
        		'group_id' : 'CD05',
        		'selected' : ''
            }
        };
        Common.ajaxJSON(ajaxParam, function(data) {
        	$('#system_login option').remove();
        	$('#system_login').append(data.html);
        	$('#system_login > option').each(function() {
        		if($(this).text() == system_login) {
		         	$(this).prop('selected', 'selected');
		      	}
		  	});         
        });
	}
	createCommCodeSelectBox();
	createCommCodeSelectBox2();
	
	/* $('#system_skin').change(function(){
		console.log($('#system_skin option:selected').text());
		var skin = $('#system_skin option:selected').text();
		$.root_.removeClassPrefix("smart-style").addClass(skin);	//$.root_ = $('body');
   	 	$("html").removeClassPrefix("smart-style").addClass(skin);   	 	
	}); */
	
	//console.log(system_login);
	$('#login_img').attr('src', '${contextpath}/static/login/'+ system_login + ".PNG");
	
	$('#system_login').change(function(){
		//console.log($('#system_login option:selected').text());
		var login = $('#system_login option:selected').text();
		$('#login_img').removeAttr('src');
		$('#login_img').attr('src', '${contextpath}/static/login/'+ login + ".PNG");
	});
	
	
	//기본설정저장
	$('#btnDefaultSave').click(clickBtnDefaultSave=function(){
		//폼 체크
		if(!Service.checkForm()) return;
		Service.requestDefaultUpdate(); 
	});		
	
	
	//화면스킨 미리보기
	$('#btnSkinPreview').click(clickBtnSkinPreview=function(){
		var system_skin = $('#system_skin option:selected').text();
		window.open('${contextpath}/conf/skinPreview.do?system_skin='+system_skin,'_blank');
	});	
	
	
	//화면스킨저장
	$('#btnSkinSave').click(clickBtnSkinSave=function(){
		Service.requestSkinUpdate(); 
	});	
	  
	
	//로그인폼 미리보기
	$('#btnLoginPreview').click(clickBtnLoginPreview=function(){
		var system_login = $('#system_login option:selected').text();
		var system_skin = $('#system_skin option:selected').text();
		window.open('${contextpath}/conf/loginPreview.do?system_login='+system_login+'&system_skin='+system_skin,'_blank');
	});	
	
	//로그인폼저장
	$('#btnLoginSave').click(clickBtnLoginSave=function(){
		Service.requestLoginFormUpdate(); 
	});	
	
	/***** Start 로고설정 *****/
	var reg = /png|gif|jpg/i;
	$('input[name="file"]').unbind('change');
	$('input[name="file"]').change(function(){
		$('input[name="file"]').each(function(index){
			var _file = this.files[index];
			var _filename = _file.name;	
			var _fileExt = _filename.substring(_filename.lastIndexOf(".")+1);
			if(reg.test(_fileExt)==false){
				alert("파일형식을 확인하시기 바랍니다.");
				$('input[name="file"]').val('');
				return false; 
			} 
		});
	});		
	
	$('#btnLogoSave').click(clickBtnLogoSave=function(){
		if(!$.notnull($('#file'),'파일명')) return false;				
		var formData = new FormData(); 	
		formData.append("file", $("input[name=file]")[0].files[0]); 		
		$.ajax({ 
			url: '${contextpath}/conf/systemLogoUpdate.json', 
			data: formData, 
			processData: false, 
			contentType: false, 
			type: 'POST', 
			success:function(data){
				if(!data){
					alert('return data error');
					return false;
				} 
				alert(data.msg);
				$('#logo_file_img').attr('src', '${contextpath}/static/common/images/'+data.logo_file);
				$('#logo_file_nm').html(data.logo_file);
				$('#btnLogoDelete').show();
			},
			error:function (xhr, ajaxOptions, thrownError){
				alert(xhr.status+'\n'+thrownError);
			} 
		}); 
	});	
	
	$('#btnLogoDelete').click(function(){
		Service.requestLogoDelete();
	});
	/**** End 로고설정 ****/
	
	
	/**** Start 테마설정 ****/
	console.log(themeOptions);
	$("#header-function-fixed").removeClass("active");       
	$("#nav-function-fixed").removeClass("active");      
	$("#nav-function-minify").removeClass("active");      
	$("#nav-function-hidden").removeClass("active");      
	$("#nav-function-top").removeClass("active");      
	$("#mod-main-boxed").removeClass("active");       
	$("#mod-fixed-bg").removeClass("active");       
	$("#nav-mobile-push").removeClass("active");       
	$("#nav-mobile-no-overlay").removeClass("active");       
	$("#nav-mobile-slide-out").removeClass("active");       
	$("#mod-bigger-font").removeClass("active");       
	$("#mod-high-contrast").removeClass("active");       
	$("#mod-color-blind").removeClass("active");       
	$("#mod-pace-custom").removeClass("active");       
	$("#mod-clean-page-bg").removeClass("active");       
	$("#mod-hide-nav-icons").removeClass("active");       
	$("#mod-disable-animation").removeClass("active");       
	$("#mod-hide-info-card").removeClass("active");       
	$("#mod-lean-subheader").removeClass("active");       
	$("#mod-nav-link").removeClass("active");       

	
	//if(themeOptions.indexOf("header-function-fixed") > 0) $("#header-function-fixed").addClass("active");    
	//if(themeOptions.indexOf("nav-function-fixed") > 0) $("#nav-function-fixed").addClass("active");       
	
	$("#bntSaveSettings").click(function(){ 
		//console.log("classname : "+$('html').attr('class'));
		var _themeSettings = (localStorage.getItem('themeSettings')) ? JSON.parse(localStorage.getItem('themeSettings')) : {};
		var _system_theme = _themeSettings.themeOptions;
		$("#system_theme").val(_system_theme);
		console.log("system_theme : "+_system_theme);
		
		var _system_font = $('html').attr('class')? $('html').attr('class'):'root-text';
		$("#system_font").val(_system_font);
		console.log("system_font : "+_system_font);
		
		Service.requestThemeUpdate();
	});
	/**** End 테마설정 ****/
	
});//jQuery


var Service = {				
	//입력 폼 체크
	checkForm : function(){
		if(!$.notnull($('#system_name'), '시스템명')) return false;
		if(!$.notnull($('#system_version'), '버전')) return false;
		if(!$.notnull($('#company_name'), '회사명')) return false;
		if(!$.notnull($('#company_en_name'), '회사영문명')) return false;
		return true;
	},		
	//List
	requestList : function() {
		var ajaxParam = {
            "url" : "${contextpath}/conf/systemInfoList.json",
            "type" : "POST",   
            'data' : {
            	'group_id':'CD02'	//시스템설정
            }
        };
        Common.ajaxJSON(ajaxParam, function(data) {
        	$.each(data.resultList, function(i, item){
        		if(item.code_id=='0001') $('#system_name').val(item.code_value);
				else if(item.code_id=='0002') $('#system_version').val(item.code_value);
				else if(item.code_id=='0003') $('#company_name').val(item.code_value);
				else if(item.code_id=='0004') $('#company_en_name').val(item.code_value);
				else if(item.code_id=='0006') system_skin = item.code_value;
				else if(item.code_id=='0007') system_login = item.code_value;
        	})
        });
	},
	//Default Update
	requestDefaultUpdate : function() {
		var ajaxParam = {
            "url" : "${contextpath}/conf/systemDefaultUpdate.json",
            "type" : "POST",
        	"data" : {
        		"system_name" : $("#system_name").val(),
    			"system_version" : $("#system_version").val(),
        		"company_name" : $("#company_name").val(),
    			"company_en_name" : $("#company_en_name").val(),
    			"solution_name" : $("#solution_name").val()
            }
        };
        Common.ajaxJSON(ajaxParam, function(data) {
        	if(!data){
				alert('return data error');
				return false;
			}
			alert(data.msg);
			if(!data.success) return;
			Service.requestList();
        });
	},
	
	//Skin Update
	requestSkinUpdate : function() {
		var ajaxParam = {
            "url" : "${contextpath}/conf/systemSkinUpdate.json",
            "type" : "POST",
        	"data" : {
        		"system_skin" : $('#system_skin option:selected').text()
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
	
	//LoginForm Update
	requestLoginFormUpdate : function() {
		var ajaxParam = {
            "url" : "${contextpath}/conf/systemLoginFormUpdate.json",
            "type" : "POST",
        	"data" : {
        		"system_login" : $('#system_login option:selected').text()
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
	
	//logo File Delete
	requestLogoDelete : function() {
		if(confirm('삭제하시겠습니까?')){
			var ajaxParam = {
	            "url" : "${contextpath}/conf/systemLogoDelete.json",
	            "type" : "POST"
	        };
	        Common.ajaxJSON(ajaxParam, function(data) {
	        	if(!data){
					alert('return data error');
					return false;
				}
				alert(data.msg);
				$('#logo_file_img').attr('src', '');
				$('#logo_file_nm').html('');
				$('#btnLogoDelete').hide();
	        });
		}
	},
	
	//Theme Update
	requestThemeUpdate : function() {
		var ajaxParam = {
            "url" : "${contextpath}/conf/systemThemeUpdate.json",
            "type" : "POST",
        	"data" : {
        		"system_theme" : $('#system_theme').val(),
        		"system_font" : $('#system_font').val()
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
	
	
}

var themeSettings = (localStorage.getItem('themeSettings')) ? JSON.parse(localStorage.getItem('themeSettings')) : {};

/** 
 * Save to localstorage 
 **/ 
var saveSettings = function() {
	themeSettings.themeOptions = String(classHolder.className).split(/[^\w-]+/).filter(function(item){
    	return /^(nav|header|mod|display)-/i.test(item);
    }).join(' ');
    //if (document.getElementById('mytheme')){
    //    themeSettings.themeURL = document.getElementById('mytheme').getAttribute("href");
    //};
    localStorage.setItem('themeSettings', JSON.stringify(themeSettings));
}
   
/** 
 * Reset settings
 **/
var resetSettings = function() {
	localStorage.setItem("themeSettings", "");
}


   
</script>		
<%@ include file="/WEB-INF/views/common/CommonBottom.jsp" %>
