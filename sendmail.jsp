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
		try
		{
			String uname=(String)session.getAttribute("uname");
			String receiver=request.getParameter("receiver");  
			String subject=request.getParameter("subject");  
			String message="No Message";  
			String attachment="No Attachment";
			String td=request.getParameter("td");
			String addr="No Voice Mail";
			String jdbcdriver="oracle.jdbc.driver.OracleDriver";
			Class.forName(jdbcdriver);
			Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","ajeet");
			String sql="select * from vmail";
			PreparedStatement pst=con.prepareStatement(sql);
			ResultSet rs=pst.executeQuery();
			while(rs.next())
			{
				if(rs.getString(1).equals(receiver))
				{
					String query="insert into message values('"+uname+"','"+receiver+"','"+subject+"','"+message+"','"+attachment+"','"+td+"','"+addr+"')";
					PreparedStatement psmt=con.prepareStatement(query);
					int x = psmt.executeUpdate();
					if(x>0)
					{
						session.setAttribute("uname",uname);
						session.setAttribute("receiver",receiver);
						session.setAttribute("td",td);
						response.sendRedirect("sendtextmsg.jsp");
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
				else
				{
					%>
					<script>
					alertify.alert("RECEIVER DOES NOT EXIST. PLEASE TRY ANOTHER.");
					setTimeout(function(){window.location.href='compose.jsp'},3000);
					</script>
					<%
				}
			}
		}
		catch(Exception e)
		{
			out.println(e);
		}
	}
%>
	