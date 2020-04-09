<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="java.sql.*" %>
<%@ include file="conn.jsp"%>
<%
	request.setCharacterEncoding("utf-8");
    String[] class1=request.getParameterValues("class");
    String teacher=request.getParameter("teacher");
    PreparedStatement pst;
    ResultSet re;
    for (int i=0; i<class1.length; i++)
    {
	pst=con.prepareStatement("insert into 课程分配(年级,专业,班级,课程名称,任课老师,年份) values('"+class1[i].split(",")[0]+"','"+class1[i].split(",")[1]+"','"+class1[i].split(",")[2]+"','"+class1[i].split(",")[3]+"','"+teacher+"',"+currenttime+")");
	
	
	pst.executeUpdate();
   
	}
%>

<script type="text/javascript">
  window.onload=function()
  {
    alert("添加成功");
    window.location.href="assignment.jsp";

  }
</script>