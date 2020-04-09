<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="java.sql.*" %>
<%@ include file="conn.jsp"%>
<html>
  <head>

  </head>
  
  <body>
  <form method="post" action="addaccountcheck.jsp">
  <table>
   <tr>
    <td>账号</td>
    <td><input type="text" name="user"></td>
   </tr>

   <tr>
    <td>密码</td>
    <td><input type="password" name="password"></td>
   </tr>

   <tr>
    <td>密码</td>
    <td>
    <select name="power">
    <option value="教师">教师</option>
    <option value="管理员">管理员</option>
    </select>
    </td>
   </tr>

   <tr>
    <td><input type="submit" value="提交"></td>
   </tr>
  </table>
  </form>
  </body>
</html>