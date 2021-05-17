<%@ page language="java" 	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%> 
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<c:set var="contextpath" value="<%= request.getContextPath()%>"></c:set> 

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>${ISUP_CONFIG.system_name}</title> 
    <meta name="description" content="Login">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no, user-scalable=no, minimal-ui">
    <!-- Call App Mode on ios devices -->
    <meta name="apple-mobile-web-app-capable" content="yes" />
    <!-- Remove Tap Highlight on Windows Phone IE -->
    <meta name="msapplication-tap-highlight" content="no">
    <!-- base css -->
    <link rel="stylesheet" media="screen, print" href="${contextpath}/static/SmartAdmin/css/vendors.bundle.css">
   	<link rel="stylesheet" media="screen, print" href="${contextpath}/static/SmartAdmin/css/app.bundle.css">
    <!-- Optional: page related CSS-->
    <link rel="stylesheet" media="screen, print" href="${contextpath}/static/SmartAdmin/css/fa-brands.css">
    
	<link rel="stylesheet" media="screen, print" href="${contextpath}/static/SmartAdmin/css/datagrid/datatables/datatables.bundle.css">
    <link rel="stylesheet" media="screen, print" href="${contextpath}/static/SmartAdmin/css/formplugins/bootstrap-datepicker/bootstrap-datepicker.css">
    <link rel="stylesheet" media="screen, print" href="${contextpath}/static/plugin/bootstrap/bootstrap.css">
    <link rel="stylesheet" media="screen, print" href="${contextpath}/static/plugin/jstree/css/default/style.css">
    <link rel="stylesheet" media="screen, print" href="${contextpath}/static/plugin/c3/c3.css">
    <link rel="stylesheet" media="screen, print" href="${contextpath}/static/common/css/custom.css">
</head>
