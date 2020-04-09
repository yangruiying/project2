<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="java.sql.*" %>
<%@ include file="conn.jsp"%>

<%
request.setCharacterEncoding("UTF-8");
String user=request.getParameter("user");
String password=request.getParameter("password");
String power=request.getParameter("power");
PreparedStatement pst = con.prepareStatement("update 登录 set 密码=?,权限=? where 账号=?");
pst.setString(1,password);
pst.setString(2,power);
pst.setString(3,user);
pst.executeUpdate();
out.println("修改成功");
%>