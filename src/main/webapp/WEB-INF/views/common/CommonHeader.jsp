<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" 		uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" 		uri="http://java.sun.com/jsp/jstl/functions" %>  
<%@ taglib prefix="form" 	uri="http://www.springframework.org/tags/form"%> 
<%@ taglib prefix="spring" 	uri="http://www.springframework.org/tags" %>

<!-- <body class="mod-bg-1 " oncontextmenu='return false'> -->
<body class="mod-bg-1 ">
<!-- <body class="mod-bg-1 "> -->
<!-- DOC: script to save and load page settings -->
<script>
    /**
     *	This script should be placed right after the body tag for fast execution 
     *	Note: the script is written in pure javascript and does not depend on thirdparty library
     **/
    'use strict';

    var classHolder = document.getElementsByTagName("BODY")[0]; 
    
    /** 
     * Load theme options
     **/	
    //var themeSettings = (localStorage.getItem('themeSettings')) ? JSON.parse(localStorage.getItem('themeSettings')) : {};
    var themeOptions = '${ISUP_CONFIG.system_theme}' ? '${ISUP_CONFIG.system_theme}' : 'mod-bg-1';
    classHolder.className = themeOptions;  
    //console.log("themeOptions : "+themeOptions);  
    
    var system_font = '${ISUP_CONFIG.system_font}' ? '${ISUP_CONFIG.system_font}' : 'root-text';
    var main_html = document.getElementsByTagName("html")[0]; 
    //console.log(system_font);
    main_html.className = system_font; 
    
</script>
        
