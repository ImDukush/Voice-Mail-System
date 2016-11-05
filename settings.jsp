<%@page import="java.sql.*"%>
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
	<title><%=session.getAttribute("uname")%></title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="css_lib/w3.css">
	<link rel="stylesheet" href="alert/alertify.core.css">
	<link rel="stylesheet" href="alert/alertify.default.css">
	<script src="js/validDate.js"></script>
	<script src="alert/jquery.js"></script>
	<script src="alert/alertify.min.js"></script>
	<script type="text/javascript">
function f1(){document.updateinfo.name.value = document.updateinfo.name.value.toUpperCase();}
function f3()
{
	if(document.updateinfo.pwd.value.length<8)
	{
		alertify.alert("PASSWORD IS TOO SHORT! PASSWORD'S LENGHT SHOULD BE ATLEAST 8 CHARACTERS");
		document.updateinfo.pwd.value="";
	}
}
function f4()
{
	if(document.updateinfo.pwd.value!=document.updateinfo.rpwd.value)
	{
		alertify.alert("PASSWORD DOESN'T MATCH!");
		document.updateinfo.rpwd.value="";
	}
}
function f5()
{
	if(isNaN(document.updateinfo.mno))
	{
		if(document.updateinfo.mno.value.length!=10)
		{
			alertify.alert("INVALID MOBILE NUMBER!");
			document.updateinfo.mno.value="";
		}
	}
}
function f6()
{
    var dob = document.updateinfo.dob.value;
    var pattern = /^([0-9]{2})-([0-9]{2})-([0-9]{4})$/;
    if (!pattern.test(dob)) 
	{
       alertify.alert("DATE FORMAT NOT VALID!");
		
    }
}
</script>
</head>
<body>
<header class="w3-container w3-black w3-fixed" style="width:100%;">
<h3>USER ACCOUNT</h3>
</header>
<div class="row" style="border:3px solid grey; background-image:url('cover_photos/<%=session.getAttribute("coverpic")%>');width:100%; height:250px;" >
<a style="float:right;margin-right:10px" class="w3-btn w3-yellow w3-round" href="logoutprocess.jsp"><b>LOGOUT</b></a>
<div class="col-sm-2" style=" padding:80px 0 20px 20px;">
<img src="profile_photos/<%=session.getAttribute("profilepic")%>" class="w3-left w3-square" style="width:150px;height:150px" />
<span class="w3-xlarge" style="color:yellow;"><b><%=session.getAttribute("name")%></b></span><br><br>
<span><b style="color:aqua">ACTIVE AS <%=session.getAttribute("uname")%></b></span>
<a href="updateprofilephoto.jsp" style="float:right;margin-top:60px;margin-right:10px" class="w3-btn w3-round w3-red" name="update"><b>CHANGE PROFILE PHOTO</b></a>
<a href="updatecoverphoto.jsp" style="float:right;margin-top:60px;margin-right:10px" class="w3-btn w3-round w3-red" name="update"><b>CHANGE COVER PHOTO</b></a>
</div>
</div>

<!-- Start User Setting -->		
<div class="w3-card-4" style="margin-top:0px;">
	<div class="w3-container" style="background-image:url('themes/sunshine.jpg');">
	<center><h5 style="color:white;">EDIT YOUR ACCOUNT INFORMATION</h5><center>
	<hr>
		<form name="updateinfo" class="w3-form" action="updateinfo.jsp" method="post">
		<center>
			<div class="w3-input-group" style="width:40%;">
				<input class="w3-input" type="text" name="name" maxlength="50" required onblur="f1()" value="<%=session.getAttribute("name")%>" placeholder="FULL NAME"/>
				<br>
				<input class="w3-input" type="text" name="uname" maxlength="50" required value="<%=session.getAttribute("uname")%>" disabled />
				<br>
				<input class="w3-input " type="password" name="pwd" maxlength="50" required onblur="f3()" placeholder="ENTER PASSWORD"/>
				<br>
				<input class="w3-input " type="password" name="rpwd" maxlength="50" required onblur="f4()" placeholder="RE-ENTER PASSWORD"/>
				<br>
				<input class="w3-input" type="text" name="mno" maxlength="50" required disabled value="<%=session.getAttribute("mno")%>" placeholder="MOBILE NUMBER"/>
				<br>
				<input class="w3-input" type="text" name="dob" maxlength="50" required onblur="f6()" value="<%=session.getAttribute("dob")%>" placeholder="DATE OF BIRTH(DD-MM-YYYY)"/>
				<br>
				<input type="submit" name="updateinfo" value="UPDATE YOUR DETAILS" style="width:50%;" class="w3-btn w3-round w3-blue"/>
		</center>
		</form>
	</div>
</div>
	
	
	
	
	
	
	
<!-- End -->	
<footer class="w3-container w3-brown">
<center>
	<h5>VOICE MAIL @UIET</h5>
</center>
</footer>
</body>
</html>
<%
	}
%>