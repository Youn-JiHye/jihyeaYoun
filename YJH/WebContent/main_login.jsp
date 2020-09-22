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
						<h1>Login</h1>
					</div>
				</header>
				<div class="container login-container">
					<div class="login-form">
						<form name="loginform" action="main_loginAction.jsp" method="post">
							<div class="login-group">
								<input type="text" class="form-control" placeholder="아이디     *"
									value="" name="userID"/>
							</div>
							<div class="login-group">
								<input type="password" class="form-control"
									placeholder="패스워드     *" value="" name="userPassword"/>
							</div>
							<div class="login-group">
								<input type="submit" class="btnSubmit" value="Login" />
							</div>
							<div class="login-group">
								<p>아직 계정이 없으신가요? <a href="main_join.jsp" class="btnJoin">회원가입 하기</a>
							</div>
							<div class="login-group">
								<hr>
								<a href="#" class="btnJoin">아이디를 잊어버리셨나요?</a>
							</div>
						</form>
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