<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="java.sql.*" %>
<%@ include file="conn.jsp"%>
<%
  request.setCharacterEncoding("utf-8");
    String id=request.getParameter("id");
    String name=request.getParameter("name");
    
    PreparedStatement pst=con.prepareStatement("insert into 教材(教材名称,id) values(?,?)"); 
    pst.setString(1,name);
    pst.setString(2,id);
    pst.executeUpdate();
%>

<script type="text/javascript">
  window.onload=function()
  {
    alert("添加成功");
    window.location.href="textindex.jsp";

  }
</script>