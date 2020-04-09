<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="java.sql.*" %>
<%@ include file="conn.jsp"%>
<html>
<style type="text/css">
 @import url("a.css");
</style>
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

	
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/themify-icons/0.1.2/css/themify-icons.css">
	<link rel="stylesheet" href="css/linearicons.css">
	<link rel="stylesheet" href="css/font-awesome.min.css">
	<link rel="stylesheet" href="css/bootstrap.css">
	<link rel="stylesheet" href="css/magnific-popup.css">
	<link rel="stylesheet" href="css/nice-select.css">
	<link rel="stylesheet" href="css/animate.min.css">
	<link rel="stylesheet" href="css/owl.carousel.css">
	<link rel="stylesheet" href="css/main.css">
	<link rel="stylesheet" href="a.css">
</head>
<%
	int time=currenttime;
	if(request.getParameter("grade")!=null)
	time=Integer.valueOf(request.getParameter("grade"));
%>
<body>
<header id="header">
		<div class="container">
			<div class="row align-items-center justify-content-between d-flex">
				<div id="logo">
					<a href="index.jsp"><img src="img/logo.png" alt="" title="" /></a>
				</div>
				<nav id="nav-menu-container">
					<ul class="nav-menu">
						<li><a href="teacherindex.jsp">主页</a></li>
						<li><a href="applyindex.jsp">课程申请</a></li>
						<li class="menu-active"><a href="scheduleindex.jsp">任务查询</a></li>
						<li class="menu-has-children"><a href=""><%=session.getAttribute("name")%>(<%=session.getAttribute("power")%>)</a>
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
				<div class="banner-content col-lg-8 col-md-12">


<div id="a">
	<form>
		<table>
		<tr>
		<td style="width: 100px;">
			<select name="grade">
			<%
				for(int i=currenttime;i>currenttime-4;i--)
				{
					out.println("<option>"+i+"</option>");
				}
			%>
		</select>
		</td>
		<td><input type="submit" value="查询"></td>
		</tr>
		
		</table>
	</form>
	<table border="1">
	<tr id="head">
		
		<td>专业</td>
		<td>班级</td>
		<td>课程</td>
		<td>年份</td>
		<td>年级</td>
	</tr>
<%
		PreparedStatement pst = con.prepareStatement("select * from 课程分配 where 任课老师='"+session.getAttribute("name")+"' and 年份="+time);
		ResultSet re=pst.executeQuery();
		String msg="scheduleindex.jsp";
		String table="课程安排";
		while(re.next())
		{
			out.println("<tr>");
			out.println("<td>"+re.getString(2)+"</td><td>"+re.getString(5)+"</td><td>"+re.getString(3)+"</td><td>"+re.getString(9)+"</td><td>"+re.getString(8)+"</td>");
			out.println("</tr>");
		}
%>
	<!-- <tr>
		<td colspan="5"><a href="schedule.jsp">添加课程任务</a></td>
	</tr> -->
	
	</table>

</div>
</div>
			</div>
		</div>
		
	</section>

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
