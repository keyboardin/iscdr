<!-- index.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%> 
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<c:set var="contextpath" value="<%= request.getContextPath()%>"></c:set> 

<body></body>
<!-- <script src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<script>
	if (!window.jQuery) {
		document.write('<script src="${contextpath}/static/SmartAdmin/js/libs/jquery-2.1.1.min.js"><\/script>');
	}
</script> -->
<script src="${contextpath}/static/SmartAdmin/js/vendors.bundle.js"></script>
<script src="${contextpath}/static/common/js/common.js"></script>
<script>

	var menu_par_id = '${ISUP_MENU_FIRST.menu_par_id}';
	var menu_id = '${ISUP_MENU_FIRST.menu_id}';
	var menu_url= '${contextpath}'+'${ISUP_MENU_FIRST.menu_url}';

	var $form = $(document.createElement("form"));
	$form.attr("method", "POST");
	$form.attr("action", menu_url); 
	 	
	var $input1 = $(document.createElement("input"));
	$input1.attr("name", "menu_par_id").attr('type','hidden').val(menu_par_id);   	 	 	

	var $input2 = $(document.createElement("input"));
	$input2.attr("name", "menu_id").attr('type','hidden').val(menu_id); 
	 	
	$form.append($input1).append($input2);
	$("body").append($form);
	if(menu_id != null && menu_id != ''){
		$form.submit();
	}else{
		Common.goPage("${contextpath}/loginForm.do");
	}
	
	
</script>
