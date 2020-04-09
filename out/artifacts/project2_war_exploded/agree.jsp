<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="java.sql.*" %>
<%@ include file="conn.jsp"%>
<%
	request.setCharacterEncoding("utf-8");
    
    //int id=Integer.valueOf(request.getParameter("id"));
    PreparedStatement pst;
    ResultSet re;
    pst=con.prepareStatement("update 申请 set 状态='同意' where 课程名称='"+request.getParameter("course")+"' and 任课老师='"+request.getParameter("teacher")+"'");
    pst.executeUpdate();

	
%>

<%
String src="assignment.jsp?id1="+request.getParameter("id1")+"&course="+request.getParameter("course")+"&teacher="+request.getParameter("teacher");
%>

<script type="text/javascript">
  window.onload=function()
  {
    alert("已同意");
   window.location.href="applycheck.jsp";

  }
</script>