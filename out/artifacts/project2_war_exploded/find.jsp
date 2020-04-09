<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="java.sql.*" %>
<%@ include file="conn.jsp"%>
<html>
  <head>

  </head>
  
  <body>

  <form method="post" action="findcheck.jsp">
  <table>
  <tr>
	<td><input type="text" name="id"></td>
	<td><input type="submit" value="查找"></td>
  </tr>
  </table>
  </form>


  <table>
   <tr>
    <td>账号</td>
    <td>密码</td>
    <td>权限</td>
   </tr>
  <%
  PreparedStatement pst = con.prepareStatement("select * from 账号");
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