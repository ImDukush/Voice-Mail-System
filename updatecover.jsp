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
<%
	String uname=(String)session.getAttribute("uname");
    String cover = uploadFile(application.getRealPath("/voice_mail/cover_photos"), "No Image", request);
    Class.forName("oracle.jdbc.OracleDriver");
    Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","ajeet");
    String sql="update VMAIL set coverpic='"+cover+"' where uname='"+uname+"'";
    PreparedStatement pst=con.prepareStatement(sql);
    int x=pst.executeUpdate();
    if(x>0)
    {
		session.setAttribute("coverpic",cover);
        response.sendRedirect("settings.jsp");
    }
    else
    {
        out.println(" No Update ");
    }
	}
%>