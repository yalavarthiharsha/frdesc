<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.sql.Connection,java.sql.DriverManager,java.sql.PreparedStatement,java.sql.ResultSet,java.sql.SQLException"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="shortcut icon" href="assets/images/logo.png" type="image/x-icon">
  <meta name="description" content="">
  <title>Fraud & Security ML Model</title>

  <link rel="stylesheet" href="assets/web/assets/mobirise-icons/mobirise-icons.css">
  <link rel="stylesheet" href="assets/tether/tether.min.css">
  <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
  <link rel="stylesheet" href="assets/bootstrap/css/bootstrap-grid.min.css">
  <link rel="stylesheet" href="assets/bootstrap/css/bootstrap-reboot.min.css">
  <link rel="stylesheet" href="assets/socicon/css/styles.css">
  <link rel="stylesheet" href="assets/dropdown/css/style.css">
  <link rel="stylesheet" href="assets/theme/css/style.css">
   <link rel="stylesheet" href="assets/mobirise/css/style.css">
  <link rel="stylesheet" href="assets/mobirise/css/mbr-additional.css" type="text/css">
  <style>
#load{
    width:100%;
    height:100%;
    position:fixed;
    z-index:9999;
    background:url("assets/images/loading.gif") no-repeat center center rgba(0,0,0,0.25)
}
</style>
   <script src="assets/mobirise/js/script.js"></script>
</head>
 
<body style='background:rgb(14,57,89)'>
<div id="load"><br><br><br><br><h1 style="text-align:center" id="uploadMessage"></h1></div>
<section class="mbr-section form1 cid-qBxrLqOGjk" id="form1-u" data-rv-view="26"   style="background:rgb(14,57,89)">
<br><br><br>
<div class="container">
<div class="row justify-content-center">
<div class="title col-12 col-lg-8">
<h2 class="mbr-section-title align-center pb-3 mbr-fonts-style display-2" style="color:gold;">Login</h2>
</div></div></div>
<div class="container">
<div class="row justify-content-center">
<br><br>
  <div class="mbr-subscribe input-group" style="align-items: center;justify-content: center;">
   <a class="btn btn-primary btn-form display-4"  style="color:black;background-color:gold" href="home.jsp">Login as analyst</a>
 </div>
 <div class="mbr-subscribe input-group" style="align-items: center;justify-content: center;">
   <a class="btn btn-primary btn-form display-4"  style="color:black;background-color:gold" href="chart.jsp">&nbsp;Login as admin&nbsp;</a>
 </div>
</div></div></section>

  <script src="assets/web/assets/jquery/jquery.min.js"></script>
  <script src="assets/popper/popper.min.js"></script>
  <script src="assets/tether/tether.min.js"></script>
  <script src="assets/bootstrap/js/bootstrap.min.js"></script>
  <script src="assets/dropdown/js/script.min.js"></script>
  <script src="assets/touch-swipe/jquery.touch-swipe.min.js"></script>
  <script src="assets/jarallax/jarallax.min.js"></script>
  <script src="assets/smooth-scroll/smooth-scroll.js"></script>
  <script src="assets/theme/js/script.js"></script>
   <script>
  document.onreadystatechange = function () {
	  var state = document.readyState
	  if (state == 'complete') {
	      setTimeout(function(){
	         
	         document.getElementById('load').style.visibility="hidden";
	         document.getElementById('uploadMessage').innerHTML="";
	      },1000);
	  }
  }
  </script>
  
</body>
</html>