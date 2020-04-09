<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="java.sql.*" %>
<%@ include file="conn.jsp"%>
<%
	request.setCharacterEncoding("utf-8");
   
    String major=request.getParameter("major");
    String class1=request.getParameter("class");
    String num=request.getParameter("num");
    String grade=request.getParameter("grade");
    
    PreparedStatement pst=con.prepareStatement("insert into 班级(专业,班级,人数,年级) values(?,?,?,?)"); 
    pst.setString(1,major);
    pst.setString(2,class1);
    pst.setString(3,num);
    pst.setString(4,grade);
    pst.executeUpdate();
%>

<script type="text/javascript">
  window.onload=function()
  {
    alert("添加成功");
    window.location.href="classindex.jsp";

  }
</script>