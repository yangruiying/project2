<%@ page language="java" import="com.test" pageEncoding="utf-8"%>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
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
<style type="text/css">
	@import url(a.css);
</style>
<script type="text/javascript">
	function check()
	{
		if(confirm("确认删除该条信息？"))
			return true;
		else
			return false;
	}

        //第五种方法
        var idTmr;
        function  getExplorer() {
            var explorer = window.navigator.userAgent ;
            //ie
            if (explorer.indexOf("MSIE") >= 0) {
                return 'ie';
            }
            //firefox
            else if (explorer.indexOf("Firefox") >= 0) {
                return 'Firefox';
            }
            //Chrome
            else if(explorer.indexOf("Chrome") >= 0){
                return 'Chrome';
            }
            //Opera
            else if(explorer.indexOf("Opera") >= 0){
                return 'Opera';
            }
            //Safari
            else if(explorer.indexOf("Safari") >= 0){
                return 'Safari';
            }
        }
        function method5(tableid) {
            if(getExplorer()=='ie')
            {
                var curTbl = document.getElementById(tableid);
                var oXL = new ActiveXObject("Excel.Application");
                var oWB = oXL.Workbooks.Add();
                var xlsheet = oWB.Worksheets(1);
                var sel = document.body.createTextRange();
                sel.moveToElementText(curTbl);
                sel.select();
                sel.execCommand("Copy");
                xlsheet.Paste();
                oXL.Visible = true;

                try {
                    var fname = oXL.Application.GetSaveAsFilename("Excel.xls", "Excel Spreadsheets (*.xls), *.xls");
                } catch (e) {
                    print("Nested catch caught " + e);
                } finally {
                    oWB.SaveAs(fname);
                    oWB.Close(savechanges = false);
                    oXL.Quit();
                    oXL = null;
                    idTmr = window.setInterval("Cleanup();", 1);
                }

            }
            else
            {
                tableToExcel(tableid)
            }
        }
        function Cleanup() {
            window.clearInterval(idTmr);
            CollectGarbage();
        }
        var tableToExcel = (function() {
            var uri = 'data:application/vnd.ms-excel;base64,',
                    template = '<html><head><meta charset="UTF-8"></head><body><table>{table}</table></body></html>',
                    base64 = function(s) { return window.btoa(unescape(encodeURIComponent(s))) },
                    format = function(s, c) {
                        return s.replace(/{(\w+)}/g,
                                function(m, p) { return c[p]; }) }
            return function(table, name) {
                if (!table.nodeType) table = document.getElementById(table)
                var ctx = {worksheet: name || 'Worksheet', table: table.innerHTML}
                window.location.href = uri + base64(format(template, ctx))
            }
        })()









    function saveCode(tableid, title) {
        var winname;
        try {
            if (navigator.userAgent.indexOf("MSIE") > 0)         //IE浏览器
            {
                var strHTML = $("#" + tableid).parent().html();
                //alert("IE浏览器");
                winname = window.open("ToExcel", "_blank", 'top=10000');

                winname.document.open('text/html', 'replace');
                winname.document.write("<style>");
                winname.document.write("table{border:solid 1px #000;text-align:center;border-collapse:collapse; border-spacing:0;}");
                winname.document.write("table td{border:solid 1px #000;text-align:center;}");
                winname.document.write("table th{border:solid 1px #000;text-align:center;}");
                winname.document.write("</style>");
                winname.document.write(strHTML);
                winname.document.execCommand('SaveAs', '', title + '.xls');
                document.execCommand("ClearAuthenticationCache");
                winname.close();
            }
            else if (isFirefox = navigator.userAgent.indexOf("Firefox") > 0)       //Firefox
            {
                //alert("Firefox");
                var str = getTblDataByFirefox(tableid, this);
                //支持中文
                var uri = 'data:text/csv;charset=utf-8,\ufeff' + encodeURIComponent(str);
                var downloadLink = document.createElement("a");
                downloadLink.href = uri;
                downloadLink.download = title + ".csv";

                document.body.appendChild(downloadLink);
                downloadLink.click();
                document.body.removeChild(downloadLink);

            }
            else       //Google Chrome
            {
                //alert("Google Chrome等浏览器");
                var str = getTblData(tableid, this);

                //支持中文
                var uri = 'data:text/csv;charset=utf-8,\ufeff' + encodeURIComponent(str);

                var downloadLink = document.createElement("a");
                downloadLink.href = uri;
                downloadLink.download = title + ".csv";

                document.body.appendChild(downloadLink);
                downloadLink.click();
                document.body.removeChild(downloadLink);
            }
        } catch (e) {
            alert(e.Message);
            return false;
        }
        return false;
    }



    function getTblData(inTbl, inWindow) {

        var rows = 0;
        var tblDocument = document;

        tblDocument = eval(inWindow).document;
        var curTbl = tblDocument.getElementById(inTbl);
        var outStr = "";
        if (curTbl != null) {
            for (var j = 0; j < curTbl.rows.length; j++) {
                for (var i = 0; i < curTbl.rows[j].cells.length; i++) {

                    if (i == 0 && rows > 0) {
                        outStr += ",";
                        rows -= 1;
                    }

                    outStr +=curTbl.rows[j].cells[i].innerText + ",";
                    if (curTbl.rows[j].cells[i].colSpan > 1) {
                        for (var k = 0; k < curTbl.rows[j].cells[i].colSpan - 1; k++) {
                            outStr += ",";
                        }
                    }
                    if (i == 0) {
                        if (rows == 0 && curTbl.rows[j].cells[i].rowSpan > 1) {
                            rows = curTbl.rows[j].cells[i].rowSpan - 1;
                        }
                    }
                }
                outStr += "\r\n";//换行
            }
        }

        else {
            outStr = null;
            alert(allPage.noData);
        }
        return outStr;
    }

