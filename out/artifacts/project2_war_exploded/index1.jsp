<%@ page language="java" import="java.sql.Blob" pageEncoding="utf-8"%>
<!DOCTYPE html>

<html>
<style>

</style>
<head>
  <head>
    <!-- Mobile Specific Meta -->
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Favicon-->
    <link rel="shortcut icon" href="img/fav.png">
    <!-- Author Meta -->
    <meta name="author" content="codepixer">
    <!-- Meta Description -->
    <meta name="description" content="">
    <!-- Meta Keyword -->
    <meta name="keywords" content="">
    <!-- meta character set -->
    <meta charset="UTF-8">
    <!-- Site Title -->
    <title>aa</title>


    <link rel="stylesheet" href="https://cdn.jsdelivr.net/themify-icons/0.1.2/css/themify-icons.css">
    <link rel="stylesheet" href="css/linearicons.css">
    <link rel="stylesheet" href="css/font-awesome.min.css">
    <link rel="stylesheet" href="css/bootstrap.css">
    <link rel="stylesheet" href="css/magnific-popup.css">
    <link rel="stylesheet" href="css/nice-select.css">
    <link rel="stylesheet" href="css/animate.min.css">
    <link rel="stylesheet" href="css/owl.carousel.css">
    <link rel="stylesheet" href="css/main.css">
  </head>
</head>
<script type="text/javascript">

  function showImg(cell){
    //document.getElementById('getImg').src= window.URL.createObjectURL(cell.files[0]);
    changeFile(cell);
  }



  function changeFile(event) {

    file = event.files[0];

    var a = new FileReader();

    a.onload = function (e) {
      var base64Str = e.target.result;//获取base64
      //下面是测试得到的base64串能否正常使用：
      document.getElementById('getImg').src = base64Str;
      document.getElementById('img2').value=base64Str;
      //alert(base64Str);
    }
    a.readAsDataURL(file);
  }


</script>
<body style="background: url(img/header-bg.png) no-repeat top center">
<div style="width: 500px; background: #1b1e21;padding: 20px;margin: 0 auto;margin-top: 200px">
<form method="post" action="Demo2">
  <div>
    <h5 style="color: #f1f1f1;margin:10px">选择身份证图片</h5>
    <div><input class="input1 input2 input6" type="file" name="file" onchange="showImg(this)" id="file" ></div>
    <div><img width="280px" id="getImg" name="imgaa" style="background: #0056b3"></div>
    <input name="img2" type="text" id="img2" style="display: none">
    <button type="submit">提交</button>
  </div>
</form>
</div>
<script src="js/vendor/jquery-2.2.4.min.js"></script>
<script src="js/vendor/bootstrap.min.js"></script>

<script src="js/easing.min.js"></script>
<script src="js/hoverIntent.js"></script>
<script src="js/superfish.min.js"></script>
<script src="js/jquery.ajaxchimp.min.js"></script>
<script src="js/jquery.magnific-popup.min.js"></script>
<script src="js/owl.carousel.min.js"></script>
<script src="js/owl-carousel-thumb.min.js"></script>
<script src="js/jquery.sticky.js"></script>
<script src="js/jquery.nice-select.min.js"></script>
<script src="js/parallax.min.js"></script>
<script src="js/waypoints.min.js"></script>
<script src="js/wow.min.js"></script>
<script src="js/jquery.counterup.min.js"></script>
<script src="js/mail-script.js"></script>
<script src="js/main.js"></script>
</body>
</html>