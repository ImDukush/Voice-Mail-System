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
	<script type="text/javascript">
function show()
 {
       var div = document.getElementById("div1");
	   if (div.style.display == "none")
		{
			div.style.display = "block";
		}
 }
 </script>
	<style>
		h5{font-weight:bold;}
	</style>
		<script src="voice/js/recorder.js"></script>
		<script src="voice/js/Fr.voice.js"></script>
		<script src="voice/js/jquery.js"></script>
		<script src="voice/js/record.js"></script>
		<style>
		.button{
			display: inline-block;
			vertical-align: middle;
			margin: 0px 5px;
			padding: 5px 12px;
			cursor: pointer;
			outline: none;
			font-size: 13px;
			text-decoration: none !important;
			text-align: center;
			color:#fff;
			background-color: #4D90FE;
			background-image: linear-gradient(top,#4D90FE, #4787ED);
			background-image: -ms-linear-gradient(top,#4D90FE, #4787ED);
			background-image: -o-linear-gradient(top,#4D90FE, #4787ED);
			background-image: linear-gradient(top,#4D90FE, #4787ED);
			border: 1px solid #4787ED;
			box-shadow: 0 1px 3px #BFBFBF;
		}
		a.button{
			color: #fff;
		}
		.button:hover{
			box-shadow: inset 0px 1px 1px #8C8C8C;
		}
		.button.disabled{
			box-shadow:none;
			opacity:0.7;
		}
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
<!-- Voice Message-->
<div class="w3-container" style="background-image:url('themes/rabbit.jpg');height:70%;">
<center><h5 style="color:white">SEND VOICE MAIL</h5></center>
<hr>
		<center>
		<div class="w3-container" id="controls" style="width:50%;">
			<audio controls src="" id="audio"></audio>
			<br>
			<div style="margin:10px;">
				<a class="button" id="record">RECORD</a>
				<a class="button disabled one" id="pause">PAUSE</a>
				<a class="button disabled one" id="stop">RESET</a>
				<a class="button disabled one" id="play">PLAY</a>
				<a class="button disabled one" id="download" onclick="show()">SAVE</a><br><br>
				<b style="color:white">SAVE FILE BEFORE SEND</b>
			</div>
			<div id="div1" style="display:none">
			<form method="post" action="sendvoice.jsp" name="sendvoice" enctype="multipart/form-data"> 
			<hr>
			<br>			
			<b style="color:cyan;font-size:11pt;">CHOOSE YOUR RECORDED FILE FROM DOWNLOADS</b><br><br>
				<input type="file" class="w3-btn w3-yellow w3-round " name="voicemail" id="voicemail" /><br><br>
			<input type="submit" class="button disabled one w3-red w3-large w3-round" id="save" value="SEND VOICE MAIL" style="width:70%;"/>
			</form>
			</div>
		</div>
		</center>	
</div>
<footer class="w3-container w3-green" >
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