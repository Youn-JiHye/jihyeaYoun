<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.sql.*,java.io.*,java.net.*,java.util.*"%>

<%@ page info="diary calendar"%>
<%@page import="javax.sql.*"%>
<%@page import="javax.naming.*"%>
<%@page import="java.sql.*"%>
<jsp:useBean id="dbconn" class="user.UserDAO" scope="request" />
<jsp:useBean id="myutil" class="user.MyUtil" scope="request" />

<%
	Connection conn = null;
Statement stmt = null;
ResultSet rs = null;

String strYear = request.getParameter("year");
String strMonth = request.getParameter("month");
String query = new String();
String url = new String();
String subject = new String();
String selected = new String();

//달력객체 생성
Calendar myCalendar = Calendar.getInstance();

int year = 0;
int month = 0;
int previous_year = 0;
int previous_month = 0;
int next_year = 0;
int next_month = 0;
int day = 0;
int id = 0;

int t_year = 0;
int t_month = 0;
int t_day = 0;

t_year = myCalendar.get(myCalendar.YEAR);
t_month = myCalendar.get(myCalendar.MONTH) + 1;
t_day = myCalendar.get(myCalendar.DAY_OF_MONTH);

try {
	conn = dbconn.getConnection();
	stmt = conn.createStatement();
} catch (SQLException e) {
}

if (strYear == null) {
	year = myCalendar.get(myCalendar.YEAR);
} else {
	year = Integer.parseInt(strYear);
}

if (strMonth == null) {
	month = myCalendar.get(myCalendar.MONTH);
} else {
	month = Integer.parseInt(strMonth) - 1;
}

myCalendar.set(myCalendar.YEAR, year);
myCalendar.set(myCalendar.MONTH, month);
month = month + 1;

previous_year = myCalendar.get(myCalendar.YEAR) - 1;
previous_month = myCalendar.get(myCalendar.MONTH);

if (previous_month < 1) {
	previous_month = 12;
} else if (previous_month > 12) {
	previous_month = 1;
}

next_year = myCalendar.get(myCalendar.YEAR) + 1;
next_month = myCalendar.get(myCalendar.MONTH) + 2;

if (next_month < 1) {
	next_month = 12;
} else if (next_month > 12) {
	next_month = 1;
}
%>


<!DOCTYPE HTML>
<!--
	작성자: 윤지혜
	최종 수정일: 2020/09/14
	업데이트 버전: 1.0
-->
<html>
<head>
<title>윤지혜의 홈페이지입니다.</title>
<meta charset="UTF-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
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
				<form method="post" action="main_index.jsp">
					<table>
						<tr>
							<td><a
								href="main_index.jsp?year=<%=previous_year%>&month=<%=month%>"><img
									src="images/left_year.gif"></a> <a
								href="main_index.jsp?year=<%=previous_month == 12 ? previous_year : year%>&month=<%=previous_month%>"><img
									src="images/left_month.gif"></a></td>
							<td align="center" class="title" style="table-layout: fixed">
							<select name="year" class="Calendar-select">
									<%
										for (int i = -5; i < 5; i++) {
										int temp_year = year + i;
										if (year == temp_year) {
											selected = "selected";
										} else {
											selected = "";
										}
									%>
									<option value="<%=temp_year%>" <%=selected%>><%=temp_year%></option>
									<%
										}
									%>
							</select>년 <select name="month" class="Calendar-select">
									<%
										for (int i = 1; i <= 12; i++) {
										if (month == i) {
											selected = "selected";
										} else {
											selected = "";
										}
									%>
									<option value="<%=i%>" <%=selected%>><%=i%></option>
									<%
										}
									%>
							</select>월 <input type="submit" value="이동" class="title">
							</td>
							<td><a
								href="main_index.jsp?year=<%=next_month == 1 ? next_year : year%>&month=<%=next_month%>"><img
									src="images/right_month.gif"></a>
								<a href="main_index.jsp?year=<%=next_year%>&month=<%=month%>"><img
									src="images/right_year.gif"></a>
							</td>
						</tr>
					</table>
					<table style="table-layout: fixed">
						<tr align="center" valing="middle">
							<td class="title"><font color="red">일</font></td>
							<td class="title">월</td>
							<td class="title">화</td>
							<td class="title">수</td>
							<td class="title">목</td>
							<td class="title">금</td>
							<td class="title"><font color="blue">토</font></td>
						</tr>
						<%
							while (true) {
							day++;

							//날짜를 day 값으로 세팅
							myCalendar.set(myCalendar.DAY_OF_MONTH, day);

							//달력의 날짜가 다음달로 넘어가면 day 값이랑 달라짐
							if (day != myCalendar.get(myCalendar.DAY_OF_MONTH)) {
								break;
							}

							if (day == 1) {
								out.println("<tr align='right' valign='top'>");

								//요일 수만큼 빈칸 만들기
								for (int j = 1; j < myCalendar.get(myCalendar.DAY_OF_WEEK); j++) {
							out.print("<td weight=15% height=100px>&nbsp;</td>");
								}
							}

							try {
								id = 0;
								query = "SELECT ID, CAL_SUBJECT from YJH_CALENDAR WHERE CAL_YEAR='" + year + "'";
								query = query + " and CAL_MONTH='" + month + "' and CAL_DAY='" + day + "'";
								rs = stmt.executeQuery(query);

								if (rs.next()) {
							id = rs.getInt("id");
							subject=rs.getString("CAL_SUBJECT");
								}
							} catch (SQLException e) {
							}

							if (id > 0) {
								out.println("<td>");
								url = "calendar_view.jsp?id=" + id + "&mode=view";
							} else {
								out.println("<td weight=15% height=100px>");
								url = "calendar_view.jsp?year=" + year + "&month=" + month + "&day=" + day + "&mode=insert";
							}
							out.println("<a href='" + url + "'>");

							//요일이 일요일이면 빨간색으로 표시
							if (myCalendar.get(myCalendar.DAY_OF_WEEK) == myCalendar.SUNDAY) {
								out.println("<font color=red>");
								out.println(myCalendar.get(myCalendar.DAY_OF_MONTH));
								out.println("</font>");

							} else if (myCalendar.get(myCalendar.DAY_OF_WEEK) == myCalendar.SATURDAY) {
								//요일이 토요일이면 파란색으로 표시					
								out.println("<font color=blue>");
								out.println(myCalendar.get(myCalendar.DAY_OF_MONTH));
								out.println("</font>");

							} else if (t_year == year & t_month == month & t_day == day) {
								//오늘일 경우 폰트는 크고 색깔은 검은색으로				
								out.println("<font color=#EE7EAD><b>");
								out.println(myCalendar.get(myCalendar.DAY_OF_MONTH));
								out.println("</b></font>");	
							} else {
								out.println(myCalendar.get(myCalendar.DAY_OF_MONTH));
							}
							 if(id>0) {
								 out.println("<br>");
								 out.println("<font color=pink>"+subject+"</font>");
								 }
							out.println("</a></td>");
							//요일이 토요일이면 다음줄로 내림
							if (myCalendar.get(myCalendar.DAY_OF_WEEK) == myCalendar.SATURDAY) {
								out.println("</tr>");
								out.println("<tr align='right' valign='top'>");
							}
						}
						//마지막이 토요일로 끝나지 않았으면 줄을 닫아줌
						if (myCalendar.get(myCalendar.DAY_OF_WEEK) != myCalendar.SATURDAY) {
							out.println("</tr>");
						}
						
						%>
					</table>
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