<%@ page language="java" import="com.test" pageEncoding="utf-8"%>
<%@ page import="java.net.URLDecoder" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
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
</head>
<%
	PreparedStatement pst;
	ResultSet re;
	if(request.getParameter("course")!=null)
	{
		pst=con.prepareStatement("select 课程,课程代码 from 课程 where 课程 like '%"+request.getParameter("course")+"%'");
	}
	else
	{
		pst=con.prepareStatement("select 课程,课程代码 from 课程");
	}
	
	re=pst.executeQuery();
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
						<li class="menu-active"><a href="index.jsp">主页</a></li>
						<li><a href="assignmentindex.jsp">开课查询</a></li>
						<li><a href="assignment.jsp">课程分配</a></li>
						<li><a href="applycheck.jsp">课程申请</a></li>
						<li><a href="accountindex.jsp">账号管理</a></li>
						<li class="menu-has-children"><a href="">教务管理</a>
							<ul>
								<li><a href="classindex.jsp">班级管理</a></li>
								<li><a href="textindex.jsp">教材管理</a></li>
								<li><a href="courseindex.jsp">课程管理</a></li>
							</ul>
						</li>
						<li class="menu-has-children"><a href=""><%=test.name%>(<%=test.power%>)</a>
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
					<h1 class="wow fadeIn" data-wow-duration="4s">欢迎使用开课任务管理系统 <br> <h3>欢迎您：<%=session.getAttribute("name")%>(<%=session.getAttribute("power")%>)</h3></h1>
					

					<div class="input-wrap">
						<form action="index.jsp" class="form-box d-flex justify-content-between">
							<input type="text" placeholder="搜索课程" class="form-control" name="course">
							<button type="submit" class="btn search-btn">课程搜索</button>
						</form>
					</div>
					<h4 class="text-white">课程选择</h4>

					<div class="courses pt-20">
					<%
						double i=0.3;
						while(re.next())
						{
							i+=0.3;
					%>
						<a href="assignment.jsp?id1=<%=re.getString(2)%>" data-wow-duration="1s" data-wow-delay="<%=i%>s" class="primary-btn transparent mr-10 mb-10 wow fadeInDown"><%=re.getString(1)%></a>
					<%
						}
					%>

						
					</div>
				</div>
			</div>
		</div>
		<%
            // 获得当前路径以及"直接父路径"的所有Cookie对象,如果没有任何Cookie的话,则返回null
            Cookie[] cookies = request.getCookies();

            // 遍历数组,获得具体的Cookie
            if(cookies == null) {
                System.out.println("没有Cookie信息");
            } else {
                for(int j=0; j<cookies.length; j++) {
                    // 获得具体的Cookie
                    Cookie cookie = cookies[j];
                    // 获得Cookie的名称
                    String name = cookie.getName();
                    String value = URLDecoder.decode(cookie.getValue(), "UTF-8");
                    //System.out.println("Cookie名:"+name+"   Cookie值:"+value+"123456");
                }
            }
        %>
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