<!-- BEGIN Page Wrapper -->
<div class="page-wrapper">
	<div class="page-inner">
        <!-- BEGIN Left Aside -->
        <aside class="page-sidebar">
        	<c:if test="${ISUP_CONFIG.logo_file!=null && ISUP_CONFIG.logo_file!=''}"> 
            	<div class="page-logo">
             		<span class="page-logo-text mr-1 col-md-10 col-lg-10 col-xl-10" style="margin-left:1rem;"> 
             		<img src="${contextpath}/static/common/images/${ISUP_CONFIG.logo_file}"  
             			style="width:100%;height:35px !important;padding-left:0px !important;display:block !important;" >	  
             		</span>      
            	</div>
          	</c:if>
           <c:if test="${ISUP_CONFIG.logo_file==null || ISUP_CONFIG.logo_file==''}"> 
            	<div class="page-logo">
             		<span class="page-logo-text mr-1">
             		${ISUP_CONFIG.solution_name}
             		</span>    
            	</div>
          	</c:if>
          	
            <!-- BEGIN PRIMARY NAVIGATION -->
            <nav id="js-primary-nav" class="primary-nav" role="navigation">
                <div class="info-card">
                    <img src="${contextpath}/static/SmartAdmin/img/card-backgrounds/cover-2-lg.png" class="cover" alt="cover">
                </div>  
                
                <ul id="js-nav-menu" class="nav-menu">
                  <c:forEach var="item" items="${ISUP_MENU}">
                    <!-- 서브메뉴가 없고 선택된 경우 -->
					<c:if test="${item.menu_url!='' && param.menu_par_id==item.menu_par_id}">	 
						<li id="navi_${item.menu_id}" class="active">
							<a href="javascript:void(0);" data-mnu="${item.menu_par_id}" data-smnu="${item.menu_id}" data-url="${contextpath}${item.menu_url}">
								<i class="fal ${item.menu_icon}"></i><span class="nav-link-text">${item.menu_nm}</span>
							</a> 
						</li>
					</c:if>	
					<!-- 서브메뉴가 없고 선택 안된 경우 -->
					<c:if test="${item.menu_url!='' && param.menu_par_id!=item.menu_par_id}">
					  	<li id="navi_${item.menu_id}">
					    	<a href="javascript:void(0);" data-mnu="${item.menu_par_id}" data-smnu="${item.menu_id}" data-url="${contextpath}${item.menu_url}">
								<i class="fal ${item.menu_icon}"></i><span class="nav-link-text">${item.menu_nm}</span>
							</a> 
				 		</li>
				 	</c:if>
			  		<!-- 서브메뉴가 있고 선택된 경우 -->			    
					<c:if test="${item.menu_url=='' && param.menu_par_id==item.menu_par_id}">
                     	<li id="navi_${item.menu_id}" class="active open">
                         	<a href="#">
                             	<i class="fal ${item.menu_icon}"></i><span class="nav-link-text">${item.menu_nm}</span>
                         	</a>
                         	<ul>
                           	<c:forEach var="sub_item" items="${item.list}">
                           		<c:if test="${param.menu_id==sub_item.menu_id}"><!-- 서브메뉴가 선택된 경우 -->	
                          			<li id="navi_${sub_item.menu_id}" class="active">
                              			<a href="javascript:void(0);" data-mnu="${sub_item.menu_par_id}" data-smnu="${sub_item.menu_id}" data-url="${contextpath}${sub_item.menu_url}">
                                      		<span class="nav-link-text">${sub_item.menu_nm}</span>
                                  		</a>
                              		</li>
                          		</c:if>	
                             	<c:if test="${param.menu_id!=sub_item.menu_id}"><!-- 서브메뉴가 선택된 경우 -->	
                          			<li id="navi_${sub_item.menu_id}">
                              			<a href="javascript:void(0);" data-mnu="${sub_item.menu_par_id}" data-smnu="${sub_item.menu_id}" data-url="${contextpath}${sub_item.menu_url}">
                                      		<span class="nav-link-text">${sub_item.menu_nm}</span>
                                  		</a>
                              		</li>
                          		</c:if>	
                        	</c:forEach>
                         	</ul>
                     	</li>
                 	</c:if>
                 	<!-- 서브메뉴가 있고 선택 안된 경우 -->	
                 	<c:if test="${item.menu_url=='' && param.menu_par_id!=item.menu_par_id}">
                 		<li id="navi_${item.menu_id}">
                     		<a href="#">
                            	<i class="fal ${item.menu_icon}"></i><span class="nav-link-text">${item.menu_nm}</span>
                         	</a>
                         	<ul>
							<c:forEach var="sub_item" items="${item.list}">
								<li id="navi_${sub_item.menu_id}">
									<a href="javascript:void(0);" data-mnu="${sub_item.menu_par_id}" data-smnu="${sub_item.menu_id}" data-url="${contextpath}${sub_item.menu_url}">
						            	<span class="nav-link-text">${sub_item.menu_nm}</span>
						            </a>
								</li>
							</c:forEach>
							</ul> 
						</li>
                 	</c:if>
               	  </c:forEach>
               	</ul>
                <div class="filter-message js-filter-message bg-success-600"></div>
            </nav>
            <!-- END PRIMARY NAVIGATION -->
            
            <!-- NAV FOOTER -->
            <div class="nav-footer shadow-top">
            </div>
            <!-- END NAV FOOTER -->
        </aside>
        <!-- END Left Aside -->
        
        <div class="page-content-wrapper">
            <!-- BEGIN Page Header -->
            <header class="page-header" role="banner">
                <!-- we need this logo when user switches to nav-function-top -->
                <div class="page-logo">
                    <a href="#" class="page-logo-link press-scale-down d-flex align-items-center" data-toggle="modal" data-target="#modal-shortcut">
                        <img src="${contextpath}/static/common/images/${ISUP_CONFIG.logo_file}" aria-roledescription="logo" style="width:100%;height:35px !important;"> 
                        <!-- <span class="page-logo-text mr-1">SmartAdmin WebApp</span>
                        <i class="fal fa-angle-down d-inline-block ml-1 fs-lg color-primary-300"></i> --> 
                    </a>
                </div>
                
                <!-- DOC: nav menu layout change shortcut -->
                <div class="hidden-md-down dropdown-icon-menu position-relative">
                    <a href="#" class="header-btn btn js-waves-off" data-action="toggle" data-class="nav-function-hidden" title="Hide Navigation">
                        <i class="ni ni-menu"></i>
                    </a>
                    <ul>
                        <li>
                            <a href="#" class="btn js-waves-off" data-action="toggle" data-class="nav-function-minify" title="Minify Navigation">
                                <i class="ni ni-minify-nav"></i>
                            </a>
                        </li>
                        <li>
                            <a href="#" class="btn js-waves-off" data-action="toggle" data-class="nav-function-fixed" title="Lock Navigation">
                                <i class="ni ni-lock-nav"></i>
                            </a>
                        </li>
                    </ul>
                </div>
                
                <!-- DOC: mobile button appears during mobile width -->
                <div class="hidden-lg-up">
                    <a href="#" class="header-btn btn press-scale-down" data-action="toggle" data-class="mobile-nav-on">
                        <i class="ni ni-menu"></i>
                    </a>
                </div>
                <div class="ml-auto d-flex">
                    <!-- activate app search icon (mobile) -->
                    <div class="hidden-sm-up">
                        <a href="#" class="header-icon" data-action="toggle" data-class="mobile-search-on" data-focus="search-field" title="Search">
                            <i class="fal fa-search"></i>
                        </a>
                    </div>
                    <!-- app settings -->
                    <div class="hidden-md-down" id="app_settings" style="display:none;">
                        <a href="#" class="header-icon" data-toggle="modal" data-target=".js-modal-settings">
                            <i class="fal fa-cog"></i>
                        </a>
                    </div>
                    <!-- app user menu start-->
                    <div>
                        <a href="#" data-toggle="dropdown" title="User Info" class="header-icon d-flex align-items-center justify-content-center ml-2"  style="cursor:pointer;">
                            <i class="fal fa-user"></i>                                  
                        </a>
                        <div class="dropdown-menu dropdown-menu-animated dropdown-lg">
                            <div class="dropdown-header bg-trans-gradient d-flex flex-row py-4 rounded-top">
                                <div class="d-flex flex-row align-items-center mt-1 mb-1 color-white">
                                    <span class="mr-2">
                                        <i class="fal fa-user fa-3x"></i>
                                    </span>
                                    <div class="info-card-text"> 
                                        <div class="fs-lg text-truncate text-truncate-lg">${ISUP_USER.user_id}</div> 
                                        <span class="text-truncate text-truncate-lg opacity-80">${ISUP_USER.user_email}</span>  
                                    </div>
                                </div>
                            </div>
                            <div class="dropdown-divider m-0"></div>
                            <a href="#" class="dropdown-item" data-action="app-reset">
                                <span>이름 : ${ISUP_USER.user_nm}</span> 
                            </a>
                            <a href="#" class="dropdown-item" data-toggle="modal" data-target=".js-modal-settings">
                                <span>내선번호 : ${ISUP_USER.extension}</span>
                            </a>
                            <div class="dropdown-divider m-0"></div>
                            <c:if test="${ISUP_USER.user_type!='0003'||ISUP_CONFIG.auth_type=='USER'}">  
                             	<a class="dropdown-item fw-500 pt-3 pb-3" href="javascript:changePwModal();">
                                 	<span>비밀번호변경</span>
                                	<span class="float-right fw-n"><i class="fal fa-cog"></i></span> 
                             	</a>
                            </c:if>
                            <div class="dropdown-divider m-0"></div>
                            <a class="dropdown-item fw-500 pt-3 pb-3" href="javascript:logout('${contextpath}', '${ISUP_USER.user_type}');">
                                <span>Logout</span>
                                <span class="float-right fw-n"><i class="fal fa-sign-out"></i></span> 
                            </a> 
                        </div> 
                    </div> 
                	<!-- app user menu end -->
                    <!-- app logout -->
                    <div>
                        <a href="javascript:logout('${contextpath}', '${ISUP_USER.user_type}');" class="header-icon" title="Logout" style="cursor:pointer;">
                            <i class="fal fa-sign-out"></i>
                        </a>
                    </div>
                    <!-- app expend -->
                    <div>
                     	<a href="#" class="header-icon" data-action="app-fullscreen" /*data-toggle="tooltip" data-placement="left"*/ title="Full Screen"  style="cursor:pointer;">
             				<i class="fal fa-expand"></i>
         				</a> 
        			</div>  
                </div>
            </header>
            <!-- END Page Header -->
           
			<!-- pw change modal start -->
            <div id="form_modal_changepw" class="modal fade" data-backdrop="static" data-keyboard="false" tabindex="-1" role="dialog">
				<div class="modal-dialog modal-dialog-centered" role="document">
					<div class="modal-content">
						<div class="modal-header">
				               <h5 class="modal-title">비밀번호변경</h5> 
				               <button type="button" class="close" data-dismiss="modal" aria-label="Close">
				                   <span aria-hidden="true"><i class="fal fa-times"></i></span> 
				               </button>
				           </div>
						<div class="modal-body">
							<div class="form-group">
								<input type="password" id="new_user_pw" class="form-control" value=""> 
						  	</div>						 
						</div>
						<div class="modal-footer">
							<button type="button" id="btnCancel" 	class="btn btn-secondary btn-sm" data-dismiss="modal">닫기</button>
							<button type="button" id="btnSavePw" 	class="btn btn-primary btn-sm" 
							onclick="javascript:changePw('${contextpath}','${ISUP_USER.user_id}','${ISUP_USER.user_type}','${ISUP_CONFIG.auth_type}');">저장</button>   
						</div>
					</div><!-- /.modal-content -->
				</div><!-- /.modal-dialog -->
			</div><!-- /.modal -->
			<!-- pw change modal end -->
