<html>
<head>
<title>SIGNUP</title>
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" href="css_lib/w3.css">
<link rel="stylesheet" href="alert/alertify.core.css">
<link rel="stylesheet" href="alert/alertify.default.css">

<script src="js/validDate.js"></script>
<script src="alert/jquery.js"></script>
<script src="alert/alertify.min.js"></script>

<script type="text/javascript">
function f1(){document.signup.name.value = document.signup.name.value.toUpperCase();}
function f2(){document.signup.uname.value = document.signup.uname.value.toUpperCase();}
function f3()
{
	if(document.signup.pwd.value.length<8)
	{
		alertify.alert("PASSWORD IS TOO SHORT! PASSWORD'S LENGHT SHOULD BE ATLEAST 8 CHARACTERS");
		document.signup.pwd.value="";
	}
}
function f4()
{
	if(document.signup.pwd.value!=document.signup.rpwd.value)
	{
		alertify.alert("PASSWORD DOESN'T MATCH!");
		document.signup.rpwd.value="";
	}
}
function f5()
{
	if(isNaN(document.signup.mno))
	{
		if(document.signup.mno.value.length!=10)
		{
			alertify.alert("INVALID MOBILE NUMBER!");
			document.signup.mno.value="";
		}
	}
}
function f6()
{
    var dob = document.signup.dob.value;
    var pattern = /^([0-9]{2})-([0-9]{2})-([0-9]{4})$/;
    if (!pattern.test(dob)) 
	{
       alertify.alert("DATE FORMAT NOT VALID!");
		
    }
}
</script>
</head>
<body>
		<header class="w3-container w3-brown">
			<h3><b>SIGNUP TO VOICE MAIL</b></h3>
		</header>
		<div class="w3-container">
			<div class="w3-card" style="width:50%;height:78%;margin-top:1.5%;margin-left:24%;">
				<form name="signup" class="w3-form" action="signup.jsp" onsubmit="return validateForm()" method="post">
				  <div class="w3-input-group"> 
					<input class="w3-input w3-border w3-sand" type="text" id="name" name="name" onblur="f1()" required placeholder="ENTER YOUR NAME"><br>
					<input class="w3-input w3-border w3-sand" type="text" name="uname" required onblur="f2()" placeholder="CREATE YOUR USERNAME"><br>
					<input class="w3-input w3-border w3-sand" type="password" name="pwd" required onblur="f3()" placeholder="ENTER YOUR PASSWORD"><br>
					<input class="w3-input w3-border w3-sand" type="password" name="rpwd" required onblur="f4()" placeholder="RE-ENTER YOUR PASSWORD"><br>
					<input class="w3-input w3-border w3-sand" type="text" name="mno" required id="mno" onblur="f5()" placeholder="ENTER YOUR MOBILE NUMBER"><br>
					<input class="w3-input w3-border w3-sand" type="text" name="dob" required onblur="f6()" placeholder="DATE OF BIRTH(DD-MM-YYYY)"><br>
					<select id="gender" onblur="f7()" name="gender" class="w3-input w3-border w3-sand">
						<option>MALE</option>
						<option>FEMALE</option>
					</select>
					<br>
					<input class="w3-btn w3-round w3-green" type="submit" value="SIGNUP">
					<a class="w3-btn w3-round w3-red" href="homepage.jsp" id="alert">CANCEL</a>
				  </div>
				</form>
			</div>
		</div>
	</div>
	<footer class="w3-container w3-teal w3-bottom">
	<center>
		<nav class="w3-topnav">
		<a href="homepage.jsp"><b>HOME</b></a>
		</nav>
	</center>
	</footer>
</body>
</html> 
<%@page language="java" %>
<%@page import ="java.sql.*" %>
<%@page import ="java.util.*" %>
<% 
	String uname=request.getParameter("uname");
	String pwd=request.getParameter("pwd");
	String name=request.getParameter("name"); 
	String mno=request.getParameter("mno");
	String gender=request.getParameter("gender");
	String dob=request.getParameter("dob");
	String pp="Dukush";
	String cp="Dukush";
	if(uname!=null)
	{
	try
	{
		String jdbcdriver="oracle.jdbc.driver.OracleDriver";
		Class.forName(jdbcdriver);
		Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","ajeet");
		String query="select * from vmail";
		PreparedStatement ps = con.prepareStatement(query);
		ResultSet rs = ps.executeQuery();
		if(rs.next())
		{
			if(rs.getString(1).equals(uname))
			{
				%>
				<script>
				alertify.alert("USERNAME ALREADY EXIST.");
				</script>
				<%
			}
			else
			{
				String sql="insert into VMAIL values(?,?,?,?,?,?,?,?)";
				PreparedStatement pst = con.prepareStatement(sql);
				pst.setString(1,uname);
				pst.setString(2,pwd);
				pst.setString(3,name);
				pst.setString(4,mno);
				pst.setString(5,gender);
				pst.setString(6,dob);
				pst.setString(7,pp);
				pst.setString(8,cp);
				int status = pst.executeUpdate();
				
				if(status>0)
				{
					session.setAttribute("uname",uname);
					session.setAttribute("name",name);
					session.setAttribute("dob",dob);
					session.setAttribute("mno",mno);
					session.setAttribute("gender",gender);
					response.sendRedirect("welcome.jsp");
				} 
				else
				{
					%>
					<script>
						alertify.alert("SOME ERROR! PLEASE TRY AGAIN...");
					</script>
					<%
				}
			}
		}
		else
		{
			%>
				<script>
				alertify.alert("SORRY! AN ERROR OCCURED. PLEASE TRY AGAIN.");
				</script>
			<%
		}
	}
	catch(SQLException e)
	{
		%>
					<script>
						alertify.alert("TRY DIFFERENT MOBILE NUMBER.ENTERED MOBILE NUMBER IS ALREADY USED.");
					</script>
		<%
	}
	}
%>
