<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="java.sql.*" %>
<%@ include file="conn.jsp"%>

<%
request.setCharacterEncoding("UTF-8");
String user=request.getParameter("user");
String password=request.getParameter("password");
String power=request.getParameter("power");
PreparedStatement pst = con.prepareStatement("insert into 登录 values(?,?,?)");
pst.setString(1,user);
pst.setString(2,password);
pst.setString(3,power);
pst.executeUpdate();
out.println("增加成功");
%>