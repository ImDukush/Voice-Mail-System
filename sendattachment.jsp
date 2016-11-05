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
	<center><h5 style="color:white;">ATTACH FILES</h5><center>
	<hr>
		<form name="attach_file" class="w3-form" enctype="multipart/form-data" action="sendattachmentfile.jsp" method="post">
			
			<div class="input-group" style="width:60%">
				<div>
				<b style="color:cyan;font-size:16pt;">CHOOSE YOUR FILE</b><br><br>
				<input type="file" class="w3-btn w3-yellow w3-round " name="attachment" id="attachment" />
				</div>
				<br>
				<input type="submit" name="send" value="SEND ATTCHMENT" style="margin-top:15px;width:49.5%;float:left;" class="w3-btn w3-round w3-red"/>
				<a href="sendvoicemail.jsp" style="margin-top:15px;width:49.5%;float:right;" class="w3-btn w3-round w3-red">WANT TO SEND VOICE MAIL</a>
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