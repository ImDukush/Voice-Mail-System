<html>
<head>
<title>LOGIN</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="css_lib/w3.css">
	
	<link rel="stylesheet" href="alert/alertify.core.css">
	<link rel="stylesheet" href="alert/alertify.default.css">

	<script src="alert/jquery.js"></script>
	<script src="alert/alertify.min.js"></script>
<head>
<body background="themes/hills.jpg">
<header class="w3-container w3-green" style="width:100%;">
		<h2><b>LOGIN</b></h2>
</header>
<div class="w3-card-4" style="width:50%;margin-left:25%;margin-top:8%;">
	<div class="w3-container">
				<form name="login" style="width:90%;height:40%;margin-left:5;" class="w3-form" action="login.jsp" method="post">
					<div class="w3-input-group">
						<label><b style="color:white">USERNAME</b></label>
						<br>
						<input class="w3-input" type="text" name="uname" maxlength="10" required>
					</div>
					<div class="w3-input-group">
						<label><b style="color:white">PASSWORD</b></label>
						<input class="w3-input" type="password" name="pwd" required>
					</div>
					<input class="w3-btn w3-brown" value="LOGIN" type="submit">
					<div style="float:right">
					<a href="recover.jsp"><b style="color:yellow">FORGOT PASSWORD</b></a>
					</div>
					<br>
					<br>
					<center><a style="text-decoration:none"href="signup.jsp"><b style="color:aqua;">NEED AN ACCOUNT</b></a></center>
				</form>
	</div>
</div>
<footer class="w3-container w3-brown w3-bottom" style="margin-top:12%;">
	<center>
		<nav class="w3-topnav w3-brown">
		<a href="homepage.jsp">HOME</a>
		</nav>
	</center>
</footer>
</body>
</html>
<%@ page language="java" import="java.sql.*"%>
<%
    String uname = request.getParameter("uname");
    String pwd = request.getParameter("pwd");
	if(uname!=null)
	{
    try
	{
        Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "ajeet");
        PreparedStatement ps = con.prepareStatement("select * from vmail where uname=? and pwd=?");
        ps.setString(1, uname);
        ps.setString(2, pwd);
        ResultSet rs = ps.executeQuery();
        int x = 0;
        while (rs.next())
		{
            if (rs.getString(1).equals(uname) && rs.getString(2).equals(pwd))
			{
                x = 1;
				session.setAttribute("uname",rs.getString(1));
				session.setAttribute("name",rs.getString(3));
				session.setAttribute("dob",rs.getString(6));
				session.setAttribute("profilepic",rs.getString(7));
				session.setAttribute("coverpic",rs.getString(8));
				session.setAttribute("mno",rs.getString(4));
				session.setAttribute("gender",rs.getString(5));
				
            } 
			else 
			{
                x = 2;
            }
        }
        if (x == 1) 
		{
			%>
				<script>
				alertify.alert("SUCCESSFULLY LOGIN...");
				setTimeout(function(){window.location.href='user.jsp'},2000);
				</script>
			<%
		}
		else
		{
			%>
				<script>
				alertify.alert("INVALID USERNAME OR PASSWORD.");
				</script>
			<%
		}
	}
	catch (Exception e)
	{
       out.println(e);
    } 
	}
%>