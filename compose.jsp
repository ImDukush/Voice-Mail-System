<%
	String str=(String)session.getAttribute("uname");
	if(str!=null)
	{
%>

<html>
<head>
	<title><%=session.getAttribute("uname")%></title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="css_lib/w3.css">
	<link rel="stylesheet" href="css_lib/w3-theme-blue-grey.css">
	<script src="alert/jquery.js"></script>
	<script src="alert/alertify.min.js"></script>
	<link rel="stylesheet" href="alert/alertify.core.css">
	<link rel="stylesheet" href="alert/alertify.default.css">
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
			var t = setTimeout(startTime, 500);
			var currentDate = new Date()
			var day = currentDate.getDate()
			var month = currentDate.getMonth() + 1
			var year = currentDate.getFullYear()
			//document.getElementById("showdate").innerHTML=day + "/" + month + "/" + year;
			document.getElementById('td').value =day + "/" + month + "/" + year+" AT "+h + ":" + m + ":" + s;
		}
		function checkTime(i)
		{
			if (i < 10) {i = "0" + i};  // add zero in front of numbers < 10
			return i;
		}
</script>
</head>
<body onload="startTime()">	
<header class="w3-container w3-black w3-top" style="width:100%;">
<h5>COMPOSE MAIL</h5>
</header>
<div style="margin-top:47px">
<div class="row" style="border:5px solid blue; background-image:url('cover_photos/<%=session.getAttribute("coverpic")%>'); width:100%; height:270px;" >
<a style="float:right;margin-top:20px;margin-right:10px" class="w3-btn w3-yellow w3-round" href="logoutprocess.jsp"><b>LOGOUT</b></a>
<div class="col-sm-2" style=" padding:105px 0 15px 15px;">
<img src="profile_photos/<%=session.getAttribute("profilepic")%>" class="w3-left w3-square" style="width:150px;height:150px" />
<span class="w3-xlarge" style="color:yellow;"><b><%=session.getAttribute("name")%></b></span><br><br>
<span><b style="color:aqua">ACTIVE AS <%=session.getAttribute("uname")%></b></span>
</div>
</div>
</div>
<div>
<!-- Compose Message-->
<div class="w3-card-4">
	<div class="w3-container" style="background-image:url('themes/sunshine.jpg');height:51.5%">
	<center><h5 style="color:white;">ENTER BELOW FIELD</h5><center>
	<hr>
		<form name="compose" class="w3-form" action="sendmail.jsp" method="post">
		<center>
			<div class="w3-input-group" style="width:60%;">
				<input class="w3-input w3-white" type="text" name="receiver" maxlength="50" required placeholder="USERNAME OF RECEIVER SIDE"/>
				<br>
				<input class="w3-input w3-white" type="text" name="subject" maxlength="250" placeholder="ENTER SUBJECT"/>
				<input type="text" id="td" name="td" hidden />
				<input type="submit" name="send" value="CLICK OK TO PROCEED" style="margin-top:25px;"class="w3-btn-block w3-round w3-red"/>
			</div>
		</center>
		</form>
	</div>
</div>
<footer class="w3-green w3-bottom" >
<center><a href="user.jsp"><h5>BACK</h5></a></center>
<footer>
</body>
</html>
<%
	}
	else
	{
		response.sendRedirect("homepage.jsp");
	}
%>