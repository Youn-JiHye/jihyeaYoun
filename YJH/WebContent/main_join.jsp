<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
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
				<div class="container login-container">
					<div class="login-form">
						<h3>회원정보 입력</h3>
						<form method="post" action="main_joinAction.jsp">
							<div>
								<div class="join-group">
									<input type="text" name="userID" placeholder="아이디" />
								</div>
								<div class="join-group">
									<input type="password" name="userPassword" placeholder="패스워드" />
								</div>
								<div class="join-group">
									<input type="text" name="userNickname"
										placeholder="닉네임(2글자~20글자)" />
								</div>
								<div class="join-group">
									<div class="row gtr-uniform">
										<div class="col-4 col-12-small">
											<input type="radio" id="demo-priority-low"
												name="userGender" value="여자" checked> <label
												for="demo-priority-low">여자</label>
										</div>
										<div class="col-4 col-12-small">
											<input type="radio" id="demo-priority-normal"
												name="userGender" value="남자"> <label
												for="demo-priority-normal">남자</label>
										</div>
									</div>
								</div>
								<div class="join-group">
									<input type="email" name="userEmail" placeholder="이메일" />
								</div>
								<div class="col-12">
									<input type="submit" value="제출" class="btnSubmit" />
								</div>
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