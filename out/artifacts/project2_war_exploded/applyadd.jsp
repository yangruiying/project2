<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="java.sql.*" %>
<%@ include file="conn.jsp"%>
<%
	request.setCharacterEncoding("utf-8");
   
   
   
    String course=request.getParameter("course");
    String teacher=request.getParameter("name");
    String id1=request.getParameter("id1");
    
    PreparedStatement pst=con.prepareStatement("insert into 申请(课程名称,任课老师,课程代码) values(?,?,?)"); 
    pst.setString(1,course);
    pst.setString(2,teacher);
    pst.setString(3,id1);
    pst.executeUpdate();
	
%>

<script type="text/javascript">
  window.onload=function()
  {
    alert("申请成功");
    window.location.href="applyindex.jsp";

  }
</script>