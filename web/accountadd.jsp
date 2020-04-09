<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="java.sql.*" %>
<%@ include file="conn.jsp"%>
<%
  request.setCharacterEncoding("utf-8");
    String id=request.getParameter("id");
    String password=request.getParameter("password");
    String power=request.getParameter("power");
    
    PreparedStatement pst=con.prepareStatement("insert into 账号(账号,密码,权限) values(?,?,?)"); 
    pst.setString(1,id);
    pst.setString(2,password);
    pst.setString(3,power);
    pst.executeUpdate();
%>

<script type="text/javascript">
  window.onload=function()
  {
    alert("添加成功");
    window.location.href="accountindex.jsp";

  }
</script>