<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="java.sql.*" %>
<%@ include file="conn.jsp"%>
<html>
<head>
<meta charset="utf-8">
<title>无标题文档</title>
</head>
<style type="text/css">
	#title
	{
		height: 50px;
		background-color: rgb(59,58,72);
	}
	#title h3
	{
		position:relative;
		margin-left:50px;
		color: white;
		top: 10px;
	}

	
	li
	{
		list-style: none;
		width: 135px;
		height: 50px;
		
		left: -50px;
		position: relative;
	}
		
		
	body
	{
		background-color: rgb(240,241,245);
	}	
	

	a
	{
		text-decoration: none;
		left: 30px;
		top: 10px;
		position: relative;
	}
	#index 
	{
		
		width: 100px;
		background-color:  white;
		padding-top: 30px; 
		min-height: 100%;
    	height: auto;
    	top:-13px;
    	position: relative;
		
	}

	#index li
	{
		margin-bottom: 100px;
		left: -39px;
		position: relative;
	}

	#index1
	{
		float: left;
		width: 100px;
		background-color: white;
		left: 140px;
		top: -30px;
		position: absolute;
		display: none;
	}
	#index1 li
	{
		margin-bottom: 10px;
	}

	#index2:hover #index1
	{
		display: block;
	}
	
	li:hover
	{
		background-color: blue;
	}

	#table
	{
		position: relative;
		float: left;
	}
	#indexdiv
	{
		width: 200px;
		float: left;
	}
	#date
	{
		position: relative;
		top: 100px;
		float: left;
	}

	#date td
	{
		height: 50px;
		width: 100px;
		padding: 5px;
	}

	#date p
	{
		position: relative;
		width: 100px;
		height: 10px;
		left: 35px;
		font-size: 10px;
	}
	#add
	{
		float: left;
		position: relative;

	}
</style>
<body>
<div id="title">
	<h3>欢迎使用开课任务管理系统</h3>
</div>

<div id="indexdiv">
<ul id="index">

	<li id="index2">
	<a href="account.jsp">账号管理</a>
		<ul id="index1">
			<li><a href="assignment.jsp">任务分配</a></li>
			<li><a href="assignment.jsp">任务分配</a></li>
			<li><a href="assignment.jsp">任务分配</a></li>
			<li><a href="assignment.jsp">任务分配</a></li>
		</ul>
	</li>
	<li><a href="assignment.jsp">任务分配</a></li>
	<li><a href="textbook.jsp">教材选填</a></li>
	<li><a href="scheduleindex.jsp">课程安排</a></li>
</ul>
</div>

<%
 request.setCharacterEncoding("utf-8");
 String grade=request.getParameter("grade");
 String class1=request.getParameter("class");
 String department=request.getParameter("department");
 String major=request.getParameter("major");
 String term=request.getParameter("term");
%>
<div>
	<form method="post" action="#">
		<table id="table">
			<tr>
				<td>年级：</td>
				<td>
					<select name="grade">
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
<%
if(grade!=null)
 {
%>
	<table id="date" border="1">
		<tr>
			<td></td>
			<td>星期一</td>
			<td>星期二</td>
			<td>星期三</td>
			<td>星期四</td>
			<td>星期五</td>
		</tr>

		<tr>
			<td>1</td>
			<%
				pst=con.prepareStatement("select 课程,上课地点,任课老师,节次,上课时间 from 课程安排,课程分配 where 课程安排.院系=课程分配.院系 and 课程安排.专业=课程分配.专业 and 课程安排.班级=课程分配.班级 and 课程安排.年级=课程分配.年级 and 课程安排.课程=课程分配.课程名称 and 课程安排.院系='"+department+"' and 课程安排.专业='"+major+"' and 课程安排.班级='"+class1+"' and 课程安排.年级='"+grade+"' and 课程安排.学期='"+term+"' and 上课时间='星期一' and 节次='1' ");
				re=pst.executeQuery();
				if (re.next()) 
				{
					out.println("<td style='background:blue;'><p>"+re.getString(1)+"</p><p>"+re.getString(2)+"</p><p>"+re.getString(3)+"</p></td>");
				}
				else
				{
			%>
			<td></td>
			<%
				}
			%>
			<%
				pst=con.prepareStatement("select 课程,上课地点,任课老师,节次,上课时间 from 课程安排,课程分配 where 课程安排.院系=课程分配.院系 and 课程安排.专业=课程分配.专业 and 课程安排.班级=课程分配.班级 and 课程安排.年级=课程分配.年级 and 课程安排.课程=课程分配.课程名称 and 课程安排.院系='"+department+"' and 课程安排.专业='"+major+"' and 课程安排.班级='"+class1+"' and 课程安排.年级='"+grade+"' and 课程安排.学期='"+term+"' and 上课时间='星期二' and 节次='1' ");
				re=pst.executeQuery();
				if (re.next()) 
				{
					out.println("<td style='background:blue;'><p>"+re.getString(1)+"</p><p>"+re.getString(2)+"</p><p>"+re.getString(3)+"</p></td>");
				}
				else
				{
			%>
			<td></td>
			<%
				}
			%>
			<%
				pst=con.prepareStatement("select 课程,上课地点,任课老师,节次,上课时间 from 课程安排,课程分配 where 课程安排.院系=课程分配.院系 and 课程安排.专业=课程分配.专业 and 课程安排.班级=课程分配.班级 and 课程安排.年级=课程分配.年级 and 课程安排.课程=课程分配.课程名称 and 课程安排.院系='"+department+"' and 课程安排.专业='"+major+"' and 课程安排.班级='"+class1+"' and 课程安排.年级='"+grade+"' and 课程安排.学期='"+term+"' and 上课时间='星期三' and 节次='1' ");
				re=pst.executeQuery();
				if (re.next()) 
				{
					out.println("<td style='background:blue;'><p>"+re.getString(1)+"</p><p>"+re.getString(2)+"</p><p>"+re.getString(3)+"</p></td>");
				}
				else
				{
			%>
			<td></td>
			<%
				}
			%>
			<%
				pst=con.prepareStatement("select 课程,上课地点,任课老师,节次,上课时间 from 课程安排,课程分配 where 课程安排.院系=课程分配.院系 and 课程安排.专业=课程分配.专业 and 课程安排.班级=课程分配.班级 and 课程安排.年级=课程分配.年级 and 课程安排.课程=课程分配.课程名称 and 课程安排.院系='"+department+"' and 课程安排.专业='"+major+"' and 课程安排.班级='"+class1+"' and 课程安排.年级='"+grade+"' and 课程安排.学期='"+term+"' and 上课时间='星期四' and 节次='1' ");
				re=pst.executeQuery();
				if (re.next()) 
				{
					out.println("<td style='background:blue;'><p>"+re.getString(1)+"</p><p>"+re.getString(2)+"</p><p>"+re.getString(3)+"</p></td>");
				}
				else
				{
			%>
			<td></td>
			<%
				}
			%>
			<%
				pst=con.prepareStatement("select 课程,上课地点,任课老师,节次,上课时间 from 课程安排,课程分配 where 课程安排.院系=课程分配.院系 and 课程安排.专业=课程分配.专业 and 课程安排.班级=课程分配.班级 and 课程安排.年级=课程分配.年级 and 课程安排.课程=课程分配.课程名称 and 课程安排.院系='"+department+"' and 课程安排.专业='"+major+"' and 课程安排.班级='"+class1+"' and 课程安排.年级='"+grade+"' and 课程安排.学期='"+term+"' and 上课时间='星期五' and 节次='1' ");
				re=pst.executeQuery();
				if (re.next()) 
				{
					out.println("<td style='background:blue;'><p>"+re.getString(1)+"</p><p>"+re.getString(2)+"</p><p>"+re.getString(3)+"</p></td>");
				}
				else
				{
			%>
			<td></td>
			<%
				}
			%>
		</tr>

		<tr>
			<td>2</td>
			<%
				pst=con.prepareStatement("select 课程,上课地点,任课老师,节次,上课时间 from 课程安排,课程分配 where 课程安排.院系=课程分配.院系 and 课程安排.专业=课程分配.专业 and 课程安排.班级=课程分配.班级 and 课程安排.年级=课程分配.年级 and 课程安排.课程=课程分配.课程名称 and 课程安排.院系='"+department+"' and 课程安排.专业='"+major+"' and 课程安排.班级='"+class1+"' and 课程安排.年级='"+grade+"' and 课程安排.学期='"+term+"' and 上课时间='星期一' and 节次='2' ");
				re=pst.executeQuery();
				if (re.next()) 
				{
					out.println("<td style='background:blue;'><p>"+re.getString(1)+"</p><p>"+re.getString(2)+"</p><p>"+re.getString(3)+"</p></td>");
				}
				else
				{
			%>
			<td></td>
			<%
				}
			%>
			<%
				pst=con.prepareStatement("select 课程,上课地点,任课老师,节次,上课时间 from 课程安排,课程分配 where 课程安排.院系=课程分配.院系 and 课程安排.专业=课程分配.专业 and 课程安排.班级=课程分配.班级 and 课程安排.年级=课程分配.年级 and 课程安排.课程=课程分配.课程名称 and 课程安排.院系='"+department+"' and 课程安排.专业='"+major+"' and 课程安排.班级='"+class1+"' and 课程安排.年级='"+grade+"' and 课程安排.学期='"+term+"' and 上课时间='星期二' and 节次='2' ");
				re=pst.executeQuery();
				if (re.next()) 
				{
					out.println("<td style='background:blue;'><p>"+re.getString(1)+"</p><p>"+re.getString(2)+"</p><p>"+re.getString(3)+"</p></td>");
				}
				else
				{
			%>
			<td></td>
			<%
				}
			%>
			<%
				pst=con.prepareStatement("select 课程,上课地点,任课老师,节次,上课时间 from 课程安排,课程分配 where 课程安排.院系=课程分配.院系 and 课程安排.专业=课程分配.专业 and 课程安排.班级=课程分配.班级 and 课程安排.年级=课程分配.年级 and 课程安排.课程=课程分配.课程名称 and 课程安排.院系='"+department+"' and 课程安排.专业='"+major+"' and 课程安排.班级='"+class1+"' and 课程安排.年级='"+grade+"' and 课程安排.学期='"+term+"' and 上课时间='星期三' and 节次='2' ");
				re=pst.executeQuery();
				if (re.next()) 
				{
					out.println("<td style='background:blue;'><p>"+re.getString(1)+"</p><p>"+re.getString(2)+"</p><p>"+re.getString(3)+"</p></td>");
				}
				else
				{
			%>
			<td></td>
			<%
				}
			%>
			<%
				pst=con.prepareStatement("select 课程,上课地点,任课老师,节次,上课时间 from 课程安排,课程分配 where 课程安排.院系=课程分配.院系 and 课程安排.专业=课程分配.专业 and 课程安排.班级=课程分配.班级 and 课程安排.年级=课程分配.年级 and 课程安排.课程=课程分配.课程名称 and 课程安排.院系='"+department+"' and 课程安排.专业='"+major+"' and 课程安排.班级='"+class1+"' and 课程安排.年级='"+grade+"' and 课程安排.学期='"+term+"' and 上课时间='星期四' and 节次='2' ");
				re=pst.executeQuery();
				if (re.next()) 
				{
					out.println("<td style='background:blue;'><p>"+re.getString(1)+"</p><p>"+re.getString(2)+"</p><p>"+re.getString(3)+"</p></td>");
				}
				else
				{
			%>
			<td></td>
			<%
				}
			%>
			<%
				pst=con.prepareStatement("select 课程,上课地点,任课老师,节次,上课时间 from 课程安排,课程分配 where 课程安排.院系=课程分配.院系 and 课程安排.专业=课程分配.专业 and 课程安排.班级=课程分配.班级 and 课程安排.年级=课程分配.年级 and 课程安排.课程=课程分配.课程名称 and 课程安排.院系='"+department+"' and 课程安排.专业='"+major+"' and 课程安排.班级='"+class1+"' and 课程安排.年级='"+grade+"' and 课程安排.学期='"+term+"' and 上课时间='星期五' and 节次='2' ");
				re=pst.executeQuery();
				if (re.next()) 
				{
					out.println("<td style='background:blue;'><p>"+re.getString(1)+"</p><p>"+re.getString(2)+"</p><p>"+re.getString(3)+"</p></td>");
				}
				else
				{
			%>
			<td></td>
			<%
				}
			%>
		</tr>

		<tr>
			<td>3</td>
			<%
				pst=con.prepareStatement("select 课程,上课地点,任课老师,节次,上课时间 from 课程安排,课程分配 where 课程安排.院系=课程分配.院系 and 课程安排.专业=课程分配.专业 and 课程安排.班级=课程分配.班级 and 课程安排.年级=课程分配.年级 and 课程安排.课程=课程分配.课程名称 and 课程安排.院系='"+department+"' and 课程安排.专业='"+major+"' and 课程安排.班级='"+class1+"' and 课程安排.年级='"+grade+"' and 课程安排.学期='"+term+"' and 上课时间='星期一' and 节次='3' ");
				re=pst.executeQuery();
				if (re.next()) 
				{
					out.println("<td style='background:blue;'><p>"+re.getString(1)+"</p><p>"+re.getString(2)+"</p><p>"+re.getString(3)+"</p></td>");
				}
				else
				{
			%>
			<td></td>
			<%
				}
			%>
			<%
				pst=con.prepareStatement("select 课程,上课地点,任课老师,节次,上课时间 from 课程安排,课程分配 where 课程安排.院系=课程分配.院系 and 课程安排.专业=课程分配.专业 and 课程安排.班级=课程分配.班级 and 课程安排.年级=课程分配.年级 and 课程安排.课程=课程分配.课程名称 and 课程安排.院系='"+department+"' and 课程安排.专业='"+major+"' and 课程安排.班级='"+class1+"' and 课程安排.年级='"+grade+"' and 课程安排.学期='"+term+"' and 上课时间='星期二' and 节次='3' ");
				re=pst.executeQuery();
				if (re.next()) 
				{
					out.println("<td style='background:blue;'><p>"+re.getString(1)+"</p><p>"+re.getString(2)+"</p><p>"+re.getString(3)+"</p></td>");
				}
				else
				{
			%>
			<td></td>
			<%
				}
			%>
			<%
				pst=con.prepareStatement("select 课程,上课地点,任课老师,节次,上课时间 from 课程安排,课程分配 where 课程安排.院系=课程分配.院系 and 课程安排.专业=课程分配.专业 and 课程安排.班级=课程分配.班级 and 课程安排.年级=课程分配.年级 and 课程安排.课程=课程分配.课程名称 and 课程安排.院系='"+department+"' and 课程安排.专业='"+major+"' and 课程安排.班级='"+class1+"' and 课程安排.年级='"+grade+"' and 课程安排.学期='"+term+"' and 上课时间='星期三' and 节次='3' ");
				re=pst.executeQuery();
				if (re.next()) 
				{
					out.println("<td style='background:blue;'><p>"+re.getString(1)+"</p><p>"+re.getString(2)+"</p><p>"+re.getString(3)+"</p></td>");
				}
				else
				{
			%>
			<td></td>
			<%
				}
			%>
			<%
				pst=con.prepareStatement("select 课程,上课地点,任课老师,节次,上课时间 from 课程安排,课程分配 where 课程安排.院系=课程分配.院系 and 课程安排.专业=课程分配.专业 and 课程安排.班级=课程分配.班级 and 课程安排.年级=课程分配.年级 and 课程安排.课程=课程分配.课程名称 and 课程安排.院系='"+department+"' and 课程安排.专业='"+major+"' and 课程安排.班级='"+class1+"' and 课程安排.年级='"+grade+"' and 课程安排.学期='"+term+"' and 上课时间='星期四' and 节次='3' ");
				re=pst.executeQuery();
				if (re.next()) 
				{
					out.println("<td style='background:blue;'><p>"+re.getString(1)+"</p><p>"+re.getString(2)+"</p><p>"+re.getString(3)+"</p></td>");
				}
				else
				{
			%>
			<td></td>
			<%
				}
			%>
			<%
				pst=con.prepareStatement("select 课程,上课地点,任课老师,节次,上课时间 from 课程安排,课程分配 where 课程安排.院系=课程分配.院系 and 课程安排.专业=课程分配.专业 and 课程安排.班级=课程分配.班级 and 课程安排.年级=课程分配.年级 and 课程安排.课程=课程分配.课程名称 and 课程安排.院系='"+department+"' and 课程安排.专业='"+major+"' and 课程安排.班级='"+class1+"' and 课程安排.年级='"+grade+"' and 课程安排.学期='"+term+"' and 上课时间='星期五' and 节次='3' ");
				re=pst.executeQuery();
				if (re.next()) 
				{
					out.println("<td style='background:blue;'><p>"+re.getString(1)+"</p><p>"+re.getString(2)+"</p><p>"+re.getString(3)+"</p></td>");
				}
				else
				{
			%>
			<td></td>
			<%
				}
			%>
		</tr>

		<tr>
			<td>4</td>
			<%
				pst=con.prepareStatement("select 课程,上课地点,任课老师,节次,上课时间 from 课程安排,课程分配 where 课程安排.院系=课程分配.院系 and 课程安排.专业=课程分配.专业 and 课程安排.班级=课程分配.班级 and 课程安排.年级=课程分配.年级 and 课程安排.课程=课程分配.课程名称 and 课程安排.院系='"+department+"' and 课程安排.专业='"+major+"' and 课程安排.班级='"+class1+"' and 课程安排.年级='"+grade+"' and 课程安排.学期='"+term+"' and 上课时间='星期一' and 节次='4' ");
				re=pst.executeQuery();
				if (re.next()) 
				{
					out.println("<td style='background:blue;'><p>"+re.getString(1)+"</p><p>"+re.getString(2)+"</p><p>"+re.getString(3)+"</p></td>");
				}
				else
				{
			%>
			<td></td>
			<%
				}
			%>
			<%
				pst=con.prepareStatement("select 课程,上课地点,任课老师,节次,上课时间 from 课程安排,课程分配 where 课程安排.院系=课程分配.院系 and 课程安排.专业=课程分配.专业 and 课程安排.班级=课程分配.班级 and 课程安排.年级=课程分配.年级 and 课程安排.课程=课程分配.课程名称 and 课程安排.院系='"+department+"' and 课程安排.专业='"+major+"' and 课程安排.班级='"+class1+"' and 课程安排.年级='"+grade+"' and 课程安排.学期='"+term+"' and 上课时间='星期二' and 节次='4' ");
				re=pst.executeQuery();
				if (re.next()) 
				{
					out.println("<td style='background:blue;'><p>"+re.getString(1)+"</p><p>"+re.getString(2)+"</p><p>"+re.getString(3)+"</p></td>");
				}
				else
				{
			%>
			<td></td>
			<%
				}
			%>
			<%
				pst=con.prepareStatement("select 课程,上课地点,任课老师,节次,上课时间 from 课程安排,课程分配 where 课程安排.院系=课程分配.院系 and 课程安排.专业=课程分配.专业 and 课程安排.班级=课程分配.班级 and 课程安排.年级=课程分配.年级 and 课程安排.课程=课程分配.课程名称 and 课程安排.院系='"+department+"' and 课程安排.专业='"+major+"' and 课程安排.班级='"+class1+"' and 课程安排.年级='"+grade+"' and 课程安排.学期='"+term+"' and 上课时间='星期三' and 节次='4' ");
				re=pst.executeQuery();
				if (re.next()) 
				{
					out.println("<td style='background:blue;'><p>"+re.getString(1)+"</p><p>"+re.getString(2)+"</p><p>"+re.getString(3)+"</p></td>");
				}
				else
				{
			%>
			<td></td>
			<%
				}
			%>
			<%
				pst=con.prepareStatement("select 课程,上课地点,任课老师,节次,上课时间 from 课程安排,课程分配 where 课程安排.院系=课程分配.院系 and 课程安排.专业=课程分配.专业 and 课程安排.班级=课程分配.班级 and 课程安排.年级=课程分配.年级 and 课程安排.课程=课程分配.课程名称 and 课程安排.院系='"+department+"' and 课程安排.专业='"+major+"' and 课程安排.班级='"+class1+"' and 课程安排.年级='"+grade+"' and 课程安排.学期='"+term+"' and 上课时间='星期四' and 节次='4' ");
				re=pst.executeQuery();
				if (re.next()) 
				{
					out.println("<td style='background:blue;'><p>"+re.getString(1)+"</p><p>"+re.getString(2)+"</p><p>"+re.getString(3)+"</p></td>");
				}
				else
				{
			%>
			<td></td>
			<%
				}
			%>
			<%
				pst=con.prepareStatement("select 课程,上课地点,任课老师,节次,上课时间 from 课程安排,课程分配 where 课程安排.院系=课程分配.院系 and 课程安排.专业=课程分配.专业 and 课程安排.班级=课程分配.班级 and 课程安排.年级=课程分配.年级 and 课程安排.课程=课程分配.课程名称 and 课程安排.院系='"+department+"' and 课程安排.专业='"+major+"' and 课程安排.班级='"+class1+"' and 课程安排.年级='"+grade+"' and 课程安排.学期='"+term+"' and 上课时间='星期五' and 节次='4' ");
				re=pst.executeQuery();
				if (re.next()) 
				{
					out.println("<td style='background:blue;'><p>"+re.getString(1)+"</p><p>"+re.getString(2)+"</p><p>"+re.getString(3)+"</p></td>");
				}
				else
				{
			%>
			<td></td>
			<%
				}
			%>
		</tr>
	</table>
</div>
<%
}
%>
<form  method="post" action="assignmentadd.jsp">
	<table id="add">
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
			<option>2015届</option>
			<option>2016届</option>
			<option>2017届</option>
		</select>
	</td>
	</tr>
	
	<tr>
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
	</tr>
	
	<tr>
	<td><input type="submit" value="提交"></td>
	</tr>
	</table>
</form>
</body>
</html>
