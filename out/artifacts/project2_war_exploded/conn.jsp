<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="java.sql.*" %>
<html>
  <head>
    
  </head>
  
  <body>
    <%
   String driverName = "com.microsoft.sqlserver.jdbc.SQLServerDriver";   //加载JDBC驱动  
   String dbURL = "jdbc:sqlserver://localhost:1433; DatabaseName=XXQ";  //自行更改数据库名
   String userName = "sa";    
   String userPwd = "123";  //自行更改密码
   Connection con;  
   
   Class.forName(driverName);  
   con = DriverManager.getConnection(dbURL, userName, userPwd);
   int currenttime = 2020;

       
     %>
  </body>
</html>