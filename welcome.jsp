<%
	if(session.getAttribute("uname")==null)
	{
		response.sendRedirect("login.jsp");
	}
	else
	{
%>
<html>
<head>
<title>WELCOME</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="css_lib/w3.css">
<head>
<body background="themes/greengrass.jpg">
<header class="w3-container w3-teal" style="width:100%;">
		<h3><b>WELCOME <%=session.getAttribute("name")%></b></h3>
</header>
<div class="w3-card-4" style="width:100%;height:86.5%;">
	<div class="w3-container">
	<div class="w3-card-4" style="width:80%;height:75%;margin-left:10%;margin-top:5%;">
		<div class="w3-container">
		<center><br>
				<b style="color:blue;font-size:40pt;">WELCOME</b>
				<br>
				<br>
				<b style="color:green;font-size:32pt;">NOW YOU ARE REGISTERED USER.</b>
				<br>
				<br>
				<b style="color:red;font-size:26pt;">YOUR USERNAME IS <%=session.getAttribute("uname")%></b>
				<br>
				<br>
				<b style="color:black;font-size:20pt;">REMEMBER YOUR USERNAME FOR FUTURE USE.</b>
				<br>
				<br>
				<br>
				<a href="uploadprofilephoto.jsp" class="w3-btn w3-round-large w3-blue">NEXT</a>
		</center>
		</div>
	</div>
	</div>
</div>
<footer class="w3-container w3-brown w3-bottom">
	<center>
		<nav class="w3-topnav w3-brown">
		  <a href="homepage.jsp">HOME</a>
		</nav>
	</center>
	</footer>
</body>
</html>
<%
	}
%>	