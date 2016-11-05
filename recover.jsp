<html>
<head>
<title>RECOVER</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="css_lib/w3.css">
	<script>
	function f1(){document.recover.uname.value = document.recover.uname.value.toUpperCase();}
	function f2()
	{
	if(isNaN(document.recover.mno))
	{
		if(document.recover.mno.value.length!=10)
		{
			alertify.alert("INVALID MOBILE NUMBER!");
			document.recover.mno.value="";
		}
	}
}
	</script>
	<script src="alert/jquery.js"></script>
	<script src="alert/alertify.min.js"></script>
	<link rel="stylesheet" href="alert/alertify.core.css">
	<link rel="stylesheet" href="alert/alertify.default.css">
<head>
<body background="themes/sunshine.jpg">
<header class="w3-container w3-blue">
			<h3><b>VOICE MAIL</b></h3>
		</header>
<header class="w3-container w3-brown" style="width:50%;margin-left:25%;margin-top:8%;">
			<h3><b>PASSWORD RECOVERY</b></h3>
</header>
	<form class="w3-form w3-card-4" name="recover" style="width:50%;margin-left:25%" action="recoveryprocess.jsp" >
		<div class="w3-input-group">      
			<input class="w3-input" type="text" name="uname" onblur="f1()" placeholder="ENTER USERNAME" required><br>
			<input class="w3-input" type="text" maxlength="10" name="mno" onblur="f2()" placeholder="ENTER MOBILE NUMBER" required><br>
			<input type="submit" class="w3-btn w3-round w3-green" value="RECOVER">
		</div>
	</form>
<footer class="w3-container w3-black w3-bottom">
	<center>
		<nav class="w3-topnav">
		  <a href="login.jsp">BACK</a>
		</nav>
	</center>
</footer>

</body>
</html>