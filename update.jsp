<html>
<head>
<script src="alert/jquery.js"></script>
<script src="alert/alertify.min.js"></script>
<link rel="stylesheet" href="alert/alertify.core.css">
<link rel="stylesheet" href="alert/alertify.default.css">
</head>
<body>
<%@page language="java" %>
<%@ page import ="java.sql.*" %>
<%
	if(session.getAttribute("uname")==null)
	{
		response.sendRedirect("login.jsp");
	}
	else
	{
%>
<% 
	String pwd=request.getParameter("pwd");
	try
	{
		String str=session.getAttribute("uname").toString();
		String jdbcdriver="oracle.jdbc.driver.OracleDriver";
		Class.forName(jdbcdriver);
		Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","ajeet");
		Statement st=con.createStatement();
		String sql="update VMAIL set PWD='"+pwd+"' where UNAME='"+str+"'";
		PreparedStatement pst = con.prepareStatement(sql);
		int status = pst.executeUpdate();
		if(status>0)
		{
			%>
				<script>
				alertify.alert("PASSWORD UPDATED.");
				setTimeout(function(){window.location.href='login.jsp'},5000);
				</script>
			<%
		}
		else
		{
			%>
				<script>
				alertify.alert("TRY AGAIN...");
				setTimeout(function(){window.location.href='password.jsp'},2000);
				</script>
			<%
			
		}
	}
	catch(Exception e)
    {
        e.printStackTrace();
    }
%>
</body>
</html>
<%
	}
%>