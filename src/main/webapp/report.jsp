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
   <script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>
<script src="https://code.highcharts.com/modules/export-data.js"></script>
<script type="text/JavaScript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.1/jquery.min.js" ></script>
<script src="http://code.jquery.com/jquery-1.10.1.min.js"></script>

</head>

<body style='background:rgb(14,57,89)'>
<%
String id="2018123456";
String alert_score="1.0";
%>
<div id="load"><br><br><br><br><h1 style="text-align:center" id="uploadMessage"></h1></div>
<section class="menu cid-qApEDVzbmB" once="menu" id="menu1-e" data-rv-view="32">
    <nav class="navbar navbar-expand beta-menu navbar-dropdown align-items-center navbar-fixed-top navbar-toggleable-sm" style="background:rgb(14,57,89)">
        <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <div class="hamburger">
                <span></span>
                <span></span>
                <span></span>
                <span></span>
            </div>
        </button>
        <div class="menu-logo">
            <div class="navbar-brand">
                <span class="navbar-logo">
                    <a href="index.jsp">
                         <img src="assets/images/frdsec2.png" title="" media-simple="true" style="height: 3.8rem;">
                    </a>
                </span>
               
            </div>
        </div>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
          
            <ul class="navbar-nav nav-dropdown" data-app-modern-menu="true">
				<li class="nav-item">
                    <a class="nav-link link text-white display-4" href="home.jsp">
                    <span class="mbri-home mbr-iconfont mbr-iconfont-btn"></span>
                        Home
                    </a>
                </li> 
				<li class="nav-item">
                    <a class="nav-link link text-white display-4" href="home.jsp">
                    <span class="mbri-user mbr-iconfont mbr-iconfont-btn"></span>
                        My Alerts
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link link text-white display-4" href="logout.jsp">
                   <span class="mbri-redo mbr-iconfont mbr-iconfont-btn"></span>
                        Logout
                    </a>
                </li> 
                
				</ul>
        </div>
    </nav>
</section>
<%
Connection conn = null;
	try {
		Class.forName("com.mysql.jdbc.Driver");  
		conn = DriverManager.getConnection("jdbc:mysql://wibidb.cdn8nruame9d.us-east-1.rds.amazonaws.com:3306/wibi","wibi","Wibi2018");
		String UPDATE_QUERY = "update Alerts set worked='yes' where alert_id=?";
		
		PreparedStatement ps = conn.prepareStatement(UPDATE_QUERY);
		ps.setString(1, request.getParameter("id").toString());
		ps.executeUpdate();
	}
	catch(Exception e)
	{
		System.out.println(e.getMessage());
	}
	finally
	{
		conn.close();
	}
%>
<section class="section-table cid-qPYTUCzNN7" id="table1-i"  style="background:rgb(14,57,89)">
<br><br><br><br>
<div class="container container-table">           
<div class="table-wrapper">            <div class="container scroll">         
 <table class="table isSearch" cellspacing="0"  border="2" bordercolor="gold">                     
 <tbody>  
			<tr>  
			<td  class="body-item mbr-fonts-style display-7" style="color:gold;">Alert Identifier</td>
			<td  class="body-item mbr-fonts-style display-7" style="color:gold;"><%=request.getParameter("id")%></td>
			</tr>
			<tr>  
			<td  class="body-item mbr-fonts-style display-7" style="color:gold;">Real fraud?</td>
			<td  class="body-item mbr-fonts-style display-7" style="color:gold;"><%=request.getParameter("fraud")%></td>
			</tr>
			<tr style="background-color:rgb(125,126,128)">  
			<td  class="body-item mbr-fonts-style display-7" style="color:gold;">ML Model result</td>
			<td  class="body-item mbr-fonts-style display-7" style="color:gold;">
			<% if(Double.parseDouble(request.getParameter("score").toString())>0.8) { out.print("no ("+request.getParameter("score")+")");} else { out.print("yes ("+request.getParameter("score")+")");} %>
	
	</tbody>        
  </table>       
 </div>    
  </div> 
  <br><br>
  
  <!-- <div id="container" style="width:924px; height: 668px; margin: 0 auto; background:rgb(14,57,89)"></div> -->
<script>
// Radialize the colors
Highcharts.setOptions({
    colors: Highcharts.map(Highcharts.getOptions().colors, function (color) {
        return {
            radialGradient: {
                cx: 0.5,
                cy: 0.3,
                r: 0.7
            },
            stops: [
                [0, color],
                [1, Highcharts.Color(color).brighten(-0.3).get('rgb')] // darken
            ]
        };
    })
});

// Build the chart
Highcharts.chart('container', {
    chart: {
        plotBackgroundColor: null,
        plotBorderWidth: null,
        plotShadow: false,
        type: 'pie'
    },
    title: {
        text: 'Percentage of feature in fraud detection'
    },
    tooltip: {
        pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
    },
    plotOptions: {
        pie: {
            allowPointSelect: true,
            cursor: 'pointer',
            dataLabels: {
                enabled: true,
                format: '<b>{point.name}</b>: {point.percentage:.1f} %',
                style: {
                    color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black'
                },
                connectorColor: 'silver'
            }
        }
    },
    series: [{
        name: 'Share',
        data: [
   { name: 'EVENT_TYPE', y : 2.3}, 
{ name: 'SYSTEM_NAME', y: 14.1 },
{ name: 'TRANSACTION_TYPE', y: 15.4 },
{ name: 'BANK_ID_FROM', y: 5.1 },
{ name: 'SOURCE_ACCOUNT_TYPE', y: 0 },
{ name: 'BANK_ID_TO', y: 3.8 },
{ name: 'DEST_ACCOUNT_TYPE', y: 11.8 },
{ name: 'TRANSACTION_AMT', y: 2.6 },
{ name: 'TXN_STATUS', y: 11.5 },
{ name: 'RECURRING_IND', y: 10.3 },
{ name: 'CHANNEL_NM', y: 7.7 },
{ name: 'TXN_AUTH_CD', y: 6.4 },
{ name: 'TXN_QTY', y: 9 }
        ]
    }]
});
</script>
 
 <!--  <div class="mbr-subscribe input-group" style="align-items: center;justify-content: center;">
   <button class="btn btn-primary btn-form display-4"  style="color:white;">Contribute to machine learning model</button>
 </div> -->
 
 <h3 class="mbr-section-title mbr-fonts-style align-center pb-3 display-2" style="display:none" id="thanks">         Thanks for your contribution      </h3>    
   </div> 
<br></section>
<script>
$(".btn").click(function() {
	     $("#thanks").show();
	  });

</script>

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