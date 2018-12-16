<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page language="java" import="java.sql.*"%>
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
<meta name="description" content="Web Site Builder Description">
<title>CafeInfo</title>
<link rel="stylesheet" href="assets/tether/tether.min.css">
<link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet"
	href="assets/bootstrap/css/bootstrap-grid.min.css">
<link rel="stylesheet"
	href="assets/bootstrap/css/bootstrap-reboot.min.css">
<link rel="stylesheet" href="assets/dropdown/css/style.css">
<link rel="stylesheet"
	href="assets/datatables/data-tables.bootstrap4.min.css">
<link rel="stylesheet" href="assets/theme/css/style.css">
<link rel="stylesheet" href="assets/mobirise/css/mbr-additional.css"
	type="text/css">
<link rel="stylesheet" href="assets/custom/css/custom.css"
	type="text/css">


</head>
<body>
	<section class="menu cid-r9nsSrdFwK" once="menu" id="menu2-d">



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
					<%
						request.setCharacterEncoding("UTF-8"); //한글 깨짐현상 방지

						if (session.getAttribute("signedUserName") != null) {
							out.println("<li class='nav-item'>");
							out.println(session.getAttribute("signedUserName") + "님 반갑습니다.</li>");
							out.println(
									"<li class='nav-item'><a class='nav-link link text-black display-4' href='cafe_register.jsp'>MY PAGE</a></li>");

						}
					%>

					<li class="nav-item"><a
						class="nav-link link text-black display-4"
						href="https://mobirise.com"> About Us </a></li>
				</ul>
				<%
					if (session.getAttribute("signedUserName") == null) {
						out.println(
								"<div class='navbar-buttons mbr-section-btn'><a class='btn btn-sm btn-primary-outline display-4' href='login.html#header15-a'>로그인</a></div>");
					} else {
						out.println(
								"<div class='navbar-buttons mbr-section-btn'><a class='btn btn-sm btn-primary-outline display-4' href='logout.jsp'>로그아웃</a></div>");
					}
				%>

			</div>
		</nav>
	</section>


	<section class="mbr-section content4 cid-rckzJPKDCD" id="content4-c">

		<div class="container">
			<div class="media-container-row">
				<div class="title col-12 col-md-8">
					<h2 class="align-center pb-3 mbr-fonts-style display-2">" "</h2>
					<h2 class="align-center pb-3 mbr-fonts-style display-2">
						<br>
					</h2>


				</div>
			</div>
		</div>
	</section>


	<section class="mbr-section article content9 cid-rckzNfVDdj"
		id="content9-d">

<div class="sidenav col-md-2">
			<%
				String username = (String) session.getAttribute("signedUserName");
			%>
			<h5><%=username%>님
			</h5>

			<h5>환영합니다.</h5>
			<hr>
			<a class="btn btn-primary"  href="manage_cafe.jsp">카페관리</a> <a class="btn btn-white-outline" href="#services">매출관리</a> <a class="btn btn-white-outline"
				href="get_host_info.jsp">회원정보</a> <a class="btn btn-white-outline" href="cafe_register.jsp">카페등록</a> <a class="btn btn-white-outline"
				href="category_register.jsp">카테고리등록</a> 
				<hr>
		</div>

		<div class="container">
			<div class="inner-container" style="width: 100%;">
				<hr class="line" style="width: 25%;">
				<div class="section-text align-center mbr-fonts-style display-6">
					<%
						request.setCharacterEncoding("UTF-8"); //한글 깨짐현상 방지

						String url = "jdbc:oracle:thin:@localhost:1521:oraknu";
						String user = "dbtp";
						String pass = "dbtp";
						Connection conn = null;
						String sql = null;
						String query = null;
						int result;

						try {
							Class.forName("oracle.jdbc.driver.OracleDriver");
							System.out.println("드라이버 검색 성공!");
						} catch (ClassNotFoundException e) {
							System.err.println("error = " + e.getMessage());
							System.exit(1);
						}

						try {
							conn = DriverManager.getConnection(url, user, pass);
						} catch (SQLException e) {
							System.err.println("sql error = " + e.getMessage());
							System.exit(1);
						}

						try {
							conn.setAutoCommit(false);
							PreparedStatement pstmt = null;

							//temporary
							String input_h_name = session.getAttribute("signedUserName").toString();
							String host_name = null;
							String host_tel = null;
							String host_id = null;
							String host_pw = null;

							query = "select * from host where h_name=?";
							pstmt = conn.prepareStatement(query);
							pstmt.setString(1, input_h_name);
							ResultSet rs = pstmt.executeQuery();

							while (rs.next()) {
								host_name = rs.getString("h_name");
								host_tel = rs.getString("h_tel");
								host_id = rs.getString("h_id");
								host_pw = rs.getString("h_pw");
								System.out.println("host name: " + host_name);
								System.out.println("host telephone: " + host_tel);
								System.out.println("host id: " + host_id);
							}

							out.println("<br>" + host_id + "님의 정보입니다." + "<br><br>");
							//if(host_tel != null)

							out.println("사업자 이름: " + host_name + "<br>");
							out.println("등록된 전화번호: " + host_tel + "<br><br>");
							rs.close();
							System.out.println();

							conn.commit();
							conn.setAutoCommit(true);
							conn.close();
						} catch (Exception e) {
							System.err.println("sql error = " + e.getMessage());
						}
					%>
				</div>
				<hr class="line" style="width: 25%;">
			</div>
		</div>
	</section>

	<div class="mbr-section-btn">
		<a class="btn btn-md btn-primary display-4" href="#updateTel">전화번호
			업데이트</a>
	</div>



	<section class="cid-r9nu8gDQMB" id="footer5-4">

		<div class="col-md-9">
			<p class="mbr-text align-right links mbr-fonts-style display-7">
				<a href="#" class="text-black">ABOUT</a> &nbsp;&nbsp;&nbsp;&nbsp; <a
					href="#" class="text-black">TERMS</a> &nbsp;&nbsp;&nbsp;&nbsp; <a
					href="#" class="text-black">CAREERS</a> &nbsp;&nbsp;&nbsp;&nbsp; <a
					href="#" class="text-black">CONTACT</a>
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
	<script src="assets/dropdown/js/script.min.js"></script>
	<script src="assets/touchswipe/jquery.touch-swipe.min.js"></script>
	<script src="assets/parallax/jarallax.min.js"></script>
	<script src="assets/datatables/jquery.data-tables.min.js"></script>
	<script src="assets/datatables/data-tables.bootstrap4.min.js"></script>
	<script src="assets/theme/js/script.js"></script>


</body>
</html>