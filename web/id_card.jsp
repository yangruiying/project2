<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title></title>
</head>
<body>
 <%
 		request.setCharacterEncoding("utf-8");
   		String a =request.getParameter("file");
   		out.println(a);
   %>      
</body>
</html>