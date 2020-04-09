<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="java.sql.*" %>
<%@ include file="conn.jsp"%>
<%
	request.setCharacterEncoding("utf-8");
    String course=request.getParameter("course");
    String id=request.getParameter("id");
    String time=request.getParameter("time");
    String class1=request.getParameter("class");
    PreparedStatement pst=con.prepareStatement("insert into 课程(课程,课程代码,学时,班级) values(?,?,?,?)"); 
    pst.setString(1,course);
    pst.setString(2,id);
    pst.setString(3,time);
    pst.setString(4,class1);
    pst.executeUpdate();
%>

<script type="text/javascript">
  window.onload=function()
  {
    alert("添加成功");
    window.location.href="courseindex.jsp";

  }
</script>