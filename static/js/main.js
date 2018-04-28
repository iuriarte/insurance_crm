let drivers = 1;

$(document).ready(function () {
  $('.datepicker').datepicker({
    yearRange: 90
  });
  $('select').formSelect();
  $('.tabs').tabs({});
  $('.tooltipped').tooltip();
  $('.sidenav').sidenav();

  $("input[type=radio][name=currently_insured]").click(function () {
    if ($("input[type=radio][name=currently_insured]:checked").val() === "No") {
      jQuery('#pop').hide();

    } else {

      jQuery('#pop').show();
    }
  });

  $("select[name=coverage]").change(function () {
    if ($("select[name=coverage][id=selects_field]").val() == "liability") {
      jQuery('#full_cover').hide();

    } else {

      jQuery('#full_cover').show();
    }
  });

  $("input[type=radio][name=tickets_accidents]").click(function () {
    
    if ($("input[type=radio][name=tickets_accidents]:checked").val() == "No") {
      jQuery('#accidents').hide();

    } else {

      jQuery('#accidents').show();
    }
  });

  $('#add_btn').click(function(){
    drivers+=1
    $(`<li class="tab"><a href="#drvier${drivers}"> drvier ${drivers}</a> </li>`).insertBefore(`#add_li`)
    $(`<div id="driver${drivers}" style='display:none;' >hello</div>`).insertBefore('#add_div')
    

  })



});




var driver = ['first_name', 'last_name', 'cell_phone', 'email', 'gender', 'marital_status', 'birthdate', 'relation', 'form_id', 'id_no']























