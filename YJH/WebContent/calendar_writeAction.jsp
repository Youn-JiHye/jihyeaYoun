<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO"%>
<!-- userdao 클래스 -->
<%@ page import="java.io.PrintWriter"%>

<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="cal" class="user.calendar" scope="page" />
<jsp:setProperty name="cal" property="calYear" />
<jsp:setProperty name="cal" property="calMonth" />
<jsp:setProperty name="cal" property="calDay" />
<jsp:setProperty name="cal" property="calSubject" />
<jsp:setProperty name="cal" property="calContents" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		UserDAO userDAO = new UserDAO(); //인스턴트 생성

	int result = userDAO.calendarinsert(cal.getCalYear(), cal.getCalMonth(), cal.getCalDay(), cal.getCalSubject(),
			cal.getCalContents());

	if (result == 1) {//로그인 성공
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("location.href = 'main_index.jsp'");
		script.println("</script>");
	} else if (result == -1) {//입력 실패
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('입력 실패.');");
		script.println("history.back()");
		script.println("</script>");
	} else if (result == -2) {//DB오류
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('데이터베이스 오류가 발생했습니다.');");
		script.println("history.back()");
		script.println("</script>");
	}
	%>
</body>
</html>