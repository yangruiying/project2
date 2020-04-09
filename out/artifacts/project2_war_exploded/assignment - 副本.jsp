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
	body{
		background-color: yellow;
	}
	table{
		font-size: 20px;
		margin: auto;
		margin-top: 200px;
	}
</style>

<div>
<form>
	<table>
		
		<tr>
			<td colspan="3">往年课程安排查询：</td>
		</tr>
		
		<tr>
			<td>年级：</td>
			<td name="grade">
				<select>
					<option>2015届</option>
					<option>2016届</option>
					<option>2017届</option>
				</select>
			</td>

			<td>学期：</td>
			<td>
			<select name="term">
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
	<td><input type="submit" value="查询"></td>
	</tr>
	</table>


</form>
<form  method="post" action="assignmentadd.jsp">
	<table>
	<tr>
	<td>院系：</td>
	<td>
		<input type="text" name="department">
	</td>
	</tr>

	<tr>
	<td>专业：</td>
	<td>
		<input type="text" name="major">
	</td>
	</tr>

	<tr>
	<td>课程：</td>
	<td>
		<input type="text" name="course">
	</td>
	</tr>

	<tr>
	<td>班级：</td>
	<td>
		<input type="text" name="class">
	</td>
	</tr>
	
	<tr>
	<td>任课老师：</td>
	<td>
		<select name="teacher">
			<%
				pst=con.prepareStatement("select 账号 from 账号 where 权限='教师' ");
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
	<td>教材名称：</td>
	<td>
		<select name="text1">
			<%
				pst=con.prepareStatement("select distinct 教材名称 from 教材");
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
	<td><input type="submit" value="提交"></td>
	</tr>
	</table>
</form>
</div>

</body>
</html>
