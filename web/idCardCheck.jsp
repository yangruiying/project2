<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page language="java" import="java.net.URLDecoder" pageEncoding="utf-8"%>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="com.test" %>
<%@ include file="conn.jsp"%>
<%
    request.setCharacterEncoding("utf-8");
    String address = (String) request.getParameter("address");
    String birthday = (String)  request.getParameter("birthday");
    String gender = (String) request.getParameter("gender");
    String id_card_number = (String) request.getParameter("id_card_number");
    String name = (String) request.getParameter("name");
    String race = (String) request.getParameter("race");
    String password = (String) request.getParameter("password");
    PreparedStatement pst=con.prepareStatement("insert into 账号(账号,密码,权限,性别,民族,身份证号码,地址,生日) values(?,?,?,?,?,?,?,?)");
    pst.setString(1,name);
    pst.setString(2,password);
    pst.setString(3,"教师");
    pst.setString(4,gender);
    pst.setString(5,race);
    pst.setString(6,id_card_number);
    pst.setString(7,address);
    pst.setString(8,birthday);
    pst.executeUpdate();
    out.println(name);
%>
<html>
<head>
    <title>Title</title>
</head>
<body>

</body>
<script type="text/javascript">
    window.onload=function()
    {
        alert("注册成功");
        window.location.href="login.html";
    }
</script>
</html>
