<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- Site made with Mobirise Website Builder v4.7.6, https://mobirise.com -->
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="generator" content="Mobirise v4.7.6, mobirise.com">
<meta name="viewport"
	content="width=device-width, initial-scale=1, minimum-scale=1">
<link rel="shortcut icon" href="assets/images/-202x108.png"
	type="image/x-icon">
<meta name="description" content="Website Builder Description">
<title>SignUp</title>
<link rel="stylesheet"
	href="assets/web/assets/mobirise-icons/mobirise-icons.css">
<link rel="stylesheet" href="assets/tether/tether.min.css">
<link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet"
	href="assets/bootstrap/css/bootstrap-grid.min.css">
<link rel="stylesheet"
	href="assets/bootstrap/css/bootstrap-reboot.min.css">
<link rel="stylesheet" href="assets/dropdown/css/style.css">
<link rel="stylesheet" href="assets/theme/css/style.css">
<link rel="stylesheet" href="assets/mobirise/css/mbr-additional.css"
	type="text/css">



</head>
<body>

<% request.setCharacterEncoding("euc-kr"); 	
//한글 깨짐현상 방지를 위해 %>
	<section class="menu cid-r9Efrnmuzy" once="menu" id="menu2-12">



		<nav
			class="navbar navbar-expand beta-menu navbar-dropdown align-items-center navbar-fixed-top navbar-toggleable-sm">
			<button class="navbar-toggler navbar-toggler-right" type="button"
				data-toggle="collapse" data-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<div class="hamburger">
					<span></span> <span></span> <span></span> <span></span>
				</div>
			</button>
			<div class="menu-logo">
				<div class="navbar-brand">
					<span class="navbar-logo"> <a href="main.jsp"> <img
							src="assets/images/-202x108.png" alt="Mobirise" title=""
							style="height: 3.8rem;">
					</a>
					</span>

				</div>
			</div>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav nav-dropdown" data-app-modern-menu="true">
					<!--
            <li class="nav-item">
                    <a class="nav-link link text-black display-4" href="page5.html">
                        MY POS</a>
                </li>-->
					<li class="nav-item"><a
						class="nav-link link text-black display-4"
						href="https://mobirise.com"> About Us</a></li>
				</ul>
				<div class="navbar-buttons mbr-section-btn">
					<a class="btn btn-sm btn-primary-outline display-4"
						href="login.html#header15-a">로그인</a>
				</div>
			</div>
		</nav>
	</section>

	<section class="engine">
		<a href="https://mobirise.me/u">bootstrap html templates</a>
	</section>
	<section class="cid-r9EeKVD1Qi mbr-fullscreen mbr-parallax-background"
		id="header15-11">



		<div class="mbr-overlay"
			style="opacity: 0.5; background-color: rgb(118, 118, 118);"></div>

		<div class="container align-center">
			<div class="row">
				<div class="mbr-white col-lg-8 col-md-7 content-container">
					<h1
						class="mbr-section-title mbr-bold pb-3 mbr-fonts-style display-2">
						<span style="font-weight: normal;">회원가입</span>
					</h1>
					<p class="mbr-text pb-3 mbr-fonts-style display-5">
						<em>OraCaffè</em>의 다양한 서비스를 경험해보세요!
					</p>
				</div>
				<div class="col-lg-4 col-md-5">
					<div class="form-container">
						<!-- action=""-->
						<form class="mbr-form" action="insert_host.jsp" method="post"
							data-form-title="Mobirise Form">
							<div data-for="id">
								<div class="form-group">
									<input type="text" class="form-control px-3" name="h_id"
										data-form-field="ID" placeholder="아이디" maxlength="16"
										minlength="4" required="" >
								</div>
							</div>
							<div data-for="password">
								<div class="form-group">
									<input type="password" class="form-control px-3"
										id="host_password" name="h_pw" data-form-field="Password"
										maxlength="16" minlength="4" placeholder="비밀번호" required=""
										>
								</div>
							</div>

							<div data-for="confirm-password">
								<div class="form-group">
									<input type="password" class="form-control px-3"
										id="host_password_confirm" name="h_confirm_pw"
										data-form-field="Password" maxlength="16" minlength="4"
										placeholder="비밀번호 확인" required=""
										>
								</div>

							</div>

							<div class="alert alert-success" id="alert-success">비밀번호가
								일치합니다.</div>
							<div class="alert alert-danger" id="alert-danger">비밀번호가
								일치하지 않습니다.</div>

							<div data-for="name">
								<div class="form-group">
									<input type="name" class="form-control px-3" name="h_name"
										data-form-field="Name" maxlength="10" minlength="2"
										placeholder="사업자이름" required="" >
								</div>
							</div>
							<!--custom.js 안에 함수 포함되어있다 -->
							<div data-for="tel">
								<div class="form-group">
									<input type="text" class="form-control px-3" name="h_tel"
										id="cellPhone" data-form-field="Tel" placeholder="전화번호"
										required="" minlength="12" maxlength="13">
								</div>
							</div>

							<span class="input-group-btn"><button href=""
									type="submit" class="btn btn-form btn-primary display-4"
									id="register_btn">회원가입</button></span>
						</form>
					</div>
				</div>

			</div>
		</div>

	</section>


	<section class="cid-r9omqYlnFC" id="footer5-s">

		<div class="container">
			<div class="media-container-row">
				<div class="col-md-3">
					<div class="media-wrap">
						<a href="https://mobirise.com/"> <img
							src="assets/images/-202x108.png" alt="Mobirise" title="">
						</a>
					</div>
				</div>
				<div class="col-md-9">
					<p class="mbr-text align-right links mbr-fonts-style display-7">
						<a href="#" class="text-black">ABOUT</a> &nbsp;&nbsp;&nbsp;&nbsp;
						<a href="#" class="text-black">TERMS</a> &nbsp;&nbsp;&nbsp;&nbsp;
						<a href="#" class="text-black">CAREERS</a>
						&nbsp;&nbsp;&nbsp;&nbsp; <a href="#" class="text-black">CONTACT</a>
					</p>
				</div>
			</div>
			<div class="footer-lower">
				<div class="media-container-row">
					<div class="col-md-12">
						<hr>
					</div>
				</div>
				<div class="media-container-row mbr-white">
					<div class="col-md-6 copyright">
						<p class="mbr-text mbr-fonts-style display-7">© Copyright 2018
							DB_PROJECT_TEAM1 - All Rights Reserved</p>
					</div>
					<div class="col-md-6">
						<div class="social-list align-right">
							<div class="soc-item">
								<a href="https://twitter.com/mobirise" target="_blank"> <span
									class="socicon-twitter socicon mbr-iconfont mbr-iconfont-social"></span>
								</a>
							</div>
							<div class="soc-item">
								<a
									href="https://www.facebook.com/pages/Mobirise/1616226671953247"
									target="_blank"> <span
									class="socicon-facebook socicon mbr-iconfont mbr-iconfont-social"></span>
								</a>
							</div>




						</div>
					</div>
				</div>
			</div>
		</div>
	</section>



	<script src="assets/web/assets/jquery/jquery.min.js"></script>
	<script src="assets/popper/popper.min.js"></script>
	<script src="assets/tether/tether.min.js"></script>
	<script src="assets/bootstrap/js/bootstrap.min.js"></script>
	<script src="assets/smoothscroll/smooth-scroll.js"></script>
	<script src="assets/parallax/jarallax.min.js"></script>
	<script src="assets/dropdown/js/script.min.js"></script>
	<script src="assets/touchswipe/jquery.touch-swipe.min.js"></script>
	<script src="assets/theme/js/script.js"></script>
	<script src="assets/formoid/formoid.min.js"></script>
	<script src="assets/custom/js/custom.js"></script>


</body>
</html>
    