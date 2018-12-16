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
<title>WebPos</title>
<link rel="stylesheet" href="assets/tether/tether.min.css">
<link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet"
	href="assets/bootstrap/css/bootstrap-grid.min.css">
<link rel="stylesheet"
	href="assets/bootstrap/css/bootstrap-reboot.min.css">
<link rel="stylesheet" href="assets/dropdown/css/style.css">
<link rel="stylesheet"
	href="assets/as-pie-progress/css/progress.min.css">
<link rel="stylesheet" href="assets/theme/css/style.css">
<link rel="stylesheet" href="assets/mobirise/css/mbr-additional.css"
	type="text/css">
<link rel="stylesheet" href="assets/custom/css/custom.css"
	type="text/css">
<style>
.selected {
	background-color: #aaaaaa;
	font-weight: bold;
	color: #000000;
}
</style>
</head>

<body>

	<%
		String url = "jdbc:oracle:thin:@localhost:1521:oraknu";
		String user = "dbtp";
		String pass = "dbtp";
		Connection conn = null;
		String query = null;
		int sum = 0;
		String cid = request.getParameter("cid");
		String input_cafename = "";

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
			query = "select c_name from cafe where c_id=?";
			PreparedStatement pstmt = null;
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, Integer.parseInt(cid));
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				input_cafename = rs.getString(1);
			}
			rs.close();
		} catch (SQLException e) {
			System.err.println("sql error = " + e.getMessage());
			System.exit(1);
		}
	%>

	<!-- menu section -->
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
					<li class='nav-item'><a
						class='nav-link link text-black display-4'
						href='cafe_register.jsp'>MY PAGE</a></li>
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
		<div class="container col-md-4">


			<table class="table-hover text-center table-bordered"
				id="order_table" width="100%">

				<thead>
					<th col-md-3>메뉴</th>
					<th col-md-1>수량</th>
					<th col-md-3>단가</th>
					<th col-md-3>합계</th>

				</thead>

				<tbody>
					<%
						try {

							conn.setAutoCommit(false);
							PreparedStatement pstmt = null;

							query = "select * from " + "Test_TT"; //c_name이 input_cafename인 cafe의 c_id를 가져온후, mc_id와 mc_name을 가져옴

							pstmt = conn.prepareStatement(query);

							ResultSet rs4 = pstmt.executeQuery();

							while (rs4.next()) {

								String menu = rs4.getString(1);
								int qty = rs4.getInt(2);
								int price = rs4.getInt(3);
								int total = rs4.getInt(4);

								sum = sum + total;

								out.println("<tr><td width=\"50%\">" + menu + "</td>" + "<td width=\"10%\">" + qty + "</td>"
										+ "<td width=\"27%\">" + price + "</td>" + "<td id=\"menu_total\" width=\"27%\">" + total
										+ "</td></tr><br>");

							}
							rs4.close();
						} catch (Exception e) {
							System.err.println("sql error = " + e.getMessage());
						}
					%>

				</tbody>
			</table>
			<div class="row container">
				<h3>주문합계 :</h3>
				<input id="total_sum" size="20" value=<%=sum%> readonly>
				<h3>원</h3>
			</div>

			<div class="row container align-center">
				<!-- 선택 삭제 버튼은 아직 구현 못했어용 ㅠㅠ -->

				<button class="btn-sm" id="deleteSelectedItemsBtn">선택삭제</button>
				<button class="btn-sm" id="deleteAllItemsBtn">전체삭제</button>

				<!-- 수량 증가 / 감소 버튼은 아직 구현 못했어용 ㅠㅠ -->
				<button class="btn-sm" id="plusBtn">▲</button>
				<button class="btn-sm" id="minusBtn">▼</button>
			</div>
			<!-- 이 부분에서 값을 디비에 저장해줍니다 -->
				<div class="row container align-center">
					<button class="btn-lg btn-primary"  id="cardBtn">카드</button>
					<button class="btn-lg btn-primary"  id="cashBtn">현금</button>
				</div>
		
		</div>


		<div class="container col-md-8">
			<nav class="scroll">
				<ul class="nav nav-pills nav-justified scroll" role="tablist">

					<!-- 탭 메뉴 !! 이 부분에 카테고리를 추가해 주세요 ! -->

					<%
						try {

							PreparedStatement pstmt = null;

							query = "select mc_id, mc_name from menu_category where c_id=(select c_id from cafe where c_name=?)"; //c_name이 input_cafename인 cafe의 c_id를 가져온후, mc_id와 mc_name을 가져옴

							pstmt = conn.prepareStatement(query);

							pstmt.setString(1, input_cafename); //cafename이 KONA인 카페의 mc_id와 mc_name을 가져오기 위해서

							ResultSet rs = pstmt.executeQuery();

							query = "select m_name, m_price from menu where mc_id=?";

							pstmt = conn.prepareStatement(query);

							ResultSet rs1 = null;
							// 메뉴

							boolean flag = false;
							while (rs.next()) {

								int id = rs.getInt(1); //mc_id
								String menu_category_name = rs.getString("mc_name"); //mc_name

								System.out.println("menu category name is '" + menu_category_name + "'");
								pstmt.setInt(1, id);
								// rs1=pstmt.executeQuery();

								out.println("<li class='nav-item'>");
								if (flag == false) {

									out.println(" <a class='nav-link active'  data-toggle='pill'  href='#" + id + "'>"
											+ menu_category_name + "</a>");
									flag = true;
								} else {

									out.println(" <a class='nav-link'  data-toggle='pill'  href='#" + id + "'>" + menu_category_name
											+ "</a>");

								}
								out.println("</li>");
								// 가격 및 메뉴
							}
					%>

				</ul>
			</nav>
			<!--  이까지 탭 메뉴를 가져오는 코드  -->
			<div class="tab-content" style="height: 540px; overflow: auto;"
				id="menu_items">
				<!--  이 부분에는 메뉴 아이템들이 들어감 -->
				<%
					query = "select mc_id, mc_name from menu_category where c_id=(select c_id from cafe where c_name=?) order by mc_id"; //c_name이 input_cafename인 cafe의 c_id를 가져온후, mc_id와 mc_name을 가져옴

						pstmt = conn.prepareStatement(query);

						pstmt.setString(1, input_cafename); //cafename이 KONA인 카페의 mc_id와 mc_name을 가져오기 위해서

						ResultSet rs2 = pstmt.executeQuery();

						query = "select m_name, m_price from menu where mc_id=?";

						pstmt = conn.prepareStatement(query);

						ResultSet rs3 = null;

						flag = false;
						while (rs2.next()) { //메뉴 카테고리를 읽어오는 코드 

							int category_id = rs2.getInt(1); //mc_id

							//	메뉴 카테고리 이름  가져오기 
							if (flag == false) {
								out.println("<div id='" + category_id + "' class='container tab-pane active'>");
								flag = true;
							} else {
								out.println("<div id='" + category_id + "' class='container tab-pane fade'>");
							}
							//각 메뉴 카테고리마다 아이템을 가져옴.
							int cnt = 1;
							out.println("<div class='row'>");

							pstmt.setInt(1, category_id);
							rs3 = pstmt.executeQuery();

							while (rs3.next()) {
								String menu_name = rs3.getString("m_name");

								int menu_price = rs3.getInt(2);

								System.out.println(menu_name + "  " + menu_price);

								if (cnt % 5 == 0) {
									out.println("</div>");
									out.println("<div class='row'>");
								}

								out.println("<div class='col custom-col btn-white-outline menu-item'>");
								out.println("<p class='m_name'>" + menu_name + "</p>");
								out.println("<hr>");
								out.println("<p class='m_price'>" + menu_price + "</p>");
								out.println("</div>");
								cnt++;

							}
							out.println("</div>");
							out.println("</div>");
						}
				%>

			</div>


		</div>

		<%
			rs.close();
				rs1.close();
				rs2.close();
				rs3.close();
				conn.commit();
				conn.setAutoCommit(true);
				pstmt.close();
				conn.close();
			} catch (Exception e) {
				System.err.println("sql error = " + e.getMessage());
			}
		%>


	</section>


	<script>
		function selectedRow() {

			var index, table = document.getElementById("order_table");

			for (var i = 1; i < table.rows.length; i++) {
				table.rows[i].onclick = clickfunc;
				function clickfunc() {
					// remove the background from the previous selected row
					if (typeof index !== "undefined") {
						table.rows[index].classList.toggle("selected");
					}
					console.log(typeof index);
					// get the selected row index
					index = this.rowIndex;
					// add class selected to the row
					this.classList.toggle("selected");
					console.log(typeof index);
				}
				;
			}

		}
		selectedRow();
	</script>
	<script src="assets/web/assets/jquery/jquery.min.js"></script>
	<script>
		var temp_menu_name = "";
		/*
		$("#example-table-1 tr").click(function() {

		  var str = ""
		  var tdArr = new Array(); // 배열 선언
		  // 현재 클릭된 Row(<tr>)
		  var tr = $(this);
		  var td = tr.children();

		  // tr.text()는 클릭된 Row 즉 tr에 있는 모든 값을 가져온다.
		  console.log("클릭한 Row의 모든 데이터 : " + tr.text());

		  // 반복문을 이용해서 배열에 값을 담아 사용할 수 도 있다.
		  td.each(function(i) {
		    tdArr.push(td.eq(i).text());
		  });

		  console.log("배열에 담긴 값 : " + tdArr);

		  // td.eq(index)를 통해 값을 가져올 수도 있다.
		  var no = td.eq(0).text();
		  var userid = td.eq(1).text();
		  var name = td.eq(2).text();
		  var email = td.eq(3).text();


		  str += " * 클릭된 Row의 td값 = No. : <font color='red'>" + no + "</font>" +
		    ", 아이디 : <font color='red'>" + userid + "</font>" +
		    ", 이름 : <font color='red'>" + name + "</font>" +
		    ", 이메일 : <font color='red'>" + email + "</font>";

		  $("#ex1_Result1").html(" * 클릭한 Row의 모든 데이터 = " + tr.text());
		  $("#ex1_Result2").html(str);

		});
		 */

		/*
		    $('#order_table tbody').click(function() {
		      var tr = $(this).children();
		      var td = tr.children();
		      alert(td.text());
		      $('#deleteSelectedItemsBtn').click(function() {
		        tr.remove();
		      });


		    //  var name = td.eq(0).text();
		  //    alert(name);

		    });
		 */

		 $('#order_table tr').click(function() {
				var tr = $(this);
				var td = tr.children();

				temp_menu_name = td.eq(0).text();
				//$("#ex1_Result1").html(" * 클릭된 Row의 데이터 = " +temp_menu_name);
			});
		 
		 
			$('#cardBtn').click(function() {
					var URL = "payment.jsp?cid="+<%=cid%>+"&payment=1";
					window.location.href = encodeURI(URL);
					});
			$('#cashBtn').click(function() {
					var URL = "payment.jsp?cid="+<%=cid%>+"&payment=2";
					window.location.href = encodeURI(URL);
				});
		 
			//주문 테이블에 있는 모든 행을 삭제하는 코드
			$('#deleteAllItemsBtn').click(function() {
				$('#order_table> tbody').empty();
				var URL = "DeleteTempTableData.jsp?cid="+<%=cid%>;
				window.location.href = encodeURI(URL);
			});

			$('#deleteSelectedItemsBtn').click(function() {
				$("#ex1_Result1").html(" * 클릭된 Row의 데이터 = " + temp_menu_name);

				var URL = "DeleteSelectedMenu.jsp?cid="+<%=cid%>+"&mname=" + temp_menu_name;
				temp_menu_name = "";
				window.location.href = encodeURI(URL);
			});

			$('#plusBtn').click(function() {
				var URL = "UpdateQty.jsp?cid="+<%=cid%>+"&action=plus&mname=" + temp_menu_name;
				temp_menu_name = "";
				window.location.href = encodeURI(URL);
			});

			$('#minusBtn').click(function() {
				var URL = "UpdateQty.jsp?cid="+<%=cid%>+"&action=minus&mname=" + temp_menu_name;
				temp_menu_name = "";
				window.location.href = encodeURI(URL);
			});

			//메뉴에 있는 아이템을 클릭했을 때, 왼쪽 테이블에 추가되고, 중복되는 행이 있으면 값이 증가하는 코드
			$('.menu-item').click(
					function() {

						var m_name = $(this).find('.m_name').text();
						var m_price = $(this).find('.m_price').text();

						var URL = "CreateTempTable.jsp?cid="+<%=cid%>+"&mname=" + m_name+ "&mprice=" + m_price;
						window.location.href = encodeURI(URL);

						/*
						var flag = 0;
						$("#order_table tr").each(
								
								function() {
									if ($(this).find("td").eq(0).text() == m_name) {
										var qty = $(this).find("td").eq(1).text();
										var temp = parseInt(qty) + 1;
										var unit_price = $(this).find("td").eq(2)
												.text();
										$(this).find("td").eq(1).text(temp);
										$(this).find("td").eq(3).text(
												parseInt(temp)
						 * parseInt(unit_price));
										flag = 1;
									}
								});

						if (flag == 0) {
							$('#order_table > tbody:last').append(
									'<tr><td>' + m_name + '</td><td>1</td><td>'
											+ m_price + '</td><td>' + m_price
											+ '</td></tr>');
						}

						var sum = 0;
						
						$('#order_table tbody tr').each(function(i) {
							var tr = $(this);
							var td = tr.children();
							var text = td.eq(3).text();

							sum += parseInt(text);
						});
						 */

						//$("#total_sum").val(sum);

					});
	</script>

	<script src="assets/popper/popper.min.js"></script>
	<script src="assets/tether/tether.min.js"></script>
	<script src="assets/bootstrap/js/bootstrap.min.js"></script>
	<script src="assets/smoothscroll/smooth-scroll.js"></script>
	<script src="assets/dropdown/js/script.min.js"></script>
	<script src="assets/touchswipe/jquery.touch-swipe.min.js"></script>
	<script src="assets/as-pie-progress/jquery-as-pie-progress.min.js"></script>
	<script src="assets/theme/js/script.js"></script>
</body>

</html>
