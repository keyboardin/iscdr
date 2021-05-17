<!-- loginFormSystem.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/login/LoginFormCss.jsp" %>

<body class="mod-bg-1 " oncontextmenu='return false'>
<!-- BEGIN Page Content -->
<main id="js-page-content" role="main" class="page-content">
	<div class="row mt-6">  
		<div class="col-sm-12 col-md-12 col-lg-2 col-xl-2 ml-auto"></div> 
		<div class="col-sm-12 col-md-12 col-lg-4 col-xl-4 ml-auto mt-6 pt-6">   
			<div id="panel-1" class="panel">
				<div class="panel-hdr">
					<h2 class="fs-xl text-primary">
                        ${result.solution_name} 시스템관리자
                    </h2> 
				</div>
				<div class="panel-container show">
					<div class="panel-content"> 
						<div class="frame-wrap">
							<div class="row pt-2" id="loginForm"> 
		                        <div class="col-sm-12 col-md-12 col-lg-12 col-xl-12 ml-auto px-6">    
                                	<div class="form-group smart-form px-2">
                                  		
									</div> 
                                    <div class="form-group px-4">  
                                        <input id="user_id" type="text"  class="form-control form-control-lg" placeholder="아이디" value="" required>
                                        <div class="invalid-feedback">No, you missed this one.</div>
                                    </div>
                                    <div class="form-group px-4"> 
                                        <input id="user_pw" type="password" class="form-control form-control-lg" placeholder="비밀번호" value="" required>
                                        <div class="invalid-feedback">Sorry, you missed this one.</div>   
                                    </div>
                                    <div class="row no-gutters px-4" style="padding-top:10px;">
                                        <div class="col-lg-9 pr-lg-1 my-2"> 
                                        </div>
                                        <div class="col-lg-3 pl-lg-1 my-2">
                                            <button id="btnLogin" type="submit" class="btn btn-primary btn-block btn-sm">Login</button>  
                                        </div>
                                    </div>
                                    <div class="row no-gutters px-4 text-center" style="padding-top:30px;">
                                        <div class="col-lg-12 pr-lg-1 my-2 text-center"> 
                                        	 2020 © ${result.system_name} by&nbsp;<a href='https://www.insunginfo.co.kr' class='opacity-40 fw-500' title='insunginfo.co.kr' target='_blank'>insunginfo.co.kr</a>
                                        </div>
                                    </div>   
                                </div>
		                    </div>		                    
						</div>                                            
					</div>
				</div>
			</div>  
		</div>      
		<div class="col-sm-12 col-md-12 col-lg-3 col-xl-3 ml-auto"></div>                             
	</div>
</main>
<!-- END Page Content -->  
</body> 
    
<%@ include file="/WEB-INF/views/login/LoginFormJs.jsp" %>
<script src="${contextpath}/static/plugin/cookie/jquery.cookie.js"></script>
<script src="${contextpath}/static/common/js/common.js"></script>
<script type="text/javascript">

	var user_id;
	var user_pw;
	
	$(function() {
		user_id = $('#user_id');
		user_pw = $('#user_pw');
		user_id.focus();
		
		$('body').keypress(function(e){  
			//enter key
			if(e.keyCode!=13) return;	
			clickBtnLogin(); 
		});	 
	
		$('#btnLogin').click(clickBtnLogin=function(){
		  	//폼 체크
			if(!Service.checkForm()) return;
		  	
			//로그인
			Service.loginProc();
		}); // $('#btnLogin').click(clickBtnLogin=function(){	
			
		
		if($.cookie('remember')=='Y'){
			$('input:checkbox[name="remember"]').prop('checked', true);
			$('#user_id').val($.cookie('user_id'));
		}else{  
			$('input:checkbox[name="remember"]').prop('checked', false);
		}
		
		$('input:checkbox[name="remember"]').change(function(){
			//$.cookie('remember', $(this).is(':checked')); 
			if($(this).is(':checked'))	$.cookie('remember', 'Y'); 
			else $.cookie('remember', 'N');  
		});
		
	});
	
	
	var Service = {				
		//입력 폼 체크
		checkForm : function(){
		    if(!user_id.val()) {
				alert("아이디를 입력하세요.");
				user_id.focus();
				return false;
			}
			if(!user_pw.val()) {
				alert("비밀번호를 입력하세요");
				user_pw.focus();
				return false;
			}
			
			return true;
		},			
		//로그인
		loginProc : function() { 
			var ajaxParam = {
	            "url" : "${contextpath}/login/loginProcAdmin.json",
	            "type" : "POST", 
	            //"loading" : "login_fieldset",
	        	"data" : {
	            	"user_id" : user_id.val(),
					"user_pw" : user_pw.val(),
					"user_type" : "0001"		//시스템관리자
					//,"language" : $('#language').val()
	            }
	        };
	        Common.ajaxJSON(ajaxParam, function(data) {
	         	//console.log("JSON : "+JSON.stringify(data.success));
	         	//Service.ajaxAdminLogInsert(data.success);
	          	if(data.msg) alert(data.msg);
				if(data.success==0||data.success==3){	//ID 틀림 or 오류발생
					user_id.val('');
					user_pw.val('');
					user_id.focus();
					return false;
				}else if(data.success==2){		//PW틀림
					user_pw.val('');
					user_pw.focus();
					return false;
				}
				if($('input:checkbox[name="remember"]').is(':checked')){
					$.cookie("user_id", user_id.val(), {"expires": 30});	//30day
				}
				Common.goPage("${contextpath}/system");
	        });
			return;
		}
	}
</script>
</body>
</html>
