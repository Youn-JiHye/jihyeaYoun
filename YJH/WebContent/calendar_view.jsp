<%@ page info="diary calendar"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page language="java"
	import="java.sql.*,java.io.*,java.net.*,java.util.*"%>

<jsp:useBean id="dbconn" class="user.UserDAO" scope="request" />
<jsp:useBean id="myutil" class="user.MyUtil" scope="request" />


<%
	Connection conn = null;
Statement stmt = null;
ResultSet rs = null;

String mode = myutil.checkNull(request.getParameter("mode"));
String id = myutil.checkNull2(request.getParameter("id"));
String year = new String();
String month = new String();
String day = new String();
String subject = new String();
String contents = new String();
String created = new String();
String query = new String();

if (mode.equals("view")) {// start if
	try {
		conn = dbconn.getConnection();
		stmt = conn.createStatement();
	} catch (SQLException e) {
	}

	try {
		query = "SELECT * FROM YJH_CALENDAR WHERE ID = " + id;
		rs = stmt.executeQuery(query);

		if (rs.next()) {
	year = myutil.checkNull(rs.getString("CAL_YEAR"));
	month = myutil.checkNull(rs.getString("CAL_MONTH"));
	day = myutil.checkNull(rs.getString("CAL_DAY"));
	subject = myutil.checkNull(rs.getString("CAL_SUBJECT"));
	contents = myutil.checkNull(rs.getString("CAL_CONTENTS"));
	created = myutil.checkNull(rs.getString("CAL_CREATED"));
		}
		rs.close();

		contents = myutil.n12br(contents);
	} catch (SQLException e) {
	}

} //end if

if (mode.equals("insert")) {
	year = myutil.checkNull(request.getParameter("year"));
	month = myutil.checkNull(request.getParameter("month"));
	day = myutil.checkNull(request.getParameter("day"));
}
%>

<html>
<head>
<title>다이어리</title>
<link rel="stylesheet" href="assets/css/main.css" />
</head>
<body class="is-preload">
	<!-- Wrapper -->
	<div id="wrapper">

		<!-- Header -->
		<%@ include file="header.jsp"%>

		<!-- Main -->
		<div id="main">

			<!-- Post -->
			<article class="post">
				<header>
					<div class="title">
						<h2>Monthly Schedule</h2>
					</div>
				</header>
				<table width="235" height="180" align="center">
					<tr>
						<td align="center" valign="top">
							<!-- 모드가 insert일때 시작--> <%
 	if (mode.equals("insert")) {
 %>
							<table width="210" height="145" align="center">
								<tr>
									<td width="210" height="50" align="left" class="title"><img
										src="images/point.gif" border="0" align="absmiddle">&nbsp;<%=year%>년
										<%=month%>월 <%=day%>일 <br>&nbsp;&nbsp;스케줄이 없습니다.<br>일정은 관리자만 추가, 삭제 가능합니다.</td>
								</tr>
									<table width="210" height="25" align="center">
										<tr>
											<td width="210" height="20" align="center">
												<a href="main_index.jsp"><img src="images/list.gif" alt="diary_list.gif"></a>								
												<%
												stmt = null;
												rs = null;
												String manage=null;
												conn = dbconn.getConnection();
												stmt = conn.createStatement();
												
												if (session.getAttribute("userID") != null) {
													userID = (String) session.getAttribute("userID");
												
													try {
														query = "SELECT USER_MANAGE from YJH_USER WHERE USER_ID='" + userID + "'";
														rs = stmt.executeQuery(query);
														if(rs.next()){
															manage=rs.getString("USER_MANAGE");
														}
													} catch (SQLException e) {
													}
													if(manage.equals("Y")){
												%>
												<a href="calendar_write.jsp?mode=insert&year=<%=year%>&month=<%=month%>&day=<%=day%>"><img
													src="images/write.gif" alt="new_write.gif"></a>
												<%} 
												}
												%>	
												</td>
										</tr>
									</table>

									<%
										}
									%>
									<%
										if (mode.equals("view")) {
									%>
									<table>
										<tr>
											<td class="title"><%=year%>년
												<%=month%>월 <%=day%>일
											</td>
										</tr>
										<tr>
											<td class="title">제목 <%=subject%></td>
										</tr>
										<tr>
											<td class="title"><%=contents%></td>
										</tr>
									</table>
									<table width="210" height="25" align="center">
										<tr>
											<td width="210" height="20" align="center">
												<a href="main_index.jsp"><img src="images/list.gif" alt="diary_list.gif"></a>
												<%
												stmt = null;
												rs = null;
												String manage=null;
												conn = dbconn.getConnection();
												stmt = conn.createStatement();
												
												if (session.getAttribute("userID") != null) {
													userID = (String) session.getAttribute("userID");
												
													try {
														query = "SELECT USER_MANAGE from YJH_USER WHERE USER_ID='" + userID + "'";
														rs = stmt.executeQuery(query);
														if(rs.next()){
															manage=rs.getString("USER_MANAGE");
														}
													} catch (SQLException e) {
													}
													if(manage.equals("Y")){
												%>
												<a href="calendar_delete.jsp?mode=delete&id=<%=id%>"><img
													src="images/delete.gif"alt="delete.gif"></a>
												<%
													} 
												}
												%>
												</td>
										</tr>
									</table>
									<%
										}
									%>
									</td>
									</tr>
								</table>
								</article>

								</div>

								<!-- Sidebar -->
								<!-- Footer -->
								<%@ include file="footer.jsp"%>

								<!-- Scripts -->
								<script src="assets/js/jquery.min.js"></script>
								<script src="assets/js/browser.min.js"></script>
								<script src="assets/js/breakpoints.min.js"></script>
								<script src="assets/js/util.js"></script>
								<script src="assets/js/main.js"></script>
</body>
</html>