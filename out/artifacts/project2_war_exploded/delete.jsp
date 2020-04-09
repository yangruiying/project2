<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="java.sql.*" %>
<%@ include file="conn.jsp"%>
<%
    request.setCharacterEncoding("utf-8");
    int id=Integer.valueOf(request.getParameter("id"));
    String msg = request.getParameter("msg");
    String table = request.getParameter("table");
    PreparedStatement pst=con.prepareStatement("delete from "+table+" where num="+id);
    System.out.println("delete from "+table+" where num="+id);
    pst.executeUpdate();

%>

<script type="text/javascript">
  window.onload=function()
  {
    alert("删除成功");
    window.location.href="<%=msg%>";
  }
</script>