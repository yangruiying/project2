<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="java.sql.*" %>
<%@ include file="conn.jsp"%>
<!DOCTYPE html>
<html lang="zxx" class="no-js">
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
	@import url(a.css);
</style>


<%
	PreparedStatement pst;
	PreparedStatement pst1;
	ResultSet re;
	ResultSet re1;
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


<form  method="post" action="applyadd.jsp">

	

	</table>

	<div id="n1">
<h1>课程列表</h1>
<table border="1">
	<tr>
	<td>课程名称</td>
	<td>课程代码</td>
	<td>学时</td>
	<td>班级</td>
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
			//pst=con.prepareStatement("select * from 课程");
			re=pst.executeQuery();
			while(re.next())
			{
				out.println("<tr>");
				//out.println("<td>"+re.getString(1)+"</td><td>"+re.getString(3)+"</td><td>"+re.getString(6)+"</td><td>"+re.getString(7)+"</td><td><a href='applyadd.jsp?id1="+re.getString(3)+"&name="+session.getAttribute("name")+"&course="+re.getString(1)+"'>课程申请</td>");
				out.println("<td>"+re.getString(1)+"</td><td>"+re.getString(3)+"</td><td>"+re.getString(6)+"</td><td>"+re.getString(7)+"</td><td><form action='applyadd.jsp' method='post'><input style='display: none' name='id1' value="+re.getString(3)+"><input style='display: none' name='name' value="+session.getAttribute("name")+"><input style='display: none' name='course' value="+re.getString(1)+"><input type='submit' value='课程申请'></form></td>");

				out.println("</tr>");
			}
	
		%>

</table>
<table>
	<tr>
			<td></td>
			<td></td>
			<td></td>
			<%
				if(page1>1)
				{
			%>
			<td><a href="apply.jsp?currentpage=<%=page1-1%>">上一页</a></td>
			<%
				}
				if(page1<=sum)
				{
			%>
			<td><a href="apply.jsp?currentpage=<%=page1+1%>">下一页</a></td>
			<%
				}
			%>
		</tr>
</table>
</div>
</form>
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
