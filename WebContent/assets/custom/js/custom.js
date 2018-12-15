function autoHypenPhone(str) {
  str = str.replace(/[^0-9]/g, '');
  var tmp = '';
  if (str.length < 4) {
    return str;
  } else if (str.length < 7) {
    tmp += str.substr(0, 3);
    tmp += '-';
    tmp += str.substr(3);
    return tmp;
  } else if (str.length < 11) {
    tmp += str.substr(0, 3);
    tmp += '-';
    tmp += str.substr(3, 3);
    tmp += '-';
    tmp += str.substr(6);
    return tmp;
  } else {
    tmp += str.substr(0, 3);
    tmp += '-';
    tmp += str.substr(3, 4);
    tmp += '-';
    tmp += str.substr(7);
    return tmp;
  }
  return str;
}

var elements = document.getElementsByClassName("column");

// Declare a loop variable
var i;

// List View
function listView() {
  for (i = 0; i < elements.length; i++) {
    elements[i].style.width = "100%";
  }
}

// Grid View
function gridView() {
  for (i = 0; i < elements.length; i++) {
    elements[i].style.width = "20%";
  }
}

$(function() {
  $('table.floating-thead>thead').each(function() {
    $(this).after($(this).clone().hide().css('top', 0).css('position', 'fixed'));
  });

  $(window).scroll(function() {
    $('table.floating-thead').each(function(i) {
      var table = $(this),
        thead = table.find('thead:first'),
        clone = table.find('thead:last'),
        top = table.offset().top,
        bottom = top + table.height() - thead.height(),
        left = table.position().left,
        border = parseInt(thead.find('th:first').css('border-width')),
        scroll = $(window).scrollTop();

      if (scroll < top || scroll > bottom) {
        clone.hide();
        return true;
      }
      if (clone.is('visible')) return true;
      clone.css('left', left).show().find('th').each(function(i) {
        $(this).width(thead.find('th').eq(i).width() + border);
      });
    });
  });
});


function change_quantity(num) {
  var x = document.form;
  var y = Number(x.count.value) + num;
  if (y < 1) y = 1;
  x.count.value = y;
}

$(function() {
  $('.bt-up').click(function() {
    var n = $('.bt-up').index(this);
    var num = $(".num:eq(" + n + ")").val();
    num = $(".num:eq(" + n + ")").val(num * 1 + 1);
  });
  $('.bt-down').click(function() {
    var n = $('.bt-down').index(this);
    var num = $(".num:eq(" + n + ")").val();
    num = $(".num:eq(" + n + ")").val(num * 1 - 1);
  });
});


$(document).ready(function() {
  $('#click_btn').click(function() {
    var rows = document.getElementById("order_table").getElementsByTagName("tr");
    var sum = 0;
    var total = document.getElementById("total_order").value;

    //rows.length -> 한 행에 있는 컬럼의 갯수
    /*
      for (var i = 1; i < rows.length; i++) {
        sum += parseInt(rows[i].childNodes[3].firstChild.data);

      }*/
    var ipts = $("sub_total1").val();

    var ipts2 = $("sub_total2").val();

    //  var ipts3 = $("input[type='text'][class='beef_class3']");

    //sum = parseInt(ipts) + parseInt(ipts2);
    sum = ipts + ipts2;
    alert(sum);
    /*
      for (var i = 0; i < ipts.length; i++) {

        var val = ipts.eq(i).val();

        if (val == '') val = '0';

        sum += Number(val);

      }
      sum = parseInt(document.getElementById("sub_total1").value);*/
    /*  var s1 = document.getElementById("sub_total1").value;
    var s2 = document.getElementById("sub_total2").value;
    var s3 = document.getElementById("sub_total3").value;*/
    //document.getElementById("total_order") = sum;
    $("total_order").text(sum);

  });

});

$('#total_order tr').each(function() {
  var customerId = $(this).find("td").eq(2).html();

});


$(document).ready(function() {
  $("#btn1").click(function() {
    $("p").append(" <b>Appended text</b>.");
  });

  $("#btn2").click(function() {
    $("order_table tr").append("<td>1</td>");
  });
});



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

// 상단 선택버튼 클릭시 체크된 Row의 값을 가져온다.
$("#selectBtn").click(function() {

  var rowData = new Array();
  var tdArr = new Array();
  var checkbox = $("input[name=user_CheckBox]:checked");

  // 체크된 체크박스 값을 가져온다
  checkbox.each(function(i) {

    // checkbox.parent() : checkbox의 부모는 <td>이다.
    // checkbox.parent().parent() : <td>의 부모이므로 <tr>이다.
    var tr = checkbox.parent().parent().eq(i);
    var td = tr.children();

    // 체크된 row의 모든 값을 배열에 담는다.
    rowData.push(tr.text());

    // td.eq(0)은 체크박스 이므로  td.eq(1)의 값부터 가져온다.
    var no = td.eq(1).text() + ", "
    var userid = td.eq(2).text() + ", ";
    var name = td.eq(3).text() + ", ";
    var email = td.eq(4).text() + ", ";

    // 가져온 값을 배열에 담는다.
    tdArr.push(no);
    tdArr.push(userid);
    tdArr.push(name);
    tdArr.push(email);

    //console.log("no : " + no);
    //console.log("userid : " + userid);
    //console.log("name : " + name);
    //console.log("email : " + email);
  });

  $("#ex3_Result1").html(" * 체크된 Row의 모든 데이터 = " + rowData);
  $("#ex3_Result2").html(tdArr);
});




