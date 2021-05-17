<!-- loginForm3.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/login/LoginFormCss.jsp" %>

<body>
<div class="page-wrapper"> 
    <div class="page-inner bg-brand-gradient">
        <div class="page-content-wrapper bg-transparent m-0">
            <div class="height-10 w-100 shadow-lg px-4 bg-brand-gradient">
                <div class="d-flex align-items-center container p-0">
                    <div class="page-logo width-mobile-auto m-0 align-items-center justify-content-center p-0 bg-transparent bg-img-none shadow-0 height-9">
                    </div>
                </div>
            </div>
            <div class="flex-1" style="background: url(${contextpath}/static/SmartAdmin/img/svg/pattern-1.svg) no-repeat center bottom fixed; background-size: cover;">
                <div class="container py-4 py-lg-5 my-lg-5 px-4 px-sm-0">
                    <div class="row">
                        <div class="col col-md-6 col-lg-7 hidden-sm-down">
                            <h2 class="fs-xxl fw-500 mt-4 text-white">
                                ${result.solution_name}
                                <small class="h3 fw-300 mt-3 mb-5 text-white opacity-60">
                                    Unified Communication Management System
                                </small>
                            </h2> 
                        </div>  
                        <div class="col-sm-12 col-md-6 col-lg-5 col-xl-5 ml-auto">                                   
                            <div class="card p-4 rounded-plus bg-faded">
                                <div novalidate="" id="login_fieldset">
                                	<div class="form-group smart-form px-2">
                                  		<header><h2>Sign In</h2></header>
									</div> 
                                    <div class="form-group px-4">  
                                        <input id="user_id" type="text"  class="form-control form-control-lg" placeholder="아이디" value="" required>
                                        <div class="invalid-feedback">No, you missed this one.</div>
                                    </div>
                                    <div class="form-group px-4"> 
                                        <input id="user_pw" type="password" class="form-control form-control-lg" placeholder="비밀번호" value="" required>
                                        <div class="invalid-feedback">Sorry, you missed this one.</div>   
                                    </div>
                                    <div class="form-group text-left px-6">  
                                        <div class="custom-control custom-checkbox">  
                                            <input type="checkbox" class="custom-control-input" name="remember" id="remember"> 
                                            <label class="custom-control-label" for="remember"> 아이디 저장</label>
                                        </div>
                                    </div>
                                    <div class="row no-gutters px-4" style="border-top: 1px solid rgba(0,0,0,.1);padding-top:20px;">
                                        <div class="col-lg-9 pr-lg-1 my-2"> 
                                        </div>
                                        <div class="col-lg-3 pl-lg-1 my-2">
                                            <button id="btnLogin" type="submit" class="btn btn-primary btn-block btn-sm">Login</button>  
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="position-absolute pos-bottom pos-left pos-right p-3 text-center text-white">
                        2020 © isIpt by&nbsp;<a href='https://www.insunginfo.co.kr' class='text-white opacity-40 fw-500' title='insunginfo.co.kr' target='_blank'>insunginfo.co.kr</a>
                    </div>
                </div>
            </div>   
        </div>
    </div>
</div>
    
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
	}); 
		
	
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
	
	
	$('#btnSavePw2').click(clickBtnSavePw2=function(){
		Service.requestChangePw2();
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
            "url" : "${contextpath}/login/loginProc.json",
            "type" : "POST", 
            //"loading" : "login_fieldset",
        	"data" : {
            	"user_id" : user_id.val(),
				"user_pw" : user_pw.val(),
				"user_type" : "0003"		//일반사용자
				//,"language" : $('#language').val()
            }
        };
        Common.ajaxJSON(ajaxParam, function(data) {
         	//console.log("JSON : "+JSON.stringify(data.success));
          	if(data.msg) alert(data.msg);
			if(data.success==2||data.success==0){	//ID 틀림 or 오류발생
				user_id.val('');
				user_pw.val('');
				user_id.focus();
				return false;
			}else if(data.success==3){		//PW틀림
				user_pw.val('');
				user_pw.focus();
				return false;
			}else if(data.success==4){		//PW없음
				$('#new_user_pw').val("");
				$('#confirm_user_pw').val(""); 
				$("#form_modal_changepw2").modal("show"); 
				return false;
			}
			if($('input:checkbox[name="remember"]').is(':checked')){
				$.cookie("user_id", user_id.val(), {"expires": 30});	//30day
			}
			Common.goPage("${contextpath}/");
        });
		return;
	},
	
	requestChangePw2 : function(){ 
		if(!$.notnull($('#new_user_pw'), '비밀번호')) return false; 
		if(!$.notnull($('#confirm_user_pw'), '비밀번호 재확인')) return false; 
		if($('#new_user_pw').val() != $('#confirm_user_pw').val()){
			alert('비밀번호가 일치하지 않습니다');
			$('#confirm_user_pw').val('');
			$('#confirm_user_pw').focus();
			return false;
		}
	 	var ajaxParam = {
	        "url" : getContextPath()+'/emp/empChangePw.json',
	        "type" : "POST",
	    	"data" : {
	    		"user_id" : $("#user_id").val(),
				"user_pw" : $("#new_user_pw").val()  
	        }
	    };
	    Common.ajaxJSON(ajaxParam, function(data) {       
			alert(data.msg);
			if(!data.success) return;
			$('#form_modal_changepw2').modal('hide');	
	    });
	}
}
</script>
</body>
</html>

