<%@ page language="java" import="java.net.URLDecoder" pageEncoding="utf-8"%>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="com.test" %>
<%@ include file="conn.jsp"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>无标题文档</title>
</head>

<%
	request.setCharacterEncoding("utf-8");
	String id=request.getParameter("id");
	String password=request.getParameter("password");
	PreparedStatement pst = con.prepareStatement("select 账号,权限 from 账号 where 账号='"+id+"' and 密码='"+password+"'");
	ResultSet re = pst.executeQuery();

	re.next();

		try {
			session.setAttribute("name", re.getString(1));
			session.setAttribute("power", re.getString(2));
			test.name=re.getString(1);
			test.power=re.getString(2);




	String power=re.getString(2).trim();
		if(power.equals("教师"))
		{

	
%>
	<jsp:forward page="teacherindex.jsp"/>
<%
		}

	
	else if(power.equals("管理员"))
%>
<jsp:forward page="index.jsp"/>
<%
	}catch (Exception e){
		out.println("<a href='login.html'/>账号或密码错误点击返回");
	}
%>
</html>
