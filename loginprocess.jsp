<html>
<head>
<link rel="stylesheet" href="alert/alertify.core.css">
<link rel="stylesheet" href="alert/alertify.default.css">

<script src="alert/jquery.js"></script>
<script src="alert/alertify.min.js"></script>
</head>
</html>
<%@ page language="java" import="java.sql.*"%>
<%
    String uname = request.getParameter("uname");
    String pwd = request.getParameter("pwd");
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
				session.setAttribute("name",rs.getString(3));
				session.setAttribute("uname",rs.getString(1));
            } 
			else 
			{
                x = 2;
            }
        }
        if (x == 1) 
		{
			response.sendRedirect("user.jsp?username:"+uname);
		}
		else
		{
			%>
				<script>
				alertify.alert("INVALID USERNAME OR PASSWORD.");
				</script>
			<%
			response.sendRedirect("homepage.jsp");
		}
	}
	catch (Exception e)
	{
       out.println("error...");
    } 
%>