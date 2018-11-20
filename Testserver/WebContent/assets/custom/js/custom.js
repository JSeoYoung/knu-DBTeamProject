function autoHypenPhone(str){
            str = str.replace(/[^0-9]/g, '');
            var tmp = '';
            if( str.length < 4){
                return str;
            }else if(str.length < 7){
                tmp += str.substr(0, 3);
                tmp += '-';
                tmp += str.substr(3);
                return tmp;
            }else if(str.length < 11){
                tmp += str.substr(0, 3);
                tmp += '-';
                tmp += str.substr(3, 3);
                tmp += '-';
                tmp += str.substr(6);
                return tmp;
            }else{
                tmp += str.substr(0, 3);
                tmp += '-';
                tmp += str.substr(3, 4);
                tmp += '-';
                tmp += str.substr(7);
                return tmp;
            }
            return str;
        }

var cellPhone = document.getElementById('cellPhone');
cellPhone.onkeyup = function(event){
        event = event || window.event;
        var _val = this.value.trim();
        this.value = autoHypenPhone(_val) ;
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

$(function () {
  $('table.floating-thead>thead').each(function() {
    $(this).after( $(this).clone().hide().css('top',0).css('position','fixed') );
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

      if( scroll < top || scroll > bottom ) {
        clone.hide();
        return true;
      }
      if( clone.is('visible') ) return true;
      clone.css('left',left).show().find('th').each(function(i) {
        $(this).width( thead.find('th').eq(i).width() + border );
      });
    });
  });
});
