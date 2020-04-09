<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE html>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title></title>
</head>
<script type="text/javascript">

	function showImg(cell){
              document.getElementById('getImg').src= window.URL.createObjectURL(cell.files[0]);
             }



</script>
<body>
<form method="post" action="id_card.jsp">
  <div>
      <!--显示要添加商品的图片  -->
      <input class="input1 input2 input6" type="file" name="file" onchange="showImg(this)" id="file">
      <img width="280px" id="getImg" name="imgaa">
	<button type="submit">提交</button>
</div>
</form>
</body>
</html>>