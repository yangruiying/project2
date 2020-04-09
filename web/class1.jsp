<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="java.sql.*" %>
<%@ include file="conn.jsp"%>
<html>
<head>
<meta charset="utf-8">
<title>无标题文档</title>
</head>
<body>
<style type="text/css">
	@import url("a.css");
</style>

<body>

<div id="title">
	<h3>欢迎使用开课任务管理系统</h3>
</div>

<div id="indexdiv">
<ul id="index">

	<li id="index2">
	<a href="account.jsp">数据管理</a>
		<ul id="index1">
			<li><a href="accountindex.jsp">账号管理</a></li>
			<li><a href="classindex.jsp">班级管理</a></li>
			<li><a href="courseindex.jsp">课程管理</a></li>
		</ul>
	</li>
	<li><a href="assignment.jsp">任务分配</a></li>
	<li><a href="textbook.jsp">教材选填</a></li>
	<li><a href="scheduleindex.jsp">课程安排</a></li>
</ul>
</div>
<div >
<form  method="post" action="scheduleadd.jsp">
	<table>
	<tr>
	<td>院系：</td>
	<td>
		<select name="department">
			<%
				PreparedStatement pst=con.prepareStatement("select distinct 院系 from 课程分配");
				ResultSet re = pst.executeQuery();
				while(re.next())
				{
					out.println("<option>"+re.getString(1)+"</option>");
				}
			%>

		</select>
	</td>
	</tr>

	<tr>
	<td>专业：</td>
	<td>
		<select name="major">
			<%
				pst=con.prepareStatement("select distinct 专业 from 课程分配");
				re = pst.executeQuery();
				while(re.next())
				{
					out.println("<option>"+re.getString(1)+"</option>");
				}
			%>

		</select>
	</td>
	</tr>

	<tr>
	<td>班级：</td>
	<td>
		<select name="class">
			<%
				pst=con.prepareStatement("select distinct 班级 from 课程分配");
				re = pst.executeQuery();
				while(re.next())
				{
					out.println("<option>"+re.getString(1)+"</option>");
				}
			%>

		</select>
	</td>
	</tr>
	
	<tr>
	<td>课程：</td>
	<td>
		<select name="course">
			<%
				pst=con.prepareStatement("select distinct 课程名称 from 课程分配");
				re = pst.executeQuery();
				while(re.next())
				{
					out.println("<option>"+re.getString(1)+"</option>");
				}
			%>

		</select>
	</td>
	</tr>
	
	<tr>
	<td>年级：</td>
	<td>
		<select name="grade">
			<option>大一上学期</option>
			<option>大一下学期</option>
			<option>大二上学期</option>
			<option>大二下学期</option>
			<option>大三上学期</option>
			<option>大三下学期</option>
			<option>大四上学期</option>
			<option>大四下学期</option>
		</select>
	</td>
	</tr>

	<tr>
	<td>上课时间：</td>
	<td>
		<select name="time">
			<option>星期一</option>
			<option>星期二</option>
			<option>星期三</option>
			<option>星期四</option>
			<option>星期五</option>
		</select>
	</td>
	</tr>

	<tr>
	<td>上课节次：</td>
	<td>
		<select name="order">
			<option>第1节</option>
			<option>第2节</option>
			<option>第3节</option>
			<option>第4节</option>
		</select>
	</td>
	</tr>
	
	<tr>
	<td>上课地点：</td>
	<td><input type="text" name="address"></td>
	</tr>
	
	
	<tr>
	<td><input type="submit" value="提交"></td>
	</tr>
	</table>
</form>
</div>

</body>
</html>
