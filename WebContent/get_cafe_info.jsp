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
					
					request.setCharacterEncoding("UTF-8");	//한글 깨짐현상 방지
						if (session.getAttribute("signedUserName") != null) {
							out.println("<li class='nav-item'>");
							out.println(session.getAttribute("signedUserName") + "님 반갑습니다.</li>");
							out.println("<li class='nav-item'><a class='nav-link link text-black display-4' href='cafe_register.jsp'>MY PAGE</a></li>");
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
					<h2 class="align-center pb-3 mbr-fonts-style display-2"><br>
						<%=request.getParameter("cname") %>
					</h2>
					

				</div>
			</div>
		</div>
	</section>


	<section class="mbr-section article content9 cid-rckzNfVDdj"
		id="content9-d">



		<div class="container">
			<div class="inner-container" style="width: 100%;">
				<hr class="line" style="width: 25%;">
				<div class="section-text align-center mbr-fonts-style display-6">
					<%
							
					request.setCharacterEncoding("UTF-8");	//한글 깨짐현상 방지
					String url = "jdbc:oracle:thin:@localhost:1521:oraknu";
					String user = "dbtp";
					String pass = "dbtp";
					Connection conn = null;
					
					String query1 = null;
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
						System.err.println("sql error= " + e.getMessage());
						System.exit(1);
					}
					try {
						conn.setAutoCommit(false);
						PreparedStatement pstmt = null;
						//temporary
						request.setCharacterEncoding("UTF-8");
						String cafe_id = request.getParameter("cid");
						query1 = "select * from cafe where c_id=?"; //mc_id와 mc_name을 가져옴
						pstmt = conn.prepareStatement(query1);
						System.out.println(query1);
						pstmt.setString(1, cafe_id); //cafename이 KONA인 카페의 mc_id와 mc_name을 가져오기 위해서
						ResultSet rs = pstmt.executeQuery();
						
						// 메뉴
						String c_intro = null;
						String c_addr = null;
						String c_tel = null;
						
						while (rs.next()) {
							
							c_intro = rs.getString("c_intro"); //c_intro
							c_addr = rs.getString("c_addr");//c_addr
							c_tel = rs.getString("c_tel"); //c_tel
							System.out.println("cafe intro is '" + c_intro + "'");
							
							out.println("<br>" + c_intro + "<br><br>"); //회사 설명 적기
							if(c_addr != null)
							out.println("주소       : "+ c_addr + "<br>");
							if(c_tel != null)
							out.println("전화번호 : "+ c_tel + "<br><br>");
							
							
						}
						
						
						conn.commit();       
					   // conn.setAutoCommit(true);       
					    //pstmt.close();   
					  //  conn.close();      
					    
				
					} catch (Exception e) {
						
						System.err.println("sql error = " + e.getMessage());
					}
				%></div>
				<hr class="line" style="width: 25%;">
			</div>
		</div>
	</section>



	</section>

	<section class="section-table cid-r9nyEz1eYo" id="table1-h">



		<div class="container container-table">
			<h2
				class="mbr-section-title mbr-fonts-style align-center pb-3 display-2">메뉴</h2>

			<div class="table-wrapper">
				<div class="container">
					<div class="row search">
						<div class="col-md-6"></div>
						<div class="col-md-6">
							<div class="dataTables_filter">
								<label class="searchInfo mbr-fonts-style display-7">Search:</label>
								<input class="form-control input-sm" disabled="">
							</div>
						</div>
					</div>
				</div>

				<div class="container scroll">
					<table class="table isSearch" cellspacing="0">
						<thead>
							<tr class="table-heads ">




								<th class="head-item mbr-fonts-style display-7">이름</th>
								<th class="head-item mbr-fonts-style display-7">가격</th>
							</tr>
						</thead>

						<tbody>


							<%
							
					request.setCharacterEncoding("UTF-8");	//한글 깨짐현상 방지
					
					String query = null;
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
						System.err.println("sql error= " + e.getMessage());
						System.exit(1);
					}
					try {
						conn.setAutoCommit(false);
						PreparedStatement pstmt = null;
						//temporary
						request.setCharacterEncoding("UTF-8");
						String cafe_id = request.getParameter("cid");
						query = "select m_id, m_name, m_price from menu where c_id=?"; //mc_id와 mc_name을 가져옴
						pstmt = conn.prepareStatement(query);
						System.out.println(query);
						pstmt.setString(1, cafe_id); //cafename이 KONA인 카페의 mc_id와 mc_name을 가져오기 위해서
						ResultSet rs = pstmt.executeQuery();
						
						// 메뉴
						boolean flag = false;
						while (rs.next()) {
							int id = rs.getInt(1); //mc_id
							String menu_name = rs.getString("m_name"); //mc_name
							String menu_price = rs.getString("m_price");//menu price
							System.out.println("menu name is '" + menu_name + "'");
							
							out.println("<tr><td class='body-item mbr-fonts-style display-7'>" + menu_name + "</td>");
							out.println("<td class='body-item mbr-fonts-style display-7'>" + menu_price +"원"+ "</td></tr>");
					
							// 가격 및 메뉴
						}
						
						
						conn.commit();       
					    conn.setAutoCommit(true);       
					    pstmt.close();   
					    conn.close();      
					    
				
					} catch (Exception e) {
						
						System.err.println("sql error = " + e.getMessage());
					}
				%>
						</tbody>
					</table>
				</div>
				<div class="container table-info-container">
					<div class="row info">
						<div class="col-md-6">
							<div class="dataTables_info mbr-fonts-style display-7">
								<span class="infoBefore">Showing</span> <span
									class="inactive infoRows"></span> <span class="infoAfter">entries</span>
								<span class="infoFilteredBefore">(filtered from</span> <span
									class="inactive infoRows"></span> <span
									class="infoFilteredAfter"> total entries)</span>
							</div>
						</div>
						<div class="col-md-6"></div>
					</div>
				</div>
			</div>
		</div>
	</section>


	<section class="cid-r9nu8gDQMB" id="footer5-4">





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
	<script src="assets/dropdown/js/script.min.js"></script>
	<script src="assets/touchswipe/jquery.touch-swipe.min.js"></script>
	<script src="assets/parallax/jarallax.min.js"></script>
	<script src="assets/datatables/jquery.data-tables.min.js"></script>
	<script src="assets/datatables/data-tables.bootstrap4.min.js"></script>
	<script src="assets/theme/js/script.js"></script>


</body>
</html>