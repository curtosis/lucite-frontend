// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

$(document).ready(function(){
  $('input.ui-date-picker').datepicker({ dateFormat: "yy-mm-dd"});
});

function remove_fields(link) {
    $(link).prev("input[type=hidden]").val("1");
    $(link).closest(".fields").hide();
}

function add_fields(link, association, content) {
    var new_id = new Date().getTime();
    var regexp = new RegExp("new_" + association, "g");
    $(link).parent().before(content.replace(regexp, new_id));
}

function cancel_backspace(e) {
   var elid = $(document.activeElement).is("input:focus, textarea:focus"); 
  	if(e.keyCode === 8 && !elid){ 
      e.preventDefault(); 
	}
}

$(document).keypress(function(e){ 
  return cancel_backspace(e); 
});

$(document).keydown(function(e){
  return cancel_backspace(e);
});