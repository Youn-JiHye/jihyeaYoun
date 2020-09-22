<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<!--
	작성자: 윤지혜
	최종 수정일: 2020/09/14
	업데이트 버전: 1.0
-->
<html>
<head>
<meta charset="UTF-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="assets/css/main.css" />
</head>
<body>
	<%
		//로그인 한사람이면 userID라는 변수에 해당 아이디가 담기고 그렇지 않으면 null값
	String userID = null;
	if (session.getAttribute("userID") != null) {
		userID = (String) session.getAttribute("userID");
	}
	%>
	<header id="header">
		<h1>
			<a href="main_index.jsp">지혜의 아늑한 홈페이지</a>
		</h1>
		<nav class="links">
			<ul>
				<li><a href="#">Notice</a></li>
				<li><a href="#">Programming</a></li>
				<li><a href="#">Arts</a></li>
				<li><a href="#">Making Goods</a></li>
				<li><a href="#">Guest Book</a></li>
			</ul>
		</nav>
		<nav class="login">
			<%
				if (userID == null) {
			%>
			<ul>
				<li><a href="main_login.jsp" class="button small">login</a></li>
				<li><a href="main_join.jsp" class="button small">join</a></li>
			</ul>
			<%
				} else {
			%>
			<ul>
				<li><p><font color="pink"><a href="#"><%=userID %></a></font>님 안녕하세요 &nbsp;&nbsp;
				<li><a href="main_logout.jsp" class="button small">logout</a></li>
			</ul>
			<%
				}
			%>
		</nav>
		<nav class="main">
			<ul>
				<li class="menu"><a class="fa-bars" href="#menu">Menu</a></li>
			</ul>
		</nav>
	</header>

	<!-- Menu -->
	<section id="menu">
		<!-- Links -->
		<section>
			<ul class="links">
				<li><a href="#">
						<h3>Notice</h3>
						<p>공지사항 및 일정 게시판입니다.</p>
				</a></li>
				<li><a href="#">
						<h3>Programming</h3>
						<p>JAVA, 웹 프로그래밍 공부 게시판입니다.</p>
				</a></li>
				<li><a href="#">
						<h3>Arts</h3>
						<p>그림 게시판입니다.</p>
				</a></li>
				<li><a href="#">
						<h3>Making Goods</h3>
						<p>굿즈 후기 게시판입니다.</p>
				</a></li>
				<li><a href="#">
						<h3>Guest Book</h3>
						<p>방명록을 남겨 주세요.</p>
				</a></li>
			</ul>
		</section>
		<!-- Actions -->
		<section>
			<ul class="actions stacked">
				<li><a href="main_login.jsp" class="button large fit">Login</a></li>
			</ul>
		</section>
	</section>

	<!-- Scripts -->
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/browser.min.js"></script>
	<script src="assets/js/breakpoints.min.js"></script>
	<script src="assets/js/util.js"></script>
	<script src="assets/js/main.js"></script>
</body>
</html>