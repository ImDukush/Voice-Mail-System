<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
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
<link rel="stylesheet" href="alert/alertify.core.css">
<link rel="stylesheet" href="alert/alertify.default.css">

<script src="alert/jquery.js"></script>
<script src="alert/alertify.min.js"></script>
</head>
</html>
<% 
	String uname=(String)session.getAttribute("uname");
	String name=request.getParameter("name"); 
	String pwd=request.getParameter("pwd");
	String mno=request.getParameter("mno");
	String dob=request.getParameter("dob");
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
				String sql="update vmail set name='"+name+"',pwd='"+pwd+"',dob='"+dob+"' where uname='"+uname+"'";
				PreparedStatement pst = con.prepareStatement(sql);
				int status = pst.executeUpdate();
				
				if(status>0)
				{
					%>
					%>
					<script>
						alertify.alert("SUCCESSFULLY COMPLETED YOUR SENDING PROCESS. SEND ANOTHER");
						setTimeout(function(){window.location.href='user.jsp'},2000);
					</script>
			<%
					<%
		
				} 
				else
				{
					%>
					<script>
						alertify.alert("TRY AGAIN...");
					</script>
					<%
				}
			}
		}
		else
		{
			%>
				<script>
					alertify.alert("NO DATA UPDATED");
				</script>
			<%
			
		}
	}
	catch(SQLException e)
	{
		%>
					<script>
					setTimeout(function(){alertify.alert("TRY DIFFERENT MOBILE NUMBER.ENTERED MOBILE NUMBER IS ALREADY USED."); ;}, 2000);
					location.href="settings.jsp";
}
						
					</script>
		<%
	}
	}
	}
%>