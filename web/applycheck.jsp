<%@ page language="java" import="com.test" pageEncoding="utf-8"%>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ include file="conn.jsp"%>
<html>
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
<style type="text/css">
	
	.a
	{
		border:3px solid blue;
		position:relative;
		float: left;
		width: 300px;
		height: 300px;
		padding: 5px;
		margin-right: 5px;
		margin-top: 10px;
	}

	.a a
	{
		left: 0px;
		top: 0px;
	}
	#agree1
	{
		color: green;
	}

	#refuse1
	{
		color: red;
	}
	td
	{
		width: 200px;
	}
</style>

<%
	out.println("<script type='text/javascript'> function agree(){ if(confirm('确认同意该条申请？')) {");
	out.println("return true}; else return false; }");
	out.println("function refuse() { if(confirm('确认拒绝该条申请？')) return true;else return false;} </script>");
	String msg="assignmentindex.jsp";
	String table="课程分配";
	PreparedStatement pst = con.prepareStatement("select distinct 课程 from 课程");
	ResultSet re=pst.executeQuery();

	PreparedStatement pst1;
	ResultSet re1;

	PreparedStatement pst2;
	ResultSet re2;

%>
<script type='text/javascript'>
	function agree()
	{
		if(confirm('确认同意该条申请？'))
			return true;
		else
			return false;
	}

	function refuse()
	{
		if(confirm('确认拒绝该条申请？'))
			return true;
		else
			return false;
	}
</script>
<body>
	
	<header id="header">
		<div class="container">
			<div class="row align-items-center justify-content-between d-flex">
				<div id="logo">
					<a href="index.html"><img src="img/logo.png" alt="" title="" /></a>
				</div>
				<nav id="nav-menu-container">
					<ul class="nav-menu">
						<li><a href="index.jsp">主页</a></li>
						<li><a href="assignmentindex.jsp">开课查询</a></li>
						<li><a href="assignment.jsp">课程分配</a></li>
						<li class="menu-active"><a href="applycheck.jsp">课程申请</a></li>
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

<section class="home-banner-area relative">
		<div class="container">
			<div class="row fullscreen d-flex align-items-center justify-content-center">


		<header>
		<div class="container">
			<div class="row align-items-center justify-content-between d-flex">
				
				<nav id="nav-menu-container" >
					<ul class="nav-menu" style="white-space:normal;width:1000px;line-height:50px;">
					<%
					while(re.next())
						{
					pst1 = con.prepareStatement("select * from 申请 where 课程名称='"+re.getString(1)+"' and 状态='申请中'");
					re1=pst1.executeQuery();

					%>
						<li class="menu-has-children" ><a href="" style="font-size: 30px;  width: 1000px"><%=re.getString(1)%>&nbsp&nbsp</a>
							<ul>
							<li>
								<table border="1px">
									<tr>
										<td>教师</td>
										<td>已排学时</td>
										<td>已排学生</td>
										<td></td>
										<td></td>
									</tr>

								<%
									while(re1.next())
									{
									//out.println("<li style='width:500px;'>");
									//out.println("<table>");
			pst2 = con.prepareStatement("select sum(学时),SUM(人数) from 课程,课程分配,班级 where  课程.课程=课程分配.课程名称 and 班级.专业=课程分配.专业 and 班级.班级=课程分配.班级 and 任课老师='"+re1.getString(2)+"'");
			re2=pst2.executeQuery();
			re2.next();
			int time,num;
			if(re2.getString(1)==null)
			{
				time=0;
			}
			else
			{
				time=re2.getInt(1);
			}

			if(re2.getString(2)==null)
			{
				num=0;
			}
			else
			{
				num=re2.getInt(2);
			}
			out.println("<tr>");
			//out.println("<td>"+re1.getString(2)+"</td><td style='width:300px;'>"+time+"周学时</td><td>"+num+"人</td><td><a id='agree' href='agree.jsp?id1="+re1.getString(5)+"&course="+re.getString(1)+"&teacher="+re1.getString(2)+"' onclick='return agree();'/>同意</a></td><td><a id='refuse' href='refuse.jsp?id1="+re1.getString(5)+"&course="+re.getString(1)+"&teacher="+re1.getString(2)+"' onclick='return refuse();' onclick='return refuse();'/>拒绝</td>");
			out.println("<td>"+re1.getString(2)+"</td><td style='width:300px;'>"+time+"周学时</td><td>"+num+"人</td><td><form action='agree.jsp' method='post'><input style='display: none' name='id1' value="+re1.getString(5)+"><input style='display: none' name='course' value="+re.getString(1)+"><input style='display: none' name='teacher' value="+re1.getString(2)+"><input  id='agree1' type='submit' value='同意' onclick='return agree();' /></form></td><td><form action='refuse.jsp' method='post'><input style='display: none' name='id1' value="+re1.getString(5)+"><input style='display: none' name='course' value="+re.getString(1)+"><input style='display: none' name='teacher' value="+re1.getString(2)+"><input  id='refuse1' type='submit' value='拒绝' onclick='return refuse();' /></form></td>");
			out.println("</tr>");
			//out.println("</table>");
			//out.println("</li>");
			}
								%>
								<!-- <li><a href="elements.html">教材管理</a></li>
								<li><a href="elements.html">课程管理</a></li> -->
								</table>
							</li>
							</ul>
						</li>
						
					<%
						}
					%>
					</ul>
				</nav>
			</div>
		</div>
	</header>


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
