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
	<style>
		h5{font-weight:bold;}
	</style>

	<script src="js/recorder.js"></script>
	<script src="js/Fr.voice.js"></script>
	<script src="js/jquery.js"></script>
	<script src="js/record.js"></script>
</head>
<body>	
<header class="w3-container w3-black w3-top" style="width:100%;">
<h5>COMPOSE MAIL</h5>
</header>
<div style="margin-top:47px">
<div class="row" style="border:5px solid blue; background-image:url('cover_photos/<%=session.getAttribute("coverpic")%>'); width:100%; height:270px;" >
<a style="float:right;margin-top:20px;margin-right:10px" class="w3-btn w3-yellow w3-round" href="logoutprocess.jsp"><b>LOGOUT</b></a>
<div class="col-sm-2" style=" padding:105px 0 15px 15px;">
<img src="profile_photos/<%=session.getAttribute("profilepic")%>" class="w3-left w3-square w3-border" style="width:150px;height:150px" />
<span class="w3-xlarge" style="color:yellow;"><b><%=session.getAttribute("name")%></b></span><br><br>
<span><b style="color:aqua">ACTIVE AS <%=session.getAttribute("uname")%></b></span>
</div>
</div>
</div>
<div>
<!-- Compose Message-->
<div class="w3-card-4">
	<div class="w3-container" style="background-image:url('themes/sunshine.jpg');height:51.5%">
	<center><h5 style="color:white;">SEND TEXT MESSAGE</h5><center>
	<hr>
		<form name="txtmsg" class="w3-form" action="sendtext.jsp" method="post">
		<center>
			<div class="input-group" style="width:60%">
				<TextArea rows="6" cols="85" placeholder="ENTER YOUR MESSAGE HERE..." name="message"></TextArea>
				<br>
				<input type="submit" name="send" value="SEND TEXT MESSAGE" style="margin-top:15px;width:49.5%;float:left;"class="w3-btn w3-round w3-red"/>
				<a href="sendattachment.jsp" style="margin-top:15px;width:49.5%;float:right;"class="w3-btn w3-round w3-red">WANT TO SEND ATTACHMENT</a>
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