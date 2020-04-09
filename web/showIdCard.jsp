<%--
  Created by IntelliJ IDEA.
  User: abc
  Date: 2020/3/28
  Time: 14:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>showIdCard</title>
</head>
<body  style="background: url(img/header-bg.png) no-repeat top center">
    <%
        String address = (String) request.getAttribute("address");
        String birthday = (String)  request.getAttribute("birthday");
        String gender = (String) request.getAttribute("gender");
        String id_card_number = (String) request.getAttribute("id_card_number");
        String name = (String) request.getAttribute("name");
        String race = (String) request.getAttribute("race");
            //out.println(name);
    %>
    <div style="background: #4cd3e3;width: 300px;padding: 10px; margin: 0 auto;">
    <h5>请检查信息是否输入正确并输入密码</h5>
    <form method="post" action="idCardCheck.jsp">
    <table>
        <tr>
            <td>姓名</td>
            <td><input name="name" value=<%=name%> ></td>
        </tr>

        <tr>
            <td>性别</td>
            <td><input name="gender" value=<%=gender%> ></td>
        </tr>

        <tr>
            <td>生日</td>
            <td><input name="birthday" value=<%=birthday%> ></td>
        </tr>

        <tr>
            <td>民族</td>
            <td><input name="race" value=<%=race%>></td>
        </tr>

        <tr>
            <td>身份证号码</td>
            <td><input name="id_card_number" value=<%=id_card_number%>></td>
        </tr>

        <tr>
            <td>地址</td>
            <td><input name="address" value=<%=address%>></td>
        </tr>

        <tr>
            <td>密码</td>
            <td><input name="password"></td>
        </tr>
        <tr>
            <td><input type="submit" value="注册"></td>
        </tr>

    </table>
    </form>
    </div>
</body>
</html>
