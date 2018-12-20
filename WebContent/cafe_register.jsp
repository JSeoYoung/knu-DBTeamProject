<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page language="java" import="java.sql.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="generator" content="Mobirise v4.7.6, mobirise.com">
<meta name="viewport"
	content="width=device-width, initial-scale=1, minimum-scale=1">
<link rel="shortcut icon" href="assets/images/-202x108.png"
	type="image/x-icon">
<meta name="description" content="Website Builder Description">
<title>MyPage</title>
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
<link rel="stylesheet" href="assets/custom/css/custom.css">



</head>

<body>

	<section class="menu cid-r9nsSrdFwK" once="menu" id="menu2-1">
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

					<li class="nav-item"><a
						class="nav-link link text-black display-4"
						href="https://mobirise.com"> About Us </a></li>
				</ul>
				<div class="navbar-buttons mbr-section-btn">
					<a class="btn btn-sm btn-primary-outline display-4"
						href="logout.jsp">로그아웃</a>
				</div>
			</div>
		</nav>
	</section>


	<section class="mbr-fullscreen mbr-parallax-background" id="header2-o">


		<div class="sidenav col-md-2">
			<%
				request.setCharacterEncoding("UTF-8");
				String username = (String) session.getAttribute("signedUserName");
			%>
			<h5><%=username%>님
			</h5>

			<h5>환영합니다.</h5>
			<hr>
			
				<a class="btn btn-white-outline" href="manage_cafe.jsp">카페관리</a> <a class="btn btn-white-outline"
				href="get_host_info.jsp">회원정보</a> <a class="btn btn-primary" href="cafe_register.jsp">카페등록</a> <a class="btn btn-white-outline"
				href="category_register.jsp">카테고리등록</a> 
				<hr>
		</div>

	
		<div class="col-md-10">
			<div class="container scroll" style="overflow-y: scroll; height: 570px;">
				<h3
					class="mbr-section-title align-left pb-3 mbr-fonts-style display-2">카페
					등록</h3>

				<!-- /.row -->
				<div class="form-container">
					<form class="mbr-form" action="insert_cafe.jsp" method="post">
						<div class="row">

							<div class="col-md-6 multi-horizontal">

								<div class="form-group">
									<input class="form-control px-3" type="text"
										placeholder="카페 이름" name="c_name">
								</div>
							</div>

							<div class="col-md-6 multi-horizontal">

								<div class="form-group">
									<select class="form-control" id="cafe_category" name="cc_name">
										<option value="default">카페 카테고리</option>

										<%
											String url = "jdbc:oracle:thin:@localhost:1521:oraknu";
											String user = "dbtp";
											String pass = "dbtp";
											Connection conn = null;
											String query = null;
											String sql = null;
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
												System.err.println("connect sql error = " + e.getMessage());
												System.exit(1);
											}

											try {
												conn.setAutoCommit(false);
												Statement stmt = conn.createStatement();

												sql = "SELECT * FROM cafe_category";
												ResultSet rs = stmt.executeQuery(sql);

												while (rs.next()) {
													int cc_id = rs.getInt(1);
													String cc_name = rs.getString("cc_name");
													System.out.println("cafe category id = " + cc_id + "cafe category name = " + cc_name);
													out.println("<option value='" + cc_id + "'>" + cc_name + "</option>");
												}
												rs.close();
												conn.commit();
												conn.setAutoCommit(true);
												stmt.close();
												conn.close();

											} catch (Exception e) {
												System.err.println("sql error = " + e.getMessage());
											}
										%>

									</select>
								</div>
							</div>
						</div>


						<!--전화번호 -->
						<div class="form-group">
							<input type="text" class="form-control px-3" name="c_tel"
								id="cellPhone" data-form-field="Tel" placeholder="카페 전화번호"
								required="" minlength="12" maxlength="13" id="tel-header15-11">
						</div>
						<div class="form-group">
							<input class="form-control px-3" type="text" name="c_addr"
								placeholder="카페 주소" required="">
						</div>


						<div class="form-group">
							<textarea class="form-control px-3" rows="3" placeholder="카페 설명"
								name="c_intro"></textarea>
						</div>

						<div class="form-group">
							<label>사진 등록</label> <input type="file">
						</div>




						<div class="row container">카페 시작 날짜</div>

						<div class="row">
							<div class="col-md-4 multi-horizontal">

								<div class="form-group">

									<select class="form-control" id="cafe_start_year"
										name="c_start_year">
										<option value="default">년</option>

									</select>
								</div>
							</div>
							<div class="col-md-4 multi-horizontal">


								<div class="form-group">
									<select class="form-control" id="cafe_start_month"
										name="c_start_month">
										<option value="default">월</option>

									</select>
								</div>
							</div>
							<div class="col-md-4 multi-horizontal">

								<div class="form-group">
									<select class="form-control" id="cafe_start_day"
										name="c_start_day">
										<option value="default">일</option>

									</select>
								</div>
							</div>
						</div>



						<button type="submit" class="btn btn-primary">카페 등록</button>
					</form>


					<!-- /.col-lg-6 (nested) -->

					<!-- /.col-lg-6 (nested) -->


				</div>
			</div>
		</div>
		<!-- /.panel -->


		<!-- /.row -->


	</section>

	<script src="assets/web/assets/jquery/jquery.min.js"></script>
	<script src="assets/popper/popper.min.js"></script>
	<script src="assets/tether/tether.min.js"></script>
	<script src="assets/bootstrap/js/bootstrap.min.js"></script>
	<script src="assets/smoothscroll/smooth-scroll.js"></script>
	<script src="assets/dropdown/js/script.min.js"></script>
	<script src="assets/touchswipe/jquery.touch-swipe.min.js"></script>
	<script src="assets/datatables/jquery.data-tables.min.js"></script>
	<script src="assets/datatables/data-tables.bootstrap4.min.js"></script>
	<script src="assets/theme/js/script.js"></script>
	<script src="assets/custom/js/custom.js"></script>

	<script>
		function appendYear() {

			var date = new Date();

			var year = date.getFullYear();

			var selectValue = document.getElementById("cafe_start_year");

			var optionIndex = 0;

			for (var i = year - 100; i <= year; i++) {

				selectValue.add(new Option(i, i), optionIndex++);

			}

		}

		function appendMonth() {

			var selectValue = document.getElementById("cafe_start_month");

			var optionIndex = 0;

			for (var i = 1; i <= 12; i++) {

				selectValue.add(new Option(i, i), optionIndex++);

			}

		}

		function appendDay() {

			var selectValue = document.getElementById("cafe_start_day");

			var optionIndex = 0;

			for (var i = 1; i <= 31; i++) {

				selectValue.add(new Option(i, i), optionIndex++);

			}

		}

		$(document).ready(function() {
			appendYear();
			appendMonth();
			appendDay();
		});
	</script>
</body>

</html>
