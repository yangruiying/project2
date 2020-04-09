<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="java.sql.*" %>
<%@ include file="conn.jsp"%>
<!DOCTYPE html>
<html lang="zxx" class="no-js">
<style type="text/css">
	@import url(a.css);
</style>
<%
	PreparedStatement pst1;
	ResultSet re1;
	PreparedStatement pst;
	ResultSet re;

%>
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
<body>
	
	<header id="header">
		<div class="container">
			<div class="row align-items-center justify-content-between d-flex">
				<div id="logo">
					<a href="#"><img src="img/logo.png" alt="" title="" /></a>
				</div>
				<nav id="nav-menu-container">
					<ul class="nav-menu">
						<li><a href="teacherindex.jsp">主页</a></li>
						<li class="menu-active"><a href="applyindex.jsp">课程申请</a></li>
						<li><a href="scheduleindex.jsp">任务查询</a></li>
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
<form  method="post" >
	<table border="1">
	<tr id="head">
		
		<td>课程名称</td>
		<td>任课代码</td>
		<td>状态</td>
		<td></td>
	</tr>
		<form  method='get' action='login.html' ><input type='submit' style="display: none"></form>
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
		String name = (String)session.getAttribute("name");
		pst=con.prepareStatement("select * from (select top 5 * from (select top "+page1*5+" * from 申请 where 任课老师='"+name+"' order by num asc )as temp_sum_student order by num desc ) temp_order order by "+"'状态' desc ");
		re=pst.executeQuery();
		String msg="applyindex.jsp";
		String table="申请";
		while(re.next())
		{
			out.println("<tr>");
			if(re.getString(4).trim().equals("同意"))
			out.println("<td>"+re.getString(1)+"</td><td>"+re.getString(5)+"</td><td style='color:green;'>"+re.getString(4)+"</td><td></td>");
			else if(re.getString(4).trim().equals("拒绝"))
			out.println("<td>"+re.getString(1)+"</td><td>"+re.getString(5)+"</td><td style='color:red;'>"+re.getString(4)+"</td><td></td>");
			else
			{
				//out.println("<td>"+re.getString(1)+"</td><td>"+re.getString(5)+"</td><td>"+re.getString(4)+"</td><td><a href='delete.jsp?id="+re.getString(3)+"&msg="+msg+"&table="+table+"' onclick='return check();'/>取消申请</td>");
				out.println("<td>"+re.getString(1)+"</td><td>"+re.getString(5)+"</td><td>"+re.getString(4)+"</td><td><form action='delete.jsp' method='post'><input style='display: none' name='id' value="+re.getString(3)+"><input style='display: none' name='msg' value="+msg+"><input style='display: none' name='table' value="+table+"><input type='submit' value='取消申请' onclick='return check();' ></form></td>");

			}


			out.println("</tr>");

		}
	//out.println("<form method='post' action='index.jsp' ><input type='text'><input type='submit'></form>");
%>





		
	</table>

	<table>
		<tr>
		<td><a href="apply.jsp">申请课程</a></td>
			<%
				if(page1>1)
				{
			%>
			<td><a href="applyindex.jsp?currentpage=<%=page1-1%>">上一页</a></td>
			<%
				}
				if(page1<sum)
				{

		
			%>
			<td><a href="applyindex.jsp?currentpage=<%=page1+1%>">下一页</a></td>
			<%
				}
			%>
	</tr>
	</table>
</form>
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
	<script type="text/javascript">
		function check()
		{
			if(confirm("确认删除该条信息？"))
				return true;
			else
				return false;
		}
	</script>
</body>
</html>
