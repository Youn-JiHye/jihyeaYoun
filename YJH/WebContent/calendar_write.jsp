<%@ page info="diary calendar"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page language="java"
	import="java.sql.*,java.io.*,java.net.*,java.util.*"%>

<jsp:useBean id="myutil" class="user.MyUtil" scope="request" />
<%
	String year = myutil.checkNull(request.getParameter("year"));
String month = myutil.checkNull(request.getParameter("month"));
String day = myutil.checkNull(request.getParameter("day"));
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
				<form method="post" name="CalendarInput"
					action="calendar_writeAction.jsp">
					<input type="hidden" name="calYear" value="<%=year%>" /> <input
						type="hidden" name="calMonth" value="<%=month%>" /> <input
						type="hidden" name="calDay" value="<%=day%>" />
					<%=year%>년
					<%=month%>월
					<%=day%>일
					</td> <br>제목: <input type="text" name="calSubject" maxlength="20"
						id="testInput"> <br>내용:
					<textarea name="calContents" cols="30" rows="5"></textarea>
					<input type="submit" value="전송" id="submitBtn"> <input
						type="button" value="취소" onClick="location='main_index.jsp'">
				</form>
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