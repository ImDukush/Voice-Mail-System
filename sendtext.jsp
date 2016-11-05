<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@include file="uploadfile.jsp" %>
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
	String receiver=(String)session.getAttribute("receiver");
	String td=(String)session.getAttribute("td");
	String message=request.getParameter("message");
    Class.forName("oracle.jdbc.OracleDriver");
    Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","ajeet");
    String sql="update message set textmsg='"+message+"' where uname='"+uname+"' and receiver='"+receiver+"' and td='"+td+"'";
    PreparedStatement pst=con.prepareStatement(sql);
    int x=pst.executeUpdate();
    if(x>0)
    {
       response.sendRedirect("sendattachment.jsp");
		
    }
    else
    {
		%>
			<script>
				alertify.alert("ERROR! TRY AGAIN...");
			</script>
		<%
    }
	}
%>