//카페 생성 날짜 입력 받는 창

function dateSelect(docForm,selectIndex) {
  watch = new Date(docForm.year.options[docForm.year.selectedIndex].text, docForm.month.options[docForm.month.selectedIndex].value,1);
  hourDiffer = watch - 86400000;
  calendar = new Date(hourDiffer);

  var daysInMonth = calendar.getDate();
    for (var i = 0; i < docForm.day.length; i++) {
      docForm.day.options[0] = null;
    }
    for (var i = 0; i < daysInMonth; i++) {
      docForm.day.options[i] = new Option(i+1);
  }
  document.form1.day.options[0].selected = true;
}

function Today(year,mon,day){
     if(year == "null" && mon == "null" && day == "null"){
     today = new Date();
     this_year=today.getFullYear();
     this_month=today.getMonth();
     this_month+=1;
     if(this_month <10) this_month="0" + this_month;

     this_day=today.getDate();
     if(this_day<10) this_day="0" + this_day;
 }
 else{
     var this_year = eval(year);
     var this_month = eval(mon);
     var this_day = eval(day);
     }

  montharray=new Array(31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31);
  maxdays = montharray[this_month-1];
//아래는 윤달을 구하는 것
  if (this_month==2) {
      if ((this_year/4)!=parseInt(this_year/4)) maxdays=28;
      else maxdays=29;
  }

 document.writeln("<select name='year' size=1 onChange='dateSelect(this.form,this.form.month.selectedIndex);'>");
     for(i=this_year-5;i<this_year+6;i++){//현재 년도에서 과거로 5년까지 미래로 5년까지를 표시함
         if(i==this_year) document.writeln("<OPTION VALUE="+i+ " selected >" +i);
         else document.writeln("<OPTION VALUE="+i+ ">" +i);
     }
 document.writeln("</select>년");


 document.writeln("<select name='month' size=1 onChange='dateSelect(this.form,this.selectedIndex);'>");
     for(i=1;i<=12;i++){
         if(i<10){
             if(i==this_month) document.writeln("<OPTION VALUE=0" +i+ " selected >0"+i);
             else document.writeln("<OPTION VALUE=0" +i+ ">0"+i);
         }
         else{
             if(i==this_month) document.writeln("<OPTION VALUE=" +i+ " selected >" +i);
             else document.writeln("<OPTION VALUE=" +i+ ">" +i);
         }
    }
 document.writeln("</select>월");

 document.writeln("<select name='day' size=1>");
     for(i=1;i<=maxdays;i++){
         if(i<10){
             if(i==this_day) document.writeln("<OPTION VALUE=0" +i+ " selected >0"+i);
             else document.writeln("<OPTION VALUE=0" +i+ ">0"+i);
         }

         else{
             if(i==this_day) document.writeln("<OPTION VALUE=" +i+ " selected } >"+i);
             else document.writeln("<OPTION VALUE=" +i+ ">" +i);
         }
    }
 document.writeln("</select>일");


}



/*
$(function(){
	  $('#host_password').keyup(function(){
	   $('font[name=check]').text('');
	  }); //#user_pass.keyup

	  $('#host_password_confirm').keyup(function(){
	   if($('#host_password').val()!=$('#host_password_confirm').val()){
	    $('font[name=check]').text('');
	    $('font[name=check]').html("비밀번호가 일치하지 않습니다.");
	   }else{
	    $('font[name=check]').text('');
	    $('font[name=check]').html("비밀번호가 일치합니다.");
	   }
	  }); //#chpass.keyup
	 });
*/


$(function(){
    $("#alert-success").hide();
    $("#alert-danger").hide();
    $("#host_password").keyup(function(){
        var pwd1=$("#host_password").val();
        var pwd2=$("#host_password_confirm").val();
        if(pwd1 != "" || pwd2 != ""){
            if(pwd1 == pwd2){
                $("#alert-success").show();
                $("#alert-danger").hide();
                $("#register_btn").removeAttr("disabled");
            }else{
                $("#alert-success").hide();
                $("#alert-danger").show();
                $("#register_btn").attr("disabled", "disabled");
            }
        }
    });

    $("#host_password_confirm").keyup(function(){
        var pwd1=$("#host_password").val();
        var pwd2=$("#host_password_confirm").val();
        if(pwd1 != "" || pwd2 != ""){
            if(pwd1 == pwd2){
                $("#alert-success").show();
                $("#alert-danger").hide();
                $("#register_btn").removeAttr("disabled");
            }else{
                $("#alert-success").hide();
                $("#alert-danger").show();
                $("#register_btn").attr("disabled", "disabled");
            }
        }
    });
});


