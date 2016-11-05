<%@page import ="java.sql.*" %>
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
	<link rel="stylesheet" href="css/bootstrap.min.css">
	<link rel="stylesheet" href="css/bootstrap-theme.min.css">
	<script src="css/jquery.min.js"></script>
	<script src="css/bootstrap.min.js"></script>
	<script type="text/javascript">
	$(document).ready(function(){
		$('[data-toggle="popover"]').popover({
			html: true,
			template: '<div class="popover"><div class="arrow"></div><h3 class="popover-title"></h3><div class="popover-content"></div><div class="popover-footer"><a href="" class="btn btn-info btn-sm">Close</a></div></div>'
								});
		
		// Custom jQuery to hide popover on click of the close button
		$(document).on("click", ".popover-footer .btn" , function(){
			$(this).parents(".popover").popover('hide');
		});
		
	});
	</script>

	<link rel="stylesheet" href="css_lib/w3.css">
	<link rel="stylesheet" href="font-awesome/css/font-awesome.min.css">
	<style>
	h5{font-weight:bold;}
	</style>
</head>
<body background="themes/lite.jpg">
<header class="w3-container w3-black" style="width:100%;">
<h2><%=session.getAttribute("uname")%>'S SENT MAILS</h2>
</header>
 <table class="w3-table w3-striped w3-bordered w3-border w3-hoverable w3-large">
				<thead>
					<tr class="w3-light-grey">
					<th><h5>FROM</h5></th>
					<th><h5>SUBJECT</h5></th>
					<th><h5>DATE</h5></th>
					<th><h5>MESSAGES</h5></th>
					<th><h5>ATTACHMENTS</h5></th>
					<th></th>
					</tr>
				</thead>
<%  
	try
	{
		String uname = (String)session.getAttribute("uname");
		String jdbcdriver="oracle.jdbc.driver.OracleDriver";
		Class.forName(jdbcdriver);
		Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","ajeet");
		PreparedStatement ps = con.prepareStatement("select * from MESSAGE where uname=?");
		ps.setString(1, uname);
		ResultSet rs = ps.executeQuery();
		while (rs.next())
		{
			%>	
			<tr>
			<td><%=rs.getString(2)%></td>
			<td><p style="text-overflow: ellipsis;width: 10em;white-space: nowrap; overflow:hidden;"><%=rs.getString(3)%></p></td>
			<td><p style="overflow:hidden;"><%=rs.getString(6)%></p></td>
			<td>
			<div class="bs-example">
			<button type="button" class="btn btn-info" data-toggle="popover"  data-content="<%=rs.getString(4)%>">VIEW MESSAGE</button>
			</div>
			
				
				
				
			</td>
			<td><a href="attachments/<%=rs.getString(5)%>" style="margin-left:35px;" download ><i class="fa fa-paperclip" aria-hidden="true"></i></a></td>
			<td><audio controls src="f:/downloads/<%=rs.getString(7)%>"></td>
			<td><input class="w3-check" type="checkbox"></td>
			</tr>
			<%
		}
	}
	catch(Exception e)
	{
		out.println(e);
	}
%>
</table> 
<footer class="w3-container w3-brown w3-bottom">
	<center><h5>VOICE MAIL @UIET</h5></center>
</footer>

</body>
</html>
<%
	}
%>