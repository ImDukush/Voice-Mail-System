<%@ page language="java" import="java.sql.*"%>
<html>
<head>
	<link rel="stylesheet" href="alert/alertify.core.css">
	<link rel="stylesheet" href="alert/alertify.default.css">

	<script src="alert/jquery.js"></script>
	<script src="alert/alertify.min.js"></script>
</head>
</html>
<%
    String uname = request.getParameter("uname");
    String mno = request.getParameter("mno");
    try
	{
        Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "ajeet");
        PreparedStatement ps = con.prepareStatement("select * from vmail where uname=? and mno=?");
        ps.setString(1, uname);
        ps.setString(2, mno);
        ResultSet rs = ps.executeQuery();
        int x = 0;
        while (rs.next())
		{
            if (rs.getString(1).equals(uname) && rs.getString(4).equals(mno))
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
			session.setAttribute("uname",uname);
			response.sendRedirect("password.jsp");
		}
		else
		{
			%>
				<script>
					alertify.alert("SOME ERROR OCCURED");
			        setTimeout(function(){window.location.href='recover.jsp'},5000);
				</script>
			<%
		}
	}
	catch (Exception ex)
	{
        out.println(ex);
    } 
%>