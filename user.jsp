<%@page language="java" %>
<%@include file="getcon.jsp" %>
<%@ page import="java.io.*,java.util.*" %>
<%
	if(session.getAttribute("uname")==null)
	{
		response.sendRedirect("login.jsp");
	}
	else
	{
%>
<html>
<title><%=session.getAttribute("uname")%></title>
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/bootstrap-theme.min.css">
<script src="css/jquery.min.js"></script>
<script src="css/bootstrap.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
	<script type="text/javascript">
	$(document).ready(function(){
		$('[data-toggle="popover"]').popover({
			html: true,
			template: '<div class="popover"><div class="arrow"></div><h3 class="popover-title"></h3><div class="popover-content"></div><div class="popover-footer"><a href="" class="btn btn-info btn-sm">Close</a></div></div>'
								});
		
		// Custom jQuery to hide popover on click of the close button
		$(document).on("click", ".popover-footer .btn" , function(){
			$(this).parents(".popover").popover('hide');
		});
		
	});
	</script>
	<link rel="stylesheet" href="css_lib/w3.css">
	<link rel="stylesheet" href="css_lib/w3-theme-blue-grey.css">
	<link rel="stylesheet" href="font-awesome/css/font-awesome.min.css">
	<style>
		h5{font-weight:bold;}
	</style>

	<script>
		function startTime()
		{
			var today = new Date();
			var h = today.getHours();
			var m = today.getMinutes();
			var s = today.getSeconds();
			m = checkTime(m);
			s = checkTime(s);
			document.getElementById('showtime').innerHTML =h + ":" + m + ":" + s;
			var t = setTimeout(startTime, 500);
			var currentDate = new Date()
			var day = currentDate.getDate()
			var month = currentDate.getMonth() + 1
			var year = currentDate.getFullYear()
			document.getElementById("showdate").innerHTML=day + "/" + month + "/" + year;
		}
		function checkTime(i)
		{
			if (i < 10) {i = "0" + i};  // add zero in front of numbers < 10
			return i;
		}
</script>
	<style>
		html,body,h1,h2,h3,h4,h5 {font-family: "Open Sans", sans-serif}
	</style>
<body class="w3-theme-l5" onload="startTime()" background="themes/simple.jpg">

<!-- Navbar -->
<div class="w3-top">
 <ul class="w3-navbar w3-theme-d2 w3-left-align w3-large">
  <li class="w3-hide-medium w3-hide-large w3-opennav w3-right">
    <a class="w3-padding-large w3-hover-white w3-large w3-theme-d2" href="javascript:void(0);" onclick="openNav()"><i class="fa fa-bars"></i></a>
  </li>
  <li><a href="#" class="w3-padding-large w3-theme-d4">INBOX</a></li>
  <li class="w3-hide-small"><a href="sentmail.jsp" class="w3-padding-large w3-hover-white">SENT MAIL</a></li>
  <li class="w3-hide-small"><a href="settings.jsp" class="w3-padding-large w3-hover-white">SETTINGS</a></li>
  <li class="w3-hide-small"><a href="help.jsp" class="w3-padding-large w3-hover-white">HELP</a></li>
  <li class="w3-hide-small w3-right"><a href="logoutprocess.jsp" class="w3-padding-large w3-hover-white">LOGOUT</a></li>
 </ul>
</div>

<!-- Page Container -->
<div class="w3-container w3-content" style="max-width:1500px;margin-top:80px">    
  <!-- The Grid -->
  <div class="w3-row">
    <!-- Left Column -->
    <div class="w3-col m3">
      <!-- Profile -->
      <div class="w3-card-2 w3-round w3-white">
        <div class="w3-container">
         <h4 class="w3-center">MY PROFILE</h4>
         <p class="w3-center"><img src="profile_photos/<%=session.getAttribute("profilepic")%>" class="w3-circle w3-border" style="height:120px;width:120px" alt="NO IMAGE"></p>
         <hr>
		 <center>
		 <table class="w3-table w3-bordered w3-small">
			<tr><td>NAME</td><td><%=session.getAttribute("name")%></td></tr>
			<tr><td>USERNAME</td><td><%=session.getAttribute("uname")%></td></tr>
			<tr><td>DOB</td><td><%=session.getAttribute("dob")%></td></tr>
			<tr><td>GENDER</td><td><%=session.getAttribute("gender")%></td></tr>
			<tr><td>CONTACT NO.</td><td><%=session.getAttribute("mno")%></td></tr>
		</table>
		</center>
        </div>
      </div>
      <br>
      
      <!-- Compose-->
		<div class="w3-card-2 w3-round" style="padding:5px;background:orange">
		<a class="w3-btn-block w3-round w3-brown" href="compose.jsp"><b style="font-size:18pt;color:white;">COMPOSE</b></a>
		</div>
<div class="w3-card-2 w3-round" style="padding:5px;">
<center>
	<b id="showtime" name="showtime" style="font-size:20;color:brown;"></b>&nbsp&nbsp
	<b id="showdate" name="showdate" style="font-size:20;color:brown;"></b><br>
	<b style="font-size:20;color:green;">HAVE A NICE DAY</b>
</center>
</div>
	
      <br>
   
      
    
    <!-- End Left Column -->
    </div>
    
    <!-- Inbox Column -->
    <div class="w3-col m7" style="width:75%">
    
      <div class="w3-row-padding">
        <div class="w3-col m12">
          <div class="w3-card-2 w3-round w3-white">
            <div class="w3-container w3-padding">
             <table class="w3-table w3-striped w3-bordered w3-border w3-hoverable w3-large">
				<thead>
					<tr class="w3-light-grey">
					<th><h5>FROM</h5></th>
					<th><h5>SUBJECT</h5></th>
					<th><h5>DATE</h5></th>
					<th><h5>MESSAGES</h5></th>
					<th><h5>ATTACHMENTS</h5></th>
					<th></th>
					</tr>
				</thead>
				<%
					String uname=(String)session.getAttribute("uname");
					PreparedStatement ps = con.prepareStatement("select * from MESSAGE where receiver='"+uname+"'");
					ResultSet rs = ps.executeQuery();
					while (rs.next())
					{
						%>
						<tr>
							<td><%=rs.getString(1)%></td>
							<td><%=rs.getString(3)%></td>
							<td><%=rs.getString(6)%></td>
							<td>
								<div class="bs-example">
								<button type="button" class="btn btn-info" data-toggle="popover"  data-content="<%=rs.getString(4)%>">VIEW MESSAGE</button>
								</div>
							</td>
							<td><a href="attachments/<%=rs.getString(5)%>" style="margin-left:35px;" download ><i class="fa fa-paperclip" aria-hidden="true"></i></a></td>
							<td><input class="w3-check" type="checkbox"></td>
						</tr>
						<%
					}
				%>
			</table> 
            </div>
          </div>
        </div>
      </div>
      
    <!-- End Middle Column -->
    </div>
    
    
  <!-- End Grid -->
  </div>
  
<!-- End Page Container -->
</div>
<br>

<!-- Footer -->
<footer class="w3-container w3-theme-d3 w3-bottom">
  <center><h5>VOICE MAIL @UIET</h5></center>
</footer>

 
<script>

// Used to toggle the menu on smaller screens when clicking on the menu button
function openNav() {
    var x = document.getElementById("navDemo");
    if (x.className.indexOf("w3-show") == -1) {
        x.className += " w3-show";
    } else { 
        x.className = x.className.replace(" w3-show", "");
    }
}
</script>


</body>
</html> 
<%
	}
%>