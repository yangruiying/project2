<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="java.sql.*" %>
<%@ include file="conn.jsp"%>
<html>
  <head>

  </head>
  
  <body>
  <table>
   <tr>
    <td>账号</td>
    <td>密码</td>
    <td>权限</td>
   </tr>
  <%
  String id=request.getParameter("id");
  PreparedStatement pst = con.prepareStatement("select * from 登录 where 账号 like '%"+id+"%' ");
  ResultSet re = pst.executeQuery();
  while(re.next())
  {
    out.println("<tr>");
    out.println("<td>"+re.getString(1)+"</td>");
    out.println("<td>"+re.getString(2)+"</td>");
    out.println("<td>"+re.getString(3)+"</td>");
    out.println("</tr>");
  }
  %>
  </table>
  
  </body>
</html>