</script>
<%
	PreparedStatement pst1;
	ResultSet re1;
	PreparedStatement pst;
	ResultSet re;

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
						<li><a href="index.jsp">主页</a></li>
						<li class="menu-active"><a href="assignmentindex.jsp">开课查询</a></li>
						<li><a href="assignment.jsp">课程分配</a></li>
						<li><a href="applycheck.jsp">查看申请</a></li>
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
	<table border="1">
		<tr>
			<td><button type="button" onclick="saveCode('tableExce2', 'statistics')" >导出Excel</button></td>
			<td><form action="util/src/bargraph.html"><input type="submit" value="查看数据统计" style="margin-top: 3px"></form></td>
		</tr>
	</table>


<form  method="post" >
	<table border="1">
	<tr id="head">
		
		<td>专业</td>
		<td>课程名称</td>
		<td>任课老师</td>
		<td>班级</td>
		<td>人数</td>
		<td>教材名称</td>
		<td>年级</td>
		<td>年份</td>
		<td>
			
				<select onchange="window.location=this.value;">
					<%
						pst1=con.prepareStatement("select distinct 年份 from 课程分配");
						re1=pst1.executeQuery();
						while(re1.next())
						{
							out.println("<option value='assignmentindex.jsp?time="+re1.getInt(1)+"'>"+re1.getInt(1)+"</option>");
						}
					%>
				</select>
			
		</td>
	</tr>
<%
			int time=currenttime;
			int page1=1;
			if(request.getParameter("time")!=null)
			{
				session.setAttribute("time",request.getParameter("time"));
				time=Integer.valueOf((String)session.getAttribute("time"));
			}
			if(session.getAttribute("time")!=null)
			{
				time=Integer.valueOf((String)session.getAttribute("time"));
			}
			if(request.getAttribute("time")!=null)
			{
				pst1=con.prepareStatement("select count(*) from 课程分配 where 年份="+time);
			}
			else
			{
				pst1=con.prepareStatement("select count(*) from 课程分配");
			}
			re1=pst1.executeQuery();
			re1.next();
			int sum=re1.getInt(1)/5;

			if(request.getParameter("currentpage")!=null)
			{
				page1=Integer.valueOf(request.getParameter("currentpage"));
				
			}
		if(session.getAttribute("time")!=null)
		    pst = con.prepareStatement("select * from (select top 5 * from (select top "+page1*5+" * from 课程分配 where 年份="+time+" order by num asc )as temp_sum_student order by num desc ) temp_order order by num asc");
		else
		pst = con.prepareStatement("select * from (select top 5 * from (select top "+page1*5+" * from 课程分配 order by num asc )as temp_sum_student order by num desc ) temp_order order by num asc");
		re=pst.executeQuery();
		String msg="assignmentindex.jsp";
		String table="课程分配";
		//out.println("select * from (select top 5 * from (select top "+page1*5+" * from 课程分配 order by num asc )as temp_sum_student order by num desc ) temp_order order by num asc");
		while(re.next())
		{
			pst1=con.prepareStatement("select 人数 from 班级 where 专业='"+re.getString(2)+"' and 班级='"+re.getString(5)+"' and 年级='"+re.getString(8)+"'");
			re1=pst1.executeQuery();
			re1.next();
			out.println("<tr>");
			out.println("<td>"+re.getString(2)+"</td><td>"+re.getString(3)+"</td><td>"+re.getString(4)+"</td><td>"+re.getString(5)+"</td><td>"+re1.getString(1)+"</td><td>"+re.getString(6)+"</td><td>"+re.getString(8)+"</td><td>"+re.getString(9)+"</td><td><a href='delete.jsp?id="+re.getString(7)+"&msg="+msg+"&table="+table+"' onclick='return check();'/>删除</td>");
			out.println("</tr>");
		}
%>
	
	
	</table>

	<tr>
			<td></td>
			<td></td>
			<%
				if(page1>1)
				{
			%>
			<td><a href="assignmentindex.jsp?currentpage=<%=page1-1%>">上一页</a></td>
			<%
				}
				if(page1<sum)
				{

		
			%>
			<td><a href="assignmentindex.jsp?currentpage=<%=page1+1%>">下一页</a></td>
			<%
				}
			%>
		</tr>
</form>
</div>
	</div>
			</div>
		</div>
		
	</section>

	
	<div >

	</div>

	<table id="tableExcel" width="100%" border="1" cellspacing="0" cellpadding="0" style="display: none;">
    <tr id="head">
		
		<td>专业</td>
		<td>课程名称</td>
		<td>任课老师</td>
		<td>班级</td>
		<td>人数</td>
		<td>教材名称</td>
		<td>年级</td>
		<td>年份</td>
		<td>
			
				<select onchange="window.location=this.value;">
					<%
						pst1=con.prepareStatement("select distinct 年份 from 课程分配");
						re1=pst1.executeQuery();
						while(re1.next())
						{
							out.println("<option value='assignmentindex.jsp?time="+re1.getInt(1)+"'>"+re1.getInt(1)+"</option>");
						}
					%>
				</select>
			
		</td>
	</tr>
<%
			
		
			
		
		pst = con.prepareStatement("select * from 课程分配,班级 where 课程分配.专业=班级.专业 and 课程分配.班级=班级.班级 and 课程分配.年级=班级.年级");
		re=pst.executeQuery();
		
		while(re.next())
		{
			out.println("<tr>");
			out.println("<td>"+re.getString(2)+"</td><td>"+re.getString(3)+"</td><td>"+re.getString(4)+"</td><td>"+re.getString(5)+"</td><td>"+re.getString(12)+"</td><td>"+re.getString(6)+"</td><td>"+re.getString(8)+"</td><td>"+re.getString(9)+"</td>");
			out.println("</tr>");
		}
%>
</table>
    <div style="display: none">
    <table id="tableExce2">
        <tr>
            <td>name</td>
            <td>type</td>
            <td>value</td>
            <td>date</td>
        </tr>
        <%
            pst = con.prepareStatement("select 任课老师,年份,COUNT(人数) from (select 任课老师,人数,年份 from 课程分配,班级) a  GROUP BY 年份,任课老师");
            re=pst.executeQuery();
            while(re.next()) {
                out.println("<tr>");
                out.println("<td>" + re.getString(1) + "</td><td>教师</td><td>" + re.getString(3) + "</td><td>" + re.getString(2) + "</td>");
            }
            out.println("</tr>");
        %>
    </table>
    </div>
</div>

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
