<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="java.sql.*" %>
<%@ include file="conn.jsp"%>
<html>
  <head>

  </head>
  
  <body>
    <%

    request.setCharacterEncoding("utf-8");
   String id=request.getParameter("id");
   String password=request.getParameter("password");
   String sql="insert into 课程分配 values ('?','?','?')";
   String sql2="select 权限 from 登录 where 账号=?";
   PreparedStatement stmt = con.prepareStatement(sql);
   stmt.setString(1,id);
   stmt.setString(2,password);
   ResultSet rs=stmt.executeQuery();

   PreparedStatement st = con.prepareStatement(sql2);
   st.setString(1,id);
   ResultSet rs2=st.executeQuery();
   rs.next();
   if(rs.getInt(1)==1)
   {
      rs2.next();
      String power=rs2.getString(1);
      session.setAttribute("power",power);
   %>
    <jsp:forward page="index.jsp"/>
  <%
   }
     %>
  
  </body>
</html>