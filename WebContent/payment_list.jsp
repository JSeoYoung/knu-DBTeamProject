<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page language="java" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<style>
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

/*#paymentTable tr:hover{
  background-color: #eee;
}*/
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
}

#totalTable th {
	color: white;
	background-color: #FF0000;
}

#coffee_iced th {
	color: white;
	background-color: #FF0000;
}

#coffee_hot th {
	color: white;
	background-color: #FF0000;
}

#cold_beverage th {
	color: white;
	background-color: #FF0000;
}

#hot_beverage th {
	color: white;
	background-color: #FF0000;
}

/*�޴����հ� �˾����̾�*/
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

/********������ �˾����̾�**************/
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


	<!--��� �޴� ��-->

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
						href="logout.jsp">�α׾ƿ�</a>
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
						��������
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
				<!--��¥ �Է¶�-->
				<div class="container">
					<div class="row search">
						<div class="dataTables_filter">
							<form action = "get_payment_date.jsp" method="post">
								<label for="fromDate">Date</label> 
								<%
								String input_cid = request.getParameter("cid");
								
								%>
								<input type="date" name="fromDate" id="fromDate" onkeypress="dateFunction()">
								~ <input type="date" name="toDate" id="toDate" onkeypress="dateFunction()">
								<input type="hidden" value = "<%=input_cid %>" name="cId">
						

								
								<button type = "submit" class="button_ViewList")>��ȸ</button>
								</form>
								<!--<input type="button" value="�޴��� �հ躸��" onclick="PopupOpen();">-->
								<!--<button class="button button1" onclick="PopupOpen();">�޴��� �հ躸��</button>-->
								<a href="#layer2" class="button_menu" role="button">�޴��� �հ躸��</a>
								<div class="dim-layer">
									<div class="dimBg"></div>
									<div id="layer2" class="pop-layer">
										<div class="pop-container">
											<div class="pop-conts">
												<!--content //-->
												<!--<br>-->

												<!--�޴��� �հ�-->
												<div class="container scroll"
													style="overflow-y: scroll; height: 570px;">
													<h4 class="text align-left">COFFEE(ICED)</h4>
													<table class="table align-center" cellspacing="0"
														id=coffee_iced>
														<thead>
															<tr class="table-heads">
																<th class="head-item mbr-fonts-style display-7">�޴�</th>
																<th class="head-item mbr-fonts-style display-7">����</th>
																<th class="head-item mbr-fonts-style display-7">����</th>
																<th class="head-item mbr-fonts-style display-7">�հ�</th>
																<!--<th class="head-item mbr-fonts-style display-7">Action</th>-->
															</tr>
														</thead>

														<tbody>
															<tr>
																<td class="body-item mbr-fonts-style display-7">�Ƹ޸�ī��</td>
																<td class="body-item mbr-fonts-style display-7">2500��</td>
																<td class="body-item mbr-fonts-style display-7">2��</td>
																<td class="body-item mbr-fonts-style display-7">5000��</td>
																<!--<td><a href="#" class="delete-link">Delete</a></td>-->
															</tr>
														</tbody>
													</table>

													<h4 class="text align-left">
														<br>COFFEE(HOT)
													</h4>
													<table class="table align-center" cellspacing="0"
														id=coffee_hot>
														<thead>
															<tr class="table-heads">
																<th class="head-item mbr-fonts-style display-7">�޴�</th>
																<th class="head-item mbr-fonts-style display-7">����</th>
																<th class="head-item mbr-fonts-style display-7">����</th>
																<th class="head-item mbr-fonts-style display-7">�հ�</th>
															</tr>
														</thead>

														<tbody>
															<tr>
																<td class="body-item mbr-fonts-style display-7">�Ƹ޸�ī��</td>
																<td class="body-item mbr-fonts-style display-7">2500��</td>
																<td class="body-item mbr-fonts-style display-7">2��</td>
																<td class="body-item mbr-fonts-style display-7">5000��</td>

															</tr>
															<tr>
																<td class="body-item mbr-fonts-style display-7">ī���</td>
																<td class="body-item mbr-fonts-style display-7">3300��</td>
																<td class="body-item mbr-fonts-style display-7">1��</td>
																<td class="body-item mbr-fonts-style display-7">3300��</td>

															</tr>
															<tr>
																<td class="body-item mbr-fonts-style display-7">�Ƹ޸�ī��</td>
																<td class="body-item mbr-fonts-style display-7">2500��</td>
																<td class="body-item mbr-fonts-style display-7">2��</td>
																<td class="body-item mbr-fonts-style display-7">5000��</td>

															</tr>
															<tr>
																<td class="body-item mbr-fonts-style display-7">�Ƹ޸�ī��</td>
																<td class="body-item mbr-fonts-style display-7">2500��</td>
																<td class="body-item mbr-fonts-style display-7">2��</td>
																<td class="body-item mbr-fonts-style display-7">5000��</td>

															</tr>
															<tr>
																<td class="body-item mbr-fonts-style display-7">�Ƹ޸�ī��</td>
																<td class="body-item mbr-fonts-style display-7">2500��</td>
																<td class="body-item mbr-fonts-style display-7">2��</td>
																<td class="body-item mbr-fonts-style display-7">5000��</td>

															</tr>
														</tbody>
													</table>

													<h4 class="text align-left">
														<br>COLD BEVERAGE
													</h4>
													<table class="table align-center" cellspacing="0"
														id=cold_beverage>
														<thead>
															<tr class="table-heads">
																<th class="head-item mbr-fonts-style display-7">�޴�</th>
																<th class="head-item mbr-fonts-style display-7">����</th>
																<th class="head-item mbr-fonts-style display-7">����</th>
																<th class="head-item mbr-fonts-style display-7">�հ�</th>

															</tr>
														</thead>

														<tbody>
															<tr>
																<td class="body-item mbr-fonts-style display-7">���⽺����</td>
																<td class="body-item mbr-fonts-style display-7">4300��</td>
																<td class="body-item mbr-fonts-style display-7">1��</td>
																<td class="body-item mbr-fonts-style display-7">4300��</td>

															</tr>
														</tbody>
													</table>

													<h4 class="text align-left">
														<br>HOT BEVERAGE
													</h4>
													<table class="table align-center" cellspacing="0"
														id=hot_beverage>
														<thead>
															<tr class="table-heads">
																<th class="head-item mbr-fonts-style display-7">�޴�</th>
																<th class="head-item mbr-fonts-style display-7">����</th>
																<th class="head-item mbr-fonts-style display-7">����</th>
																<th class="head-item mbr-fonts-style display-7">�հ�</th>

															</tr>
														</thead>

														<tbody>
															<tr>
																<td class="body-item mbr-fonts-style display-7">��ũƼ</td>
																<td class="body-item mbr-fonts-style display-7">4000��</td>
																<td class="body-item mbr-fonts-style display-7">2��</td>
																<td class="body-item mbr-fonts-style display-7">8000��</td>

															</tr>
														</tbody>
													</table>

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

				<!--��������-->
				<div class="container scroll">
					<table class="table isSearch align-center" cellspacing="0"
						id="paymentTable">
						<thead>
							<tr class="table-heads">
								<th class="head-item mbr-fonts-style display-7">�ֹ���ȣ</th>
								<th class="head-item mbr-fonts-style display-7">��������</th>
								<th class="head-item mbr-fonts-style display-7">��������</th>
								<th class="head-item mbr-fonts-style display-7">����</th>
								<th class="head-item mbr-fonts-style display-7">������</th>
							</tr>
						</thead>

						<tbody>

							<%
								String url = "jdbc:oracle:thin:@localhost:1521:oraknu";
								String user = "dbtp";
								String pass = "dbtp";
								Connection conn = null;
								String query = null;
								int card_total = 0;
								int cash_total = 0;
								int both_total = 0;

								try {
									Class.forName("oracle.jdbc.driver.OracleDriver");
									System.out.println("����̹� �˻� ����!");
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
									int order_id = 0;

									query = "select b.o_date, b.o_amt, b.o_pay " + "from cafe a, corder b "
											+ "where a.c_id=? and a.c_id=b.c_id and b.o_date>=to_date(?,'YYYY/MM/DD') and b.o_date<=to_date(?,'YYYY/MM/DD hh24:mi:ss')"
											+ "order by b.o_date";
											/*
									query = "select b.o_date, b.o_amt, b.o_pay " + "from cafe a, corder b "
													+ "where a.c_id=? and a.c_id=b.c_id and b.o_date>=? and b.o_date<=?"
													+ "order by b.o_date";*/
									pstmt = conn.prepareStatement(query);
									System.out.println(query);
									
									
									String from_date = null;
									String to_date = null;
									
									card_total = 0;
									cash_total = 0;
									both_total = 0;
									
									from_date = request.getParameter("from_date");
									to_date = request.getParameter("to_date");
									input_cid = request.getParameter("cid");
									pstmt.setInt(1, Integer.parseInt(input_cid));
									System.out.println("from " + from_date + "to " + to_date);
									pstmt.setString(2, from_date);
									pstmt.setString(3, to_date + " 23:59:59");
									ResultSet rs = pstmt.executeQuery();

									while (rs.next()) {

										String pay = rs.getString(3);
										String date = rs.getString(1);
										int amount = rs.getInt(2);
										order_id = order_id + 1;
										if(pay.equals( "ī��")){
											card_total += amount;
										
										}
										else if(pay.equals( "����")){
											cash_total += amount;	
										}
										
										
										out.println("<tr>");
										out.println(" <td class=\"body-item mbr-fonts-style display-7\">" + order_id + "</td>");
										out.println(" <td class=\"body-item mbr-fonts-style display-7\">" + pay + "</td>");
										out.println(" <td class=\"body-item mbr-fonts-style display-7\">" + date + "</td>");
										out.println(" <td class=\"body-item mbr-fonts-style display-7\">" + amount + "��</td>");
										out.println(
												" <td class=\"body-item mbr-fonts-style display-7\"><button type=\"button\"><a href=\"#layer1\" class=\"receipt\">receipt</a></td>");
										out.println("</tr>");
									}
									both_total = card_total + cash_total;
									
									rs.close();
			
									conn.commit();
									conn.setAutoCommit(true);
									conn.close();
								} catch (Exception e) {
									System.err.println("sql error = " + e.getMessage());
								}
								
								
							%>
						</tbody>
					</table>
					<div id="layer1" class="pop-layer1">
						<div class="pop-container1">
							<div class="pop-conts">

								<div class="btn-r1">
									<a href="#" class="btn-layerClose1">x</a>
								</div>

								<!--<h5 class="text align-center">�Ƹ޸�ī��&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 5000��</h5>
                <h5 class="text align-center">ī���&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 3300��</h5>
                <h5 class="text align-center"></h5>
                <h5 class="text align-right">����: 8300��</h5>-->

								<table class="table align-center" cellspacing="0"
									id=receiptTable>
									<thead>
										<tr class="table-heads" border-bottom="1px">
											<!--table head color-->
											<!--<tr class="bg-danger text-white">-->
											<th class="head-item mbr-fonts-style display-7">�޴�</th>
											<th class="head-item mbr-fonts-style display-7">����</th>
											<th class="head-item mbr-fonts-style display-7">����</th>
										</tr>
									</thead>

									<tbody>

									</tbody>
								</table>

								<h5 id="h5" class="text align-center">-----------------------------------------------</h5>
								<h5 id="sum" class="text align-right">����:
									8300��&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</h5>

							</div>
						</div>
					</div>
				</div>

				<!--�հ�-->
				<div class="container scroll">
					<table class="table align-center" cellspacing="0" id=totalTable>
						<thead>
							<tr class="table-heads">
								<!--table head color-->
								<!--<tr class="bg-danger text-white">-->
								<th class="head-item mbr-fonts-style display-7">ī��</th>
								<th class="head-item mbr-fonts-style display-7">����</th>
								<th class="head-item mbr-fonts-style display-7">�հ�</th>
							</tr>
						</thead>

						<tbody>
							<tr>
								<td class="body-item mbr-fonts-style display-7"><%= card_total %>��</td>
								<td class="body-item mbr-fonts-style display-7"><%= cash_total %>��</td>
								<td class="body-item mbr-fonts-style display-7"><%= both_total %>��</td>
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

	<!--�˾�â ����-->
	<!--  <script type="text/javascript">
    function PopupOpen() {
      window.open("popup.html", "�޴��� �հ�", "width=945,height=740,left=290,top=10,toolbar=no,scrollbar=no,menubar=no");
    }
  </script>-->


	<script>
		//default�� ���ó�¥ ���
		$(function() {
			document.getElementById("fromDate").valueAsDate = new Date();
			document.getElementById("toDate").valueAsDate = new Date();
			
			//datepicker �ѱ���� ����ϱ� ���� ����
			//$.datepicker.setDefaults($.datepicker.regional['ko']);
		});

		//�޴��� �հ� �˾����̾�� ���
		$('.button_menu').click(function() {
			var $href = $(this).attr('href');
			layer_popup($href);
		});
		function layer_popup(el) {

			var $el = $(el); //���̾��� id�� $el ������ ����
			var isDim = $el.prev().hasClass('dimBg'); //dimmed ���̾ �����ϱ� ���� boolean ����

			isDim ? $('.dim-layer').fadeIn() : $el.fadeIn();

			var $elWidth = ~~($el.outerWidth()), $elHeight = ~~($el
					.outerHeight()), docWidth = $(document).width(), docHeight = $(
					document).height();

			// ȭ���� �߾ӿ� ���̾ ����.
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
				isDim ? $('.dim-layer').fadeOut() : $el.fadeOut(); // �ݱ� ��ư�� Ŭ���ϸ� ���̾ ������.
				return false;
			});

			$('.layer .dimBg').click(function() {
				$('.dim-layer').fadeOut();
				return false;
			});
		}

		//������ ���
		$('.receipt').click(function() {
			var $href = $(this).attr('href');
			layer_popup2($href);
		});
		function layer_popup2(el) {

			var $el = $(el); //���̾��� id�� $el ������ ����
			var isDim = $el.prev().hasClass('dimBg'); //dimmed ���̾ �����ϱ� ���� boolean ����

			isDim ? $('.dim-layer').fadeIn() : $el.fadeIn();

			var $elWidth = ~~($el.outerWidth()), $elHeight = ~~($el
					.outerHeight()), docWidth = $(document).width(), docHeight = $(
					document).height();

			// ȭ���� �߾ӿ� ���̾ ����.
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
				isDim ? $('.dim-layer').fadeOut() : $el.fadeOut(); // �ݱ� ��ư�� Ŭ���ϸ� ���̾ ������.
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