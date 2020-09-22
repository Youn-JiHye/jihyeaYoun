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
						<h1>JOIN</h1>
					</div>
				</header>
				<div class="login-sucess">
					<h3>회원가입 성공!</h3>
					<br>
					<p>
						<a href="main_login.jsp">로그인</a> 하러가기
					</p>
				</div>
			</article>

		</div>

		<!-- Footer -->
		<%@ include file="footer.jsp"%>


	</div>

	<!-- Scripts -->
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/browser.min.js"></script>
	<script src="assets/js/breakpoints.min.js"></script>
	<script src="assets/js/util.js"></script>
	<script src="assets/js/main.js"></script>
</body>
</html>