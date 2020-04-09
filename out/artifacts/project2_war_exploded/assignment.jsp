<%@ page language="java" import="com.test" pageEncoding="utf-8"%>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="com.test" %>
<%@ include file="conn.jsp"%>

<html>
<head>
	<!-- Mobile Specific Meta -->
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<!-- Favicon-->
	<link rel="shortcut icon" href="img/fav.png">
	<!-- Author Meta -->
	<meta name="author" content="codepixer">
	<!-- Meta Description -->
	<meta name="description" content="">
	<!-- Meta Keyword -->
	<meta name="keywords" content="">
	<!-- meta character set -->
	<meta charset="UTF-8">
	<!-- Site Title -->
	<title>Educature Education</title>


	<link rel="stylesheet" href="css/linearicons.css">
	<link rel="stylesheet" href="css/font-awesome.min.css">
	<link rel="stylesheet" href="css/bootstrap.css">
	<link rel="stylesheet" href="css/magnific-popup.css">
	<link rel="stylesheet" href="css/nice-select.css">
	<link rel="stylesheet" href="css/animate.min.css">
	<link rel="stylesheet" href="css/owl.carousel.css">
	<link rel="stylesheet" href="css/main.css">
	<link rel="stylesheet" href="css/a.css">
</head>

<style type="text/css">

#n1
{
	width: 500px;
	height: 500px;
	position: relative;
	float: left;
	margin-right: 10px;
	margin-top: 50px;
	padding: 10px;
}
#n2
	{
		/*border:3px solid blue;*/
		width: 600px;
		position: relative;
		float: left;
		margin-right: 10px;
		padding: 10px;
		top: 30px;
	}
#add
{
	margin-top: 10px;
	background-color: rgb(55,189,199);
	font-size: 15px;
}


#add td
{
	padding: 10px;
}
h1
{
	position: relative;
	top: -20px;
}

.col
{
	width: 100px;
	
}
.col2
{
	width: 500px;
}
</style>
<style type="text/css">
@import url("a.css");
</style>
<body>
<header id="header">
		<div class="container">
			<div class="row align-items-center justify-content-between d-flex">
				<div id="logo">
					<a href="#"><img src="img/logo.png" alt="" title="" /></a>
				</div>
				<nav id="nav-menu-container">
					<ul class="nav-menu">
						<li><a href="index.jsp">主页</a></li>
						<li><a href="assignmentindex.jsp">开课查询</a></li>
						<li class="menu-active"><a href="assignment.jsp">课程分配</a></li>
						<li><a href="applycheck.jsp">查看申请</a></li>
						<li><a href="accountindex.jsp">账号管理</a></li>
						<li class="menu-has-children"><a href="">教务管理</a>
							<ul>
								<li><a href="classindex.jsp">班级管理</a></li>
								<li><a href="textindex.jsp">教材管理</a></li>
								<li><a href="courseindex.jsp">课程管理</a></li>
							</ul>
						</li>
						<li class="menu-has-children"><a href="contact.html"><%=test.name%>(<%=test.power%>)</a>
							<ul>
								<li><a href="quit.jsp">退出登录</a></li>
							</ul>
						</li>
					</ul>
				</nav>
			</div>
		</div>
	</header>
	

	<!-- Start Banner Area -->
	<section class="home-banner-area relative">
		<div class="container">
			<div class="row fullscreen d-flex align-items-center justify-content-center">
				<%
 request.setCharacterEncoding("utf-8");
 String grade=request.getParameter("grade");
 String grade1=request.getParameter("grade1");
 String class1=request.getParameter("class");
 String class2=request.getParameter("class1");
 String department1=request.getParameter("department1");
 String major1=request.getParameter("major1");
 String term=request.getParameter("term");
 String term1=request.getParameter("term1");

 PreparedStatement pst;
 ResultSet re;

 PreparedStatement pst1;
 ResultSet re1;

 PreparedStatement pst2;
 ResultSet re2;

 PreparedStatement pst3;
 ResultSet re3;

 if(request.getParameter("department")!=null)
 {
	 test.department=request.getParameter("department");
}

if(request.getParameter("major")!=null)
 {
     test.major=request.getParameter("major");
	 session.setAttribute("major",request.getParameter("major"));
}

if(request.getParameter("id1")!=null)
 {
     test.id=request.getParameter("id1");
	 session.setAttribute("id1",request.getParameter("id1"));
	 
}

if(request.getParameter("teacher")!=null)
 {
     test.teacher=request.getParameter("teacher");
	 session.setAttribute("teacher",request.getParameter("teacher"));
	 
}

String course1="a";



 String department=test.department;
 String major=test.major;
 String teacher=test.teacher;

%>

<!-- <h1>当前年份：<%=currenttime%></h1> -->


<div id="n1" style="position: relative; top: -20px;">
<h1>课程列表(<%=currenttime%>)</h1>
<table border="1" style="margin-top: 10px;color: white;font-weight: bold;">
	<tr id="head">
	<td>课程名称</td>
	<td>课程代码</td>
	<td>开课班级</td>
	<td></td>
	</tr>
	
	
	
		<%

			int page1=1;
			pst1=con.prepareStatement("select count(*) from 课程");
			re1=pst1.executeQuery();
			re1.next();
			int sum=re1.getInt(1)/5;
			if(request.getParameter("currentpage")!=null)
			{
				page1=Integer.valueOf(request.getParameter("currentpage"));
				
			}
			pst=con.prepareStatement("select * from (select top 5 * from (select top "+page1*5+" * from 课程 order by num asc )as temp_sum_student order by num desc ) temp_order order by num asc");
			re=pst.executeQuery();
			while(re.next())
			{
				out.println("<tr>");
				out.println("<td>"+re.getString(1)+"</td><td>"+re.getString(3)+"</td><td>"+re.getString(7)+"</td><td><a href='assignment.jsp?id1="+re.getString(3)+"'>课程安排</td>");
				out.println("</tr>");
			}
			
		%>
		
</table>
<table style="position: relative;left: 100px;">
<tr>
			<%
				if(page1>1)
				{
			%>
			<td style="font-weight: bold;"><a href="assignment.jsp?currentpage=<%=page1-1%>">上一页</a></td>
			<%
				}
				if(page1<=sum)
				{

		
			%>
			<td style="font-weight: bold;"><a href="assignment.jsp?currentpage=<%=page1+1%>">下一页</a></td>
			<%
				
				}
			%>

	</tr>
</table>
</div>


<%
	if(session.getAttribute("id1")!=null)
	{

%>
<div id="n2">
	<h1>课程安排</h1>
	<table id="add" border="1" >	
	<form  method="post" action="assignmentadd.jsp">
	<%
		int y=currenttime-1;
		
		pst=con.prepareStatement("select * from 课程 where 课程代码="+Integer.valueOf((String)session.getAttribute("id1")));
		re = pst.executeQuery();
		re.next();
	%>
		<tr>
			<td colspan="2"><%=y%>年<%=re.getString(1)%>上课老师</td>
		</tr>
<tr>
	<td colspan="2">
<div id="n3">
	<table border="1">
	
		
		
		<tr>
	
	<%
		
		pst1=con.prepareStatement("select distinct 任课老师 from 课程分配 where 课程名称='"+re.getString(1)+"' and 年份="+y);
		re1=pst1.executeQuery();
		while(re1.next())
		{
			
			out.println("<td>"+re1.getString(1)+"</td>");
			
		}
	%>
	</tr>
	</table>
	<tr>
	<td class="col">课程：</td>
	<td class="col2">
		
		<%
		
		pst=con.prepareStatement("select * from 课程 where 课程代码="+Integer.valueOf((String)session.getAttribute("id1")) );
		re = pst.executeQuery();
		while(re.next())
		{
			out.println("<input type='text' name='course' value='"+re.getString(1)+"'/ style='border:0px;background-color: rgb(55,189,199);' readonly='readonly'>");
			course1=re.getString(1);
		}
		
		%>
		
		
	</td>
	</tr>
	

	<tr>
	<td class="col">任课老师</td>
	<td class="col2">
	<select name="teacher">
		<%
			int num=0;
			int time=0;
			
			
			pst=con.prepareStatement("select 任课老师,sum(学时),SUM(人数) from 课程,课程分配,班级 where 年份="+currenttime+" and 课程.课程=课程分配.课程名称 and 班级.专业=课程分配.专业 and 班级.班级=课程分配.班级 group by 任课老师" );
			re = pst.executeQuery();
			//out.println("<option>"+teacher+"(已分配学时:"+time+")(已教人数:"+num+")</option>");
			pst2=con.prepareStatement("select distinct 账号 from 账号 where 账号 not in (select 任课老师 from 课程,课程分配,班级 where 年份="+currenttime+" and 课程.课程=课程分配.课程名称 and 班级.专业=课程分配.专业 and 班级.班级=课程分配.班级 group by 任课老师) and 权限='教师'");
			re2=pst2.executeQuery();
			
			while(re2.next())
			{
				out.println("<option value="+re2.getString(1)+" >"+re2.getString(1)+"(已分配周学时:0)(已教人数:0)</option>");
			}

			
			while(re.next())
			{
			
			pst1=con.prepareStatement("select count(*) from 课程分配 where 任课老师='"+re.getString(1)+"' and 年份="+currenttime+" and 课程名称='"+course1+"'");
			//out.println("select num(*) from 课程安排 where 任课老师='"+re.getString(1)+"' and 年份="+currenttime+" and 课程名称='"+course1+"'");
			re1=pst1.executeQuery();
			re1.next();
			if(re1.getInt(1)==0)
			{
			out.println("<option value="+re.getString(1)+" >"+re.getString(1)+"(已分配周学时:"+re.getInt(2)+")(已教人数:"+re.getInt(3)+")</option>");
			}
			else
			{
				
				out.println("<option value="+re.getString(1)+" disabled='disabled'>"+re.getString(1)+"(已分配该课程)</option>");
			}
			}
		%>
	</select>
	</td>
	</tr>


	
	<!-- <tr>
	<td>院系</td>
	<td>
		<select name="department" onchange="window.location=this.value">
			<%
				pst=con.prepareStatement("select distinct 院系 from 课程分配");
				re = pst.executeQuery();
				out.println("<option>"+department+"</option>");
				while(re.next())
				{
					out.println("<option value='assignment.jsp?department="+re.getString(1)+"'>"+re.getString(1)+"</option>");
				}
			%>

		</select>
	</td>
	</tr>


	<tr>
	<td>专业：</td>
	<td>
		<select name="major" onchange="window.location=this.value">
			<%
				pst=con.prepareStatement("select distinct 专业 from 课程分配 where 院系='"+department+"'");

				re = pst.executeQuery();
				out.println("<option>"+major+"</option>");
				while(re.next())
				{
					out.println("<option value='assignment.jsp?major="+re.getString(1)+"'>"+re.getString(1)+"</option>");
				}
			%>

		</select>
	</td> -->
	
	
	</tr>
	
	<tr>
	<td class="col">班级：</td>
	<td class="col2">
		<%
				
				pst=con.prepareStatement("select * from 课程 where 课程代码="+Integer.valueOf((String)session.getAttribute("id1")) );
				re = pst.executeQuery();
				re.next();
				String[] a=re.getString(7).split(",");

				pst=con.prepareStatement("select * from 班级 where 年级="+a[0]+" and 专业='"+a[1]+"'" );
				re = pst.executeQuery();

				

				
				while(re.next())
				{
					int p=0;
					pst2=con.prepareStatement("select * from 课程分配" );
					re2 = pst2.executeQuery();
					while(re2.next())
					{
						if(re2.getString(2).equals(re.getString(1))&&re2.getString(5).equals(re.getString(2))&&re2.getString(3).equals(course1)&&re2.getString(8).trim().equals(re.getString(5).trim())&&re2.getInt(9)==currenttime)
						p=1;
						//out.println(re2.getString(3));

					}
					if(p==1)
					{
						pst3=con.prepareStatement("select 任课老师 from 课程分配 where 专业='"+re.getString(1)+"' and 班级='"+re.getString(2)+"' and 年级='"+re.getString(5)+"'");
						re3=pst3.executeQuery();
						re3.next();
						out.println("<lable>"+re.getString(5)+re.getString(1)+re.getString(2)+"</lable><input type='checkbox' name='class' value='"+re.getString(5)+","+re.getString(1)+","+re.getString(2)+"' disabled='disabled'><lable>（已分配该课程）</lable><br>");
						p=0;
					}
					else
					out.println("<lable>"+re.getString(5)+re.getString(1)+re.getString(2)+"</lable><input type='checkbox' name='class' value='"+re.getString(5)+","+re.getString(1)+","+re.getString(2)+","+course1+"' ><br>");
					
				
					
				}
				
			%>
	</td>
	</tr>
	
	
	
	<tr>
	<td class="col">教材：</td>
	<td class="col2">
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


<%--	<tr>--%>
<%--	<td class="col">年级：</td>--%>
<%--	<td>--%>
<%--		<select name="grade">--%>
<%--			<%--%>
<%--				for(int i=currenttime;i>currenttime-4;i--)--%>
<%--				{--%>
<%--					out.println("<option>"+i+"</option>");--%>
<%--				}--%>
<%--			%>--%>
<%--		</select>--%>
<%--	</td>--%>
<%--	</tr>--%>
	
	
	<tr>
	<td colspan="2"><input type="submit" value="提交"></td>
	</tr>	
</form>

	
</div>
	</td>
</tr>
</table>
</div>
<%
	}
%>





			</div>
		</div>
		
	</section>
	<!-- End Banner Area -->


	


	

	









	

	<script src="js/vendor/jquery-2.2.4.min.js"></script>
	
	<script src="js/vendor/bootstrap.min.js"></script>
	
	<script src="js/easing.min.js"></script>
	<script src="js/hoverIntent.js"></script>
	<script src="js/superfish.min.js"></script>
	<script src="js/jquery.ajaxchimp.min.js"></script>
	<script src="js/jquery.magnific-popup.min.js"></script>
	<script src="js/owl.carousel.min.js"></script>
	<script src="js/owl-carousel-thumb.min.js"></script>
	<script src="js/jquery.sticky.js"></script>
	<script src="js/jquery.nice-select.min.js"></script>
	<script src="js/parallax.min.js"></script>
	<script src="js/waypoints.min.js"></script>
	<script src="js/wow.min.js"></script>
	<script src="js/jquery.counterup.min.js"></script>
	<script src="js/mail-script.js"></script>
	<script src="js/main.js"></script>


</body>
</html>
