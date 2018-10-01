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
<%
if(request.getParameter("alg")!=null)
{
    session.setAttribute("alg","true");
}
%>
<body style='background:rgb(14,57,89)'>
<div id="load"><br><br><br><br><h1 style="text-align:center" id="uploadMessage"></h1></div>
<script type="text/JavaScript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.1/jquery.min.js" ></script>
<script src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
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
<section class="section-table cid-qPYTUCzNN7" id="table1-i"  style="background:rgb(14,57,89)">
<br><br><br><br>
<div class="container container-table">      
<h2 class="mbr-section-title mbr-fonts-style align-center pb-3 display-2"  style="color:gold;">         My Alerts      </h2>
 <div class="mbr-subscribe input-group" style="align-items: right;justify-content: center;margin-left:300px">
   <a class="btn btn-primary btn-form display-4"  style="color:black;background-color:gold" href="home.jsp?alg=true">Calculate Fraud Score</a>
 </div>    
 
<div class="table-wrapper">            <div class="container scroll">          
<table class="table isSearch" cellspacing="0" border="2" bordercolor="gold">           
 <thead>             
 <tr class="table-heads ">                                
<th class="head-item mbr-fonts-style display-7" style="color:gold;"> Alert identifier </th>
<th class="head-item mbr-fonts-style display-7"  style="color:gold;"> Created date </th>
<th class="head-item mbr-fonts-style display-7" style="color:gold;"> Member number </th>
<th class="head-item mbr-fonts-style display-7" style="color:gold;"> Alert type </th> 
<th class="head-item mbr-fonts-style display-7 score" style="color:gold;"> Alert score (algorithm) </th> 
</tr>          
  </thead>           
 
  <tbody>  
 <%
 Connection conn = null;
	try {
		Class.forName("com.mysql.jdbc.Driver");  
		conn = DriverManager.getConnection("jdbc:mysql://wibidb.cdn8nruame9d.us-east-1.rds.amazonaws.com:3306/wibi","wibi","Wibi2018");
		String SELECT_QUERY = "select alert_id,created_dt,member_number,alert_type,alert_score from Alerts where worked='no' order by alert_id desc";
		if(session.getAttribute("alg")!=null)
		{
			SELECT_QUERY = "select alert_id,created_dt,member_number,alert_type,alert_score from Alerts where worked='no' order by alert_score desc";	
		}
		PreparedStatement ps = conn.prepareStatement(SELECT_QUERY);
		ResultSet rs = ps.executeQuery();
		while(rs.next())
		{
			if(session.getAttribute("alg")==null)
			{
				%>
				<tr>  
				<td class="body-item mbr-fonts-style display-7" style="color:white;font-weight:bold"><a href="alert_detail.jsp?id=<%=rs.getString("alert_id") %>" style="color:white;font-weight:bold;text-decoration:underline"><%=rs.getString("alert_id") %></a></td>
				<td class="body-item mbr-fonts-style display-7" style="color:white;"><%=rs.getString("created_dt") %></td>
				<td class="body-item mbr-fonts-style display-7" style="color:white;"><%=rs.getString("member_number") %></td>
				<td class="body-item mbr-fonts-style display-7" style="color:white;"><%=rs.getString("alert_type") %></td>
				<td class="body-item mbr-fonts-style display-7 score" style="color:white;">  </td>  
			   </tr>
				<%
			}
			else
			{
				if(Double.parseDouble(rs.getString("alert_score"))>0.8)
				{
					%><tr style="background-color:rgb(125,126,128)"><%
				}
				else
				{
					%><tr><%
				}
				%>
				<td class="body-item mbr-fonts-style display-7" style="color:white;"><a href="alert_detail.jsp?id=<%=rs.getString("alert_id") %>" style="color:white;font-weight:bold;text-decoration:underline"><%=rs.getString("alert_id") %></a></td>
				<td class="body-item mbr-fonts-style display-7" style="color:white;"><%=rs.getString("created_dt") %></td>
				<td class="body-item mbr-fonts-style display-7" style="color:white;"><%=rs.getString("member_number") %></td>
				<td class="body-item mbr-fonts-style display-7" style="color:white;"><%=rs.getString("alert_type") %></td>
				<td class="body-item mbr-fonts-style display-7 score" style="color:white;"> <%=Double.parseDouble(rs.getString("alert_score"))*100.0 %>% False Positive </td>  
			   </tr>
				<%
				
			}
		}
		} 
		catch (SQLException | ClassNotFoundException e) 
 	{
 		e.printStackTrace();
 	}
		finally
		{
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	
	%>
	</tbody> 
	        
  </table>       
 </div>    
  </div> 
   </div> 
<br></section>
<script>
$(".btn123").click(function() {
		sleep(2000);
	     $(".alert_score").show();
	     document.getElementsByClassName("score").style.backgroundColor="blue";
	  });

</script>
<script type="text/javascript">
      /**
       * Delay for a number of milliseconds
       */
      function sleep(delay) {
        var start = new Date().getTime();
        while (new Date().getTime() < start + delay);
      }
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