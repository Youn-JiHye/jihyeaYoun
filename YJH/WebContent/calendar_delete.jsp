<%@ page info="diary calendar" %>
<%@ page contentType="text/html; charset=euc-kr" %>
<%@ page language="java" import="java.sql.*,java.io.*,java.net.*,java.util.*" %>

<jsp:useBean id = "dbconn" class="user.UserDAO" scope="request" />
<jsp:useBean id = "myutil" class="user.MyUtil" scope="request" />  

<%
	Connection conn = null;
	Statement stmt = null;
	
	String id = myutil.checkNull2(request.getParameter("id"));
	String query = new String();
	
	try {
		conn = dbconn.getConnection();
		stmt = conn.createStatement();
		
		query = "delete from YJH_CALENDAR where id=" + id;
		stmt.executeUpdate(query);
	} catch(SQLException e){
	}
	
	response.sendRedirect("main_index.jsp");
%>