<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="java.sql.*" %>
<%@ include file="conn.jsp"%>
<%
    request.setCharacterEncoding("utf-8");
    String department=request.getParameter("department");
    String major=request.getParameter("major");
    String class1=request.getParameter("class");
    String course=request.getParameter("course");
    String time=request.getParameter("time");
    String address=request.getParameter("address");
    String order=request.getParameter("order");
    String grade=request.getParameter("grade");
    PreparedStatement pst=con.prepareStatement("insert into 课程安排(院系,专业,班级,课程,上课时间,上课地点,节次,年级) values(?,?,?,?,?,?,?,?)"); 
    pst.setString(1,department);
    pst.setString(2,major);
    pst.setString(3,class1);
    pst.setString(4,course);
    pst.setString(5,time);
    pst.setString(6,address);
    pst.setString(7,order);
    pst.setString(8,grade);
    pst.executeUpdate();

%>

<script type="text/javascript">
  window.onload=function()
  {
    alert("添加成功");
    window.location.href="scheduleindex.jsp";
  }
</script>