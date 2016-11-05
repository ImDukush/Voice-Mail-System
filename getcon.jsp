<%@ page import="java.sql.*" %>

<%
		String jdbcdriver="oracle.jdbc.driver.OracleDriver";
		Class.forName(jdbcdriver);
		Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","ajeet");
%>