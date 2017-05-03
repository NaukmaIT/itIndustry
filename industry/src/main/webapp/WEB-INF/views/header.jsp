<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<head>

    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="Home Page of Prozac">

    <title>IT</title>
    
	<!-- Shortcut -->
	<link href="<c:url value="/resources/img/it.ico" />" rel="shortcut icon">
	
	<!-- jQuery -->
    <script src="<c:url value="/resources/js/jquery.js" />"></script>
    
	<!-- Bootstrap Core JavaScript -->
    <script src="<c:url value="/resources/js/bootstrap.min.js" />"></script>
	
    <!-- Bootstrap Core CSS -->
    <link rel="stylesheet" href="<c:url value="/resources/css/bootstrap.min.css" />">
    
    <!-- CSS -->
    <link href="<c:url value="/resources/css/styles.css" />" rel="stylesheet">

    <!-- Fonts -->
    <link href="<c:url value="/resources/font-awesome/css/font-awesome.min.css" />" rel="stylesheet" type="text/css">
    
</head>

<body>

	<header>
		<div id="div1">
  			<div id="div2"><h1 class="myShadow">IT INDUSTRY</h1>
    			<div id="div3"><h1 class="myShadow">IT EDUCATION</h1></div>
  			</div>
		</div>
		
		<div style="margin-right: 1%;">
		<sec:authorize access="!isAuthenticated()">
			<a href="<c:url value="/login" />" id="hp-id" class="linkBtn"> Увійти </a>
		</sec:authorize>
		<sec:authorize access="isAuthenticated()">
			<a href="<c:url value="/logout" />" id="hp-id" class="linkBtn">
				<span class="glyphicon glyphicon-log-out" aria-hidden="true"></span>
							Вийти: ${pageContext.request.userPrincipal.name} </a>
		</sec:authorize>
		</div>