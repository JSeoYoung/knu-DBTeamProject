<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page language="java" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<style>
.cafe_name_label {
	padding: 6px 18px;
	text-align: center;
	font-size: 16px;
	margin: 4px 2px;
	position: absolute;
	cursor: pointer;
	left: 745px;
	top: -7px;
	border-radius: 12px;
}

.button_menu {
	background-color: #FF0000; /* Red */
	border: none;
	color: white;
	padding: 6px 18px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 16px;
	margin: 4px 2px;
	cursor: pointer;
	position: absolute;
	left: 945px;
	top: -7px;
	border-radius: 12px;
}

.button_menu:hover {
	/*  border: 1px solid #fff;*/
	background-color: #FF0000;
	color: #fff;
}

.button_receipt {

	background-color: #FF0000; /* Red */
	color: white;
	padding: 6px 18px;
	text-align: center;
	display: inline-block;
	cursor: pointer;
}

/*#paymentTable tr:hover{
  background-color: #eee;
}*/


th {
	background-color: #FF0000
}
th {
	color: #FFFFFF
}

#paymentTable th {
	color: white;
	background-color: #FF0000;
}

#paymentTable td a {
	color: black;
	display: block;
	width: 100%;
	height: 100%;
}

#receiptTable {
	border: none;
}

#receiptTable td {
	border: none;
}

#receiptTable th {
	background-color: #FFF;
	color: #000
}

#totalTable th {
	color: white;
	background-color: #FF0000;
}

/*메뉴별합계 팝업레이어*/
* {
	margin: 0;
	padding: 0;
}

body {
	margin: 100px;
}

.pop-layer .pop-container {
	padding: 20px 25px;
}

.pop-layer p.ctxt {
	color: #666;
	line-height: 25px;
}

.pop-layer .btn-r {
	width: 100%;
	margin: 10px 0 20px;
	padding-top: 10px;
	border-top: 1px solid #DDD;
	text-align: right;
}

.pop-layer {
	display: none;
	position: absolute;
	top: 54%;
	left: 50%;
	width: 550px;
	height: 660px;
	background-color: #fff;
	/*border: 5px solid #3571B5;*/
	z-index: 10;
}

.dim-layer {
	display: none;
	position: fixed;
	_position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	z-index: 100;
}

.dim-layer .dimBg {
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background: #000;
	opacity: .5;
	filter: alpha(opacity = 50);
}

.dim-layer .pop-layer {
	display: block;
}

a.btn-layerClose {
	display: inline-block;
	height: 30px;
	padding: 0 14px 0;
	border: 1px solid #FF0000;
	background-color: #FF0000;
	font-size: 15px;
	color: #fff;
	line-height: 25px;
}

a.btn-layerClose:hover {
	border: 1px solid #fff;
	background-color: #FF0000;
	color: #fff;
}

/********영수증 팝업레이어**************/
.pop-layer1 .pop-container1 {
	padding: 5px 5px;
}

.pop-layer1 {
	display: none;
	position: absolute;
	top: 50%;
	left: 50%;
	width: 450px;
	height: auto;
	background-color: #fff;
	border: 1px solid #000;
	z-index: 10;
}

.pop-layer1 .btn-r1 {
	width: 100%;
	margin: -2px 0 0px;
	padding-top: 0px;
	border-top: 1px solid #DDD;
	text-align: right;
}

a.btn-layerClose1 {
	display: inline-block;
	height: 25px;
	width: 15px;
	/*padding: 0px 14px 0px;*/
	padding-top: 0px;
	padding-left: 10px;
	padding-right: 17px;
	padding-bottom: 5px;
	border: 1px solid #FF0000;
	background-color: #FF0000;
	font-size: 15px;
	color: #fff;
	line-height: 25px;
	text-align: center;
}

a.btn-layerClose1:hover {
	border: 1px solid #fff;
	background-color: #FF0000;
	color: #fff;
}
</style>

<!-- Site made with Mobirise Website Builder v4.8.7, https://mobirise.com -->
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="generator" content="Mobirise v4.8.7, mobirise.com">
<meta name="viewport"
	content="width=device-width, initial-scale=1, minimum-scale=1">
<link rel="shortcut icon" href="assets/images/-202x108.png"
	type="image/x-icon">
<meta name="description" content="Web Page Maker Description">
<title>PaymentList</title>
<link rel="stylesheet"
	href="assets/web/assets/mobirise-icons/mobirise-icons.css">
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


	<%
	

	String url = "jdbc:oracle:thin:@localhost:1521:oraknu";
	String user = "dbtp";
	String pass = "dbtp";
	Connection conn = null;
	String query = null;
	int card_total = 0;
	int cash_total = 0;
	int both_total = 0;
	String input_cid = null;
	String from_date = null;
	String to_date = null;
	int[] arr=new int[100];

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
	
	%>

	<!--상단 메뉴 바-->

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
							style="height: 3.8rem;"></a>
					</span>
					
				</div>
			</div>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav nav-dropdown" data-app-modern-menu="true">
					

					<li class='nav-item'
><a class='nav-link link text-black display-4' href='manage_cafe.jsp'>MY PAGE</a></li>
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


<section class="mbr-section content4 cid-rckzJPKDCD" id="content4-c">



		<div class="container">
			<div class="media-container-row">
				<div class="title col-12 col-md-8">
					<h2 class="align-center pb-3 mbr-fonts-style display-2">" "</h2>
					<h2 class="align-center pb-3 mbr-fonts-style display-2"><br>
						결제내역
					</h2>
				</div>
			</div>
		</div>
	</section>

	<section class="engine">
		<a href="https://mobirise.info/m">website design templates</a>
	</section>

	<section class="section-table cid-raT7mIPqE7" id="table1-5">

		<div class="container container-table">
			

			<div class="table-wrapper">
				<!--날짜 입력란-->
				<div class="container">
					<div class="row search">
						<div class="dataTables_filter">
							<form action = "get_payment_date.jsp" method="post">
								<label for="fromDate">Date</label> 
								<%
										input_cid = request.getParameter("cid");
										from_date = request.getParameter("from_date");
										to_date = request.getParameter("to_date");
								
								%>
								<input type="date" name="fromDate" id="fromDate" value="<%=from_date %>" onkeypress="dateFunction()">
								~ <input type="date" name="toDate" id="toDate" value="<%=to_date %>" onkeypress="dateFunction()">
								<input type="hidden" value = "<%=input_cid %>" name="cId">

								<button type = "submit" class="button_ViewList")>조회</button>
								
								</form>
								
					
								<!--<input type="button" value="메뉴별 합계보기" onclick="PopupOpen();">-->
								<!--<button class="button button1" onclick="PopupOpen();">메뉴별 합계보기</button>-->
								<a href="#layer0" class="button_menu" role="button">메뉴별 합계보기</a>
								<div class="dim-layer">
									<div class="dimBg"></div>
									<div id="layer0" class="pop-layer">
										<div class="pop-container">
											<div class="pop-conts">
												<!--content //-->
												<!--<br>-->

												<!--메뉴별 합계-->
												<div class="container scroll"
													style="overflow-y: scroll; height: 570px;">
													
													<%
													try{
														
														conn.setAutoCommit(false);
														PreparedStatement pstmt = null;
														int order_id = 0;

														from_date = request.getParameter("from_date");
														to_date = request.getParameter("to_date");
														input_cid = request.getParameter("cid");
														
														query="select b.mc_id, b.mc_name from cafe a, menu_category b where a.c_id=? and a.c_id=b.c_id";
														pstmt=conn.prepareStatement(query);
														pstmt.setInt(1,Integer.parseInt(input_cid));
														ResultSet rs = pstmt.executeQuery();
														
														System.out.println("cafe id: "+input_cid+"\n\n");
														
														while(rs.next()) {
															int mc_id = rs.getInt("mc_id");
															String mc_name = rs.getString("mc_name");
															System.out.println("menu category name: "+mc_name);
															out.println("<h4 class=\"text align-left\">"+mc_name+"</h4>");
															out.println("<table class=\"table align-center\" cellspacing=\"0\">");
															out.println("<thead color= \"white\" background-color= \"#FF0000\">");
															out.println("<tr class=\"table-heads\">");
															out.println("<th class=\"head-item mbr-fonts-style display-7\">메뉴</th>");
															out.println("<th class=\"head-item mbr-fonts-style display-7\">가격</th>");
															out.println("<th class=\"head-item mbr-fonts-style display-7\">수량</th>");
															out.println("<th class=\"head-item mbr-fonts-style display-7\">합계</th>");
															out.println("<!--<th class=\"head-item mbr-fonts-style display-7\">Action</th>-->");
															out.println("</tr>");
															out.println("</thead>");
															out.println("<tbody>");	

															query="select menu_name, menu_price, menu_qty, menu_price*menu_qty menu_total_price " + 
																	"from (select b.m_id menu_idetifier, b.m_name menu_name, b.m_price menu_price " + 
																	"      from menu_category a, menu b " + 
																	"      where a.mc_id=? and a.mc_id=b.mc_id(+)) " + 
																	"left outer join (select c.m_id menu_comparison, sum(c.o_qty) menu_qty " + 
																	"                 from cafe a, corder b, order_menu c " + 
																	"                 where a.c_id=? and a.c_id=b.c_id and b.o_date>=to_date(?,'YYYY/MM/DD') and b.o_date<=to_date(?,'YYYY/MM/DD hh24:mi:ss') and b.o_id=c.o_id " + 
																	"                 group by c.m_id) " + 
																	"on (menu_idetifier=menu_comparison)";
															pstmt=conn.prepareStatement(query);
															pstmt.setInt(1,mc_id);
															pstmt.setInt(2, Integer.parseInt(input_cid));
															pstmt.setString(3, from_date);
															pstmt.setString(4, to_date+" 23:59:59");
															ResultSet rs1 = pstmt.executeQuery();
															while(rs1.next()) {
																if(rs1.getString(1)==null)
																	break;
																String menu_name = rs1.getString(1);
																int menu_price = rs1.getInt(2);
																int menu_qty = rs1.getInt(3);
																int menu_total_price = rs1.getInt(4);
																System.out.println(menu_name+"  "+menu_price+" "+menu_qty+" "+menu_total_price);
																
																out.println("<tr>");
																out.println("<td class=\"body-item mbr-fonts-style display-7\">"+menu_name+"</td>");
																out.println("<td class=\"body-item mbr-fonts-style display-7\">"+String.valueOf(menu_price)+"</td>");
																out.println("<td class=\"body-item mbr-fonts-style display-7\">"+String.valueOf(menu_qty)+"</td>");
																out.println("<td class=\"body-item mbr-fonts-style display-7\">"+String.valueOf(menu_total_price)+"</td>");
																out.println("</tr>");
															}
															rs1.close();
															out.println("</tbody>");
															out.println("</table>");
															
															System.out.println();			 
														}
														rs.close();		
														System.out.println();
																
													} catch (Exception e) {
														System.err.println("sql error = " + e.getMessage());
													}
													
													%>

												</div>

												<div class="btn-r">
													<a href="#" class="btn-layerClose">Close</a>
												</div>
												<!--// content-->
											</div>
										</div>
									</div>
								</div>

						</div>
					</div>
				</div>

				<!--결제내역-->
				<div class="container scroll">
					<table class="table isSearch align-center" cellspacing="0"
						id="paymentTable">
						<thead>
							<tr class="table-heads">
								<th class="head-item mbr-fonts-style display-7">주문번호</th>
								<th class="head-item mbr-fonts-style display-7">결제구분</th>
								<th class="head-item mbr-fonts-style display-7">결제일자</th>
								<th class="head-item mbr-fonts-style display-7">가격</th>
								<th class="head-item mbr-fonts-style display-7">영수증</th>
							</tr>
						</thead>

						<tbody>

							<%

								try {

									conn.setAutoCommit(false);
									PreparedStatement pstmt = null;
									PreparedStatement pstmt2 = null;
									int order_id = 0;

									query = "select b.o_date, b.o_amt, b.o_pay, b.o_id " + "from cafe a, corder b "
											+ "where a.c_id=? and a.c_id=b.c_id and b.o_date>=to_date(?,'YYYY/MM/DD') and b.o_date<=to_date(?,'YYYY/MM/DD hh24:mi:ss')"
											+ "order by b.o_date";
											/*
									query = "select b.o_date, b.o_amt, b.o_pay " + "from cafe a, corder b "
													+ "where a.c_id=? and a.c_id=b.c_id and b.o_date>=? and b.o_date<=?"
													+ "order by b.o_date";*/
									pstmt = conn.prepareStatement(query);
									System.out.println(query);
									
									card_total = 0;
									cash_total = 0;
									both_total = 0;
									
									from_date = request.getParameter("from_date");
									to_date = request.getParameter("to_date");
									input_cid = request.getParameter("cid");
									pstmt.setInt(1, Integer.parseInt(input_cid));
									System.out.println("from " + from_date + " to " + to_date);
									pstmt.setString(2, from_date);
									pstmt.setString(3, to_date + " 23:59:59");
									ResultSet rs = pstmt.executeQuery();

									while (rs.next()) {
										System.out.println("1");

										String pay = rs.getString(3);
										String date = rs.getString(1);
										int amount = rs.getInt(2);
										order_id = order_id + 1;
										int order_identify = rs.getInt(4);
										
										arr[order_id]=order_identify;
										
										if(pay.equals( "카드")){
											card_total += amount;
										
										}
										else if(pay.equals( "현금")){
											cash_total += amount;	
										}
										
										
										out.println("<tr>");
										out.println(" <td class=\"body-item mbr-fonts-style display-7\">" + order_id + "</td>");
										out.println(" <td class=\"body-item mbr-fonts-style display-7\">" + pay + "</td>");
										out.println(" <td class=\"body-item mbr-fonts-style display-7\">" + date + "</td>");
										out.println(" <td class=\"body-item mbr-fonts-style display-7\">" + amount + "원</td>");
										out.println(
												" <td class=\"body-item mbr-fonts-style display-7\"><button type=\"button\"><a href=\"#layer"+String.valueOf(order_id)+"\" class=\"receipt\">receipt</a></td>");
										out.println("</tr>");

									}
									both_total = card_total + cash_total;
									
									rs.close();
			
									arr[0]=order_id;
									
									conn.commit();
									conn.setAutoCommit(true);
								} catch (Exception e) {
									System.err.println("sql error = " + e.getMessage());
								}
								
								
							%>
						</tbody>
					</table>
									<%
					
					try {

						conn.setAutoCommit(false);
						PreparedStatement pstmt2 = null;
						for(int i=1;i<=arr[0];i++)
							System.out.println(String.valueOf(arr[i]));
							
						for(int i=1;i<=arr[0];i++){
							
							out.println("<div id=\"layer"+String.valueOf(i)+"\" class=\"pop-layer1\"><div class=\"pop-container1\"><div class=\"pop-conts\">");
							out.println("<div class=\"btn-r1\"><a href=\"#\" class=\"btn-layerClose1\">x</a></div>");
						

							out.println("<table class=\"table align-center\" cellspacing=\"0\" id=receiptTable>");
							out.println("<thead><tr class=\"table-heads\" border-bottom=\"1px\"><!--table head color--><!--<tr class=\"bg-danger text-white\">-->");
							out.println("<th class=\"head-item mbr-fonts-style display-7\">메뉴</th>");
							out.println("<th class=\"head-item mbr-fonts-style display-7\">수량</th>");	
							out.println("<th class=\"head-item mbr-fonts-style display-7\">가격</th>");	
							out.println("</tr></thead><tbody>");
							
							query="select c.m_name, b.o_qty, c.m_price, c.m_price*b.o_qty total from corder a, order_menu b, menu c where a.o_id=? and a.o_id=b.o_id and b.m_id=c.m_id";
							pstmt2=conn.prepareStatement(query);
							pstmt2.setInt(1, arr[i]);
							System.out.println(query);
							ResultSet rs2=pstmt2.executeQuery();
							int sum=0;
							
							while(rs2.next()){
								String m_name=rs2.getString("m_name");
								int qty=rs2.getInt("o_qty");
								int price=rs2.getInt("m_price");
								int total=rs2.getInt("total");
								
								out.println("<tr>");
								out.println(" <td class=\"body-item mbr-fonts-style display-7\">" + m_name + "</td>");
								out.println(" <td class=\"body-item mbr-fonts-style display-7\">" + qty + "</td>");
								out.println(" <td class=\"body-item mbr-fonts-style display-7\">" + total + "</td>");
								out.println("</tr>");
								sum+=total;
								
							}
							rs2.close();
							
							out.println("</tbody></table>");	
							out.println("<h5 id=\"h5\" class=\"text align-center\">-----------------------------------------------</h5>");
							out.println("<h5 id=\"sum\" class=\"text align-right\">총합: "+sum+"원&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</h5>");
							out.println("</div></div></div>");
						}
						
						conn.commit();
						conn.setAutoCommit(true);
						conn.close();
					} catch (Exception e) {
						System.err.println("1 sql error = " + e.getMessage());
					}
					
					%>
								</table>


							</div>
						</div>
					</div>
				</div>

				<!--합계-->
				<div class="container scroll">
					<table class="table align-center" cellspacing="0" id=totalTable>
						<thead>
							<tr class="table-heads">
								<!--table head color-->
								<!--<tr class="bg-danger text-white">-->
								<th class="head-item mbr-fonts-style display-7">카드</th>
								<th class="head-item mbr-fonts-style display-7">현금</th>
								<th class="head-item mbr-fonts-style display-7">합계</th>
							</tr>
						</thead>

						<tbody>
							<tr>
								<td class="body-item mbr-fonts-style display-7"><%= card_total %>원</td>
								<td class="body-item mbr-fonts-style display-7"><%= cash_total %>원</td>
								<td class="body-item mbr-fonts-style display-7"><%= both_total %>원</td>
							</tr>

						</tbody>
					</table>
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
	<script src="assets/datatables/jquery.data-tables.min.js"></script>
	<script src="assets/datatables/data-tables.bootstrap4.min.js"></script>
	<script src="assets/theme/js/script.js"></script>
	<!--<script src="jquery-2.1.1.js" language="javascript"></script>-->

	<!--팝업창 열기-->
	<!--  <script type="text/javascript">
    function PopupOpen() {
      window.open("popup.html", "메뉴별 합계", "width=945,height=740,left=290,top=10,toolbar=no,scrollbar=no,menubar=no");
    }
  </script>-->



	
	<script>
	
		//메뉴별 합계 팝업레이어로 출력
		$('.button_menu').click(function() {
			var $href = $(this).attr('href');
			layer_popup($href);
		});
		function layer_popup(el) {

			var $el = $(el); //레이어의 id를 $el 변수에 저장
			var isDim = $el.prev().hasClass('dimBg'); //dimmed 레이어를 감지하기 위한 boolean 변수

			isDim ? $('.dim-layer').fadeIn() : $el.fadeIn();

			var $elWidth = ~~($el.outerWidth()), $elHeight = ~~($el
					.outerHeight()), docWidth = $(document).width(), docHeight = $(
					document).height();

			// 화면의 중앙에 레이어를 띄운다.
			if ($elHeight < docHeight || $elWidth < docWidth) {
				$el.css({
					marginTop : -$elHeight / 2,
					marginLeft : -$elWidth / 2
				})
			} else {
				$el.css({
					top : 0,
					left : 0
				});
			}

			$el.find('a.btn-layerClose').click(function() {
				isDim ? $('.dim-layer').fadeOut() : $el.fadeOut(); // 닫기 버튼을 클릭하면 레이어가 닫힌다.
				return false;
			});

			$('.layer .dimBg').click(function() {
				$('.dim-layer').fadeOut();
				return false;
			});
		}

		//영수증 출력
		$('.receipt').click(function() {
			var $href = $(this).attr('href');
			layer_popup2($href);
		});
		function layer_popup2(el) {

			var $el = $(el); //레이어의 id를 $el 변수에 저장
			var isDim = $el.prev().hasClass('dimBg'); //dimmed 레이어를 감지하기 위한 boolean 변수

			isDim ? $('.dim-layer').fadeIn() : $el.fadeIn();

			var $elWidth = ~~($el.outerWidth()), $elHeight = ~~($el
					.outerHeight()), docWidth = $(document).width(), docHeight = $(
					document).height();

			// 화면의 중앙에 레이어를 띄운다.
			if ($elHeight < docHeight || $elWidth < docWidth) {
				$el.css({
					marginTop : -$elHeight / 2,
					marginLeft : -$elWidth / 2
				})
			} else {
				$el.css({
					top : 0,
					left : 0
				});
			}

			$el.find('a.btn-layerClose1').click(function() {
				isDim ? $('.dim-layer').fadeOut() : $el.fadeOut(); // 닫기 버튼을 클릭하면 레이어가 닫힌다.
				return false;
			});

			
			$('.layer1 .dimBg').click(function() {
				$('.dim-layer').fadeOut();
				return false;
			});

		}
	</script>


</body>
</html>
