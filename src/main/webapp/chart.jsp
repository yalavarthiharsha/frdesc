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
                    <a class="nav-link link text-white display-4" href="chart.jsp">
                    <span class="mbri-home mbr-iconfont mbr-iconfont-btn"></span>
                        Home
                    </a>
                </li> 
				<li class="nav-item">
                    <a class="nav-link link text-white display-4" href="chart.jsp?send=success">
                    <span class="mbri-redo mbr-iconfont mbr-iconfont-btn"></span>
                        Send report to rules management team
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link link text-white display-4" href="logout.jsp">
                   <span class="mbri-user mbr-iconfont mbr-iconfont-btn"></span>
                        Logout
                    </a>
                </li> 
                
				</ul>
        </div>
    </nav>
</section>
<br><br>
<section class="section-table cid-qPYTUCzNN7" id="table1-i"  style="background:rgb(14,57,89)">
<br><br>
<%
if(request.getParameter("send")!=null)
{
	%><h3 class="mbr-section-title mbr-fonts-style align-center pb-3 display-2" id="thanks" style="color:gold">         Thanks for your contribution      </h3><%
}
%>

 <!-- <div id="container2" style="width:924px; height: 400px; margin: 0 auto; background:rgb(14,57,89)"></div> 
 <br><br> -->
 <div style="width:924px; height: 668px; margin: 0 auto; background:rgb(14,57,89)"> 
 <section class="section-table cid-qPYTUCzNN7" id="table1-i" style="background:rgb(14,57,89)">
 
  <div class="container container-table" >
      <h2 class="mbr-section-title mbr-fonts-style align-center pb-3 display-2" style="color:gold">ML Model Statistics</h2>
      <div class="table-wrapper">
 
        <div class="container scroll">
          <table class="table isSearch" cellspacing="0" border="2" bordercolor="gold">
            <thead>
              <tr class="table-heads ">    
              <th class="head-item mbr-fonts-style display-7 align-center"  style="color:gold">
                      Month</th><th class="head-item mbr-fonts-style display-7 align-center"  style="color:gold">
                      Alerts classified</th><th class="head-item mbr-fonts-style display-7 align-center" style="color:gold">
                      Correctly classified</th><th class="head-item mbr-fonts-style display-7 align-center" style="color:gold">
                      Incorrectly classified</th><th class="head-item mbr-fonts-style display-7 align-center" style="color:gold">
                      Confidence percentage</th></tr>
            </thead>

            <tbody>
       
            <tr style="color:gold">        
              <td class="body-item mbr-fonts-style display-7 align-center">Jan 2018</td><td class="body-item mbr-fonts-style display-7 align-center" style="text-align:center">245</td><td class="body-item mbr-fonts-style display-7"  style="text-align:center">198</td><td class="body-item mbr-fonts-style display-7"  style="text-align:center">47</td><td class="body-item mbr-fonts-style display-7"  style="text-align:center">80.8%</td></tr>
              <tr style="color:gold"><td class="body-item mbr-fonts-style display-7 align-center">Feb 2018</td><td class="body-item mbr-fonts-style display-7 align-center">240</td><td class="body-item mbr-fonts-style display-7" style="text-align:center">203</td><td class="body-item mbr-fonts-style display-7" style="text-align:center">37</td><td class="body-item mbr-fonts-style display-7"  style="text-align:center">84.5%</td></tr>
              <tr style="color:gold"><td class="body-item mbr-fonts-style display-7 align-center">Mar 2018</td><td class="body-item mbr-fonts-style display-7 align-center">260</td><td class="body-item mbr-fonts-style display-7" style="text-align:center">229</td><td class="body-item mbr-fonts-style display-7" style="text-align:center">31</td><td class="body-item mbr-fonts-style display-7"  style="text-align:center">88.0%</td></tr>
              <tr style="color:gold"><td class="body-item mbr-fonts-style display-7 align-center">Apr 2018</td><td class="body-item mbr-fonts-style display-7 align-center">255</td><td class="body-item mbr-fonts-style display-7" style="text-align:center">243</td><td class="body-item mbr-fonts-style display-7" style="text-align:center">12</td><td class="body-item mbr-fonts-style display-7" style="text-align:center">95.2%</td></tr>
              </tbody>
          </table>
        </div>
      </div>
    </div>
    <div id="gauge_div" style="width:924px;align:center; height: 240px;"></div>
</section>
<br><br>
 <div id="container" style="width:924px; height: 668px; margin: 0 auto; background:rgb(14,57,89)"></div> 
 <br><br>
</div>
<br><br>
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
   { name: 'Alert type', y : 2.3}, 
{ name: 'System name', y: 14.1 },
{ name: 'Transaction type', y: 15.4 },
{ name: 'Source bank number', y: 5.1 },
{ name: 'Source account type', y: 0 },
{ name: 'Destination bank number', y: 3.8 },
{ name: 'Destination account type', y: 11.8 },
{ name: 'Transaction amount', y: 2.6 },
{ name: 'Transaction status', y: 11.5 },
{ name: 'Recurring indicator', y: 10.3 },
{ name: 'Channel name', y: 7.7 },
{ name: 'Transaction authority code', y: 6.4 },
{ name: 'Transaction quantity', y: 9 }
        ]
    }]
});

//Build the chart
Highcharts.chart('container2', {
    chart: {
        plotBackgroundColor: 'gold',
        plotBorderWidth: null,
        plotShadow: false,
        type: 'pie'
    },
    title: {
        text: 'ML Model confidence score'
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
   { name: 'Identified false positives', y : 95.2}, 
{ name: 'Not identified false positives', y: 4.8 }
        ]
    }]
});
</script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
  <script type="text/javascript">
    google.charts.load('current', {'packages':['gauge']});
    google.charts.setOnLoadCallback(drawGauge);

    var gaugeOptions = {min: 0, max: 100, yellowFrom: 80, yellowTo: 90,
      greenFrom: 90, greenTo: 100, minorTicks: 5, 
      animation:{
          duration: 1000,
          easing: 'inAndOut',
        }
    };
    var gauge;

    function drawGauge() {
      gaugeData = new google.visualization.DataTable();
      gaugeData.addColumn('number', 'Jan 2018');
      gaugeData.addColumn('number', 'Feb 2018');
      gaugeData.addColumn('number', 'Mar 2018');
      gaugeData.addColumn('number', 'Apr 2018');
      gaugeData.addRows(4);
      gaugeData.setCell(0, 0, 80.8);
      gaugeData.setCell(0, 1, 84.5);
      gaugeData.setCell(0, 2, 88.0);
      gaugeData.setCell(0, 3, 95.2);

      gauge = new google.visualization.Gauge(document.getElementById('gauge_div'));
      gauge.draw(gaugeData, gaugeOptions);
    }

  </script>
<br></section>


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