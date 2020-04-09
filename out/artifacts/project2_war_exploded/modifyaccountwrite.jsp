<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="java.sql.*" %>
<%@ include file="conn.jsp"%>
<html>
  <head>

  </head>
  
  <body>
  <%
  PreparedStatement pst=con.prepareStatement("select * from 登录 where 账号=?");
  pst.setString(1,request.getParameter("id"));
  ResultSet re=pst.executeQuery();
  re.next();
  String id=re.getString(1);
  String password=re.getString(2);
  %>
  <form method="post" action="modifyaccountcheck.jsp">
  <table>
   <tr>
    <td>账号</td>
    <td><input type="text" name="user" value=<%=id%> ></td>
   </tr>

   <tr>
    <td>密码</td>
    <td><input type="text" name="password" value=<%=password%> ></td>
   </tr>

   <tr>
    <td>权限</td>
    <td>
    <select name="power">
    <option value="教师">教师</option>
    <option value="管理员">管理员</option>
    </select>
    </td>
   </tr>

   <tr>
    <td><input type="submit" value="修改"></td>
   </tr>
  </table>
  </form>
  </body>
</html>