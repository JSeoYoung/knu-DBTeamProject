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
<meta name="description" content="">
<title>Home</title>
<link rel="stylesheet"
	href="assets/web/assets/mobirise-icons/mobirise-icons.css">
<link rel="stylesheet" href="assets/tether/tether.min.css">
<link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet"
	href="assets/bootstrap/css/bootstrap-grid.min.css">
<link rel="stylesheet"
	href="assets/bootstrap/css/bootstrap-reboot.min.css">
<link rel="stylesheet" href="assets/dropdown/css/style.css">
<link rel="stylesheet" href="assets/socicon/css/styles.css">
<link rel="stylesheet" href="assets/theme/css/style.css">
<link rel="stylesheet" href="assets/gallery/style.css">
<link rel="stylesheet" href="assets/mobirise/css/mbr-additional.css"
	type="text/css">



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
					<%
					
					request.setCharacterEncoding("UTF-8");	//한글 깨짐현상 방지

						if (session.getAttribute("signedUserName") != null) {
							out.println("<li class='nav-item'>");
							out.println(session.getAttribute("signedUserName") + "님 반갑습니다.</li>");
							out.println("<li class='nav-item'><a class='nav-link link text-black display-4' href='manage_cafe.jsp'>MY PAGE</a></li>");

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

	<section class="engine">
		<a href="https://mobirise.me/c">free site builder</a>
	</section>
	<section class="cid-r9nUnJcU4I mbr-fullscreen mbr-parallax-background"
		id="header2-o">
		<div class="mbr-overlay"
			style="opacity: 0.5; background-color: rgb(118, 118, 118);"></div>

		<div class="container align-center">
			<div class="row justify-content-md-center">
				<div class="mbr-white col-md-10">
					<h1
						class="mbr-section-title mbr-bold pb-3 mbr-fonts-style display-1">카페
						관리를 쉽고 편리하게</h1>

					<p class="mbr-text pb-3 mbr-fonts-style display-5">
						<strong><em>OraCaff</em>è</strong>에서 지점별 매출 관리와 홍보를 쉽고 편리하게!<br>웹
						포스기, 매출 통계, 프로모션 홍보 등 다양한 서비스로 수익을 창출하세요!
					</p>
					<div class="mbr-section-btn">
						<a class="btn btn-md btn-primary display-4"
							href="signup.jsp">가입하기</a> <a
							class="btn btn-md btn-white-outline display-4"
							href="https://mobirise.com">더 알아보기</a>
					</div>
				</div>
			</div>
		</div>
		<div class="mbr-arrow hidden-sm-down" aria-hidden="true">
			<a href="#next"> <i class="mbri-down mbr-iconfont"></i>
			</a>
		</div>
	</section>

	<section class="mbr-section content5 cid-r9oejZ3rrV" id="content5-r">





		<div class="container">
			<div class="media-container-row">
				<div class="title col-12 col-md-8">
					<h2
						class="align-center mbr-bold mbr-white pb-3 mbr-fonts-style display-2">경북대학교
						위치별 카페 목록</h2>
					<h3
						class="mbr-section-subtitle align-center mbr-light mbr-white pb-3 mbr-fonts-style display-5">
						북문, 쪽문, 동문, 서문 위치별 분류로 쉽게 원하는 카페를 찾을 수 있습니다.</h3>


				</div>
			</div>
		</div>
	</section>

	<section class="mbr-gallery mbr-slider-carousel cid-r9nWrLRLhA"
		id="gallery2-p">



		<div>
			<div>
				<!-- Filter -->
				<div class="mbr-gallery-filter container gallery-filter-active">
					<ul buttons="0">
						<li class="mbr-gallery-filter-all"><a
							class="btn btn-md btn-primary-outline active display-7" href="">전체보기</a></li>
					</ul>
				</div>
				<!-- Gallery -->
				<div class="mbr-gallery-row">
					<div class="mbr-gallery-layout-default">
						<div>
							<div>
							
							<%
							String url="jdbc:oracle:thin:@localhost:1521:oraknu";
							String user="dbtp";
							String pass = "dbtp";  
							Connection conn = null;  
							String query = null;
							//
							try {       
								Class.forName("oracle.jdbc.driver.OracleDriver");       
								System.out.println("드라이버 검색 성공!");  
							}catch(ClassNotFoundException e) {        
								System.err.println("error = " + e.getMessage());        
								System.exit(1);  
							} 
							
							try{        
								conn = DriverManager.getConnection(url,user,pass);  
							}catch(SQLException e) {        
								System.err.println("sql error = " + e.getMessage());        
								System.exit(1);  
							} 
							  
							try {
								 
								conn.setAutoCommit(false);       
								Statement stmt=null;
								stmt = conn.createStatement();

								 
								query="select c_id, h_id, c_name, cc_id,  (select cc_name from cafe_category where cc_id = c.cc_id) as cc_name, c_img from cafe c";
								
								ResultSet rs=stmt.executeQuery(query);
								
								while(rs.next()) {
									String cafe_name = rs.getString("c_name");
									String cafe_category_name = rs.getString("cc_name");
									String cafe_id = rs.getString("c_id");
									int host_id = rs.getInt(2);
									String cafe_image = rs.getString("c_img");
									System.out.println(cafe_image);
									
									out.println("<div class='mbr-gallery-item mbr-gallery-item--p2' data-video-url='false' data-tags='"+ cafe_category_name + "'>");
									out.println("<a href='get_cafe_info.jsp?cid="+cafe_id +"&cname="+cafe_name +"'>");
									/*이미지는 추후에 넣기*/
									String str="assets/images/"+cafe_image;
									%>
									<img src=<%=str%>>
									<%
									out.println("<span class='mbr-gallery-title mbr-fonts-style display-7'>");
									out.println(cafe_name);
									out.println("</span></a>");
						
									out.println("</div>");
									
								
								}
								rs.close();
							    
							    conn.commit();       
							    conn.setAutoCommit(true);  
							    stmt.close();
							    conn.close();
							} catch(Exception e) {       
								System.err.println("sql error = " + e.getMessage());         
							}
							
							%>
							
							</div>
						</div>
						<div class="clearfix"></div>
					</div>
				</div>
				<!-- Lightbox -->
				<div data-app-prevent-settings=""
					class="mbr-slider modal fade carousel slide" tabindex="-1"
					data-keyboard="true" data-interval="false" id="lb-gallery2-p">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-body">
								<div class="carousel-inner">
									<div class="carousel-item">
										<img src="assets/images/mbr-864x1080.jpg" alt="" title="">
									</div>
									<div class="carousel-item active">
										<img src="assets/images/gallery07.jpg" alt="" title="">
									</div>
									<div class="carousel-item">
										<img src="assets/images/mbr-720x1080.jpg" alt="" title="">
									</div>
									<div class="carousel-item">
										<img src="assets/images/mbr-1-720x1080.jpg" alt="" title="">
									</div>
									<div class="carousel-item">
										<img src="assets/images/mbr-1-720x1080.jpg" alt="" title="">
									</div>
									<div class="carousel-item">
										<img src="assets/images/mbr-1-720x1080.jpg" alt="" title="">
									</div>
									<div class="carousel-item">
										<img src="assets/images/mbr-1620x1080.jpg" alt="" title="">
									</div>
								</div>
								<a class="carousel-control carousel-control-prev" role="button"
									data-slide="prev" href="#lb-gallery2-p"><span
									class="mbri-left mbr-iconfont" aria-hidden="true"></span><span
									class="sr-only">Previous</span></a><a
									class="carousel-control carousel-control-next" role="button"
									data-slide="next" href="#lb-gallery2-p"><span
									class="mbri-right mbr-iconfont" aria-hidden="true"></span><span
									class="sr-only">Next</span></a><a class="close" href="#"
									role="button" data-dismiss="modal"><span class="sr-only">Close</span></a>
							</div>
						</div>
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
	<script src="assets/parallax/jarallax.min.js"></script>
	<script src="assets/dropdown/js/script.min.js"></script>
	<script src="assets/masonry/masonry.pkgd.min.js"></script>
	<script src="assets/imagesloaded/imagesloaded.pkgd.min.js"></script>
	<script src="assets/bootstrapcarouselswipe/bootstrap-carousel-swipe.js"></script>
	<script src="assets/vimeoplayer/jquery.mb.vimeo_player.js"></script>
	<script src="assets/touchswipe/jquery.touch-swipe.min.js"></script>
	<script src="assets/theme/js/script.js"></script>
	<script src="assets/gallery/player.min.js"></script>
	<script src="assets/gallery/script.js"></script>
	<script src="assets/slidervideo/script.js"></script>


</body>
</html>
