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
    String profile = uploadFile(application.getRealPath("/voice_mail/profile_photos"), "pic", request);
    Class.forName("oracle.jdbc.OracleDriver");
    Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","ajeet");
    String sql="update VMAIL set profilepic='"+profile+"' where uname='"+uname+"'";
    PreparedStatement pst=con.prepareStatement(sql);
    int x=pst.executeUpdate();
    if(x>0)
    {
		session.setAttribute("profilepic",profile);
        response.sendRedirect("uploadcoverphoto.jsp");
    }
    else
    {
        out.println(" No Update ");
    }
%>
<%
	}
%>