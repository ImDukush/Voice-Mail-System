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
<title>CHANGE PASSWORD</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="css_lib/w3.css">
	<script src="alert/jquery.js"></script>
	<script src="alert/alertify.min.js"></script>
	<link rel="stylesheet" href="alert/alertify.core.css">
	<link rel="stylesheet" href="alert/alertify.default.css">
	<script>
	function f1()
	{
		if(document.reset.pwd.value.length<8)
		{
			alertify.alert("PASSWORD IS TOO SHORT!");
			document.reset.pwd.value="";
		}
	}
	function f2()
	{
		if(document.reset.pwd.value!=document.reset.rpwd.value)
		{
			alertify.alert("PASSWORD DOESN'T MATCH!");
			document.reset.rpwd.value="";
		}
	}
	</script>
<head>
<body background="themes/greengrass.jpg">
<header class="w3-container w3-blue">
	<h3><b>WELCOME <%=session.getAttribute("uname")%></b></h3>
</header>
<div class="container">
	<header class="w3-container w3-teal" style="width:40%;margin-left:30%;margin-top:10%;">
			<h3><b>CHANGE PASSWORD</b></h3>
	</header>
	<form class="w3-form w3-card-4" style="width:40%;margin-left:30%;height:30%;" name="reset" onsubmit="returnValidate()" action="update.jsp" method="post">
		<div class="w3-input-group">      
			<input class="w3-input" type="password" name="pwd" placeholder="ENTER NEW PASSWORD" onblur="f1()" required><br>
			<input class="w3-input" type="password" name="rpwd" placeholder="CONFIRM PASSWORD" onblur="f2()" required><br>
			<input type="submit" class="w3-btn w3-round w3-red"style="float:right" value="CHANGE PASSWORD">
		</div>
	</form>
	<br>
</div>
<footer class="w3-container w3-red w3-bottom">
	<center>
		<nav class="w3-topnav">
		  <a href="recover.jsp">BACK</a>
		</nav>
	</center>
	</footer>

</body>
</html>
<%
	}
%>	