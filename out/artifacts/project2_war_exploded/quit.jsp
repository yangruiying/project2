<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="java.sql.*" %>
<%@ include file="conn.jsp"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>无标题文档</title>
</head>
<%
	session.removeAttribute("name");
	session.removeAttribute("power");
	session.removeAttribute("id1");
	session.removeAttribute("time");
%>
<jsp:forward page="login.html"/>
</html>
