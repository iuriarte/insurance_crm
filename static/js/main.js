let drivers = 1;
// M.AutoInit();
// var instance = M.Tabs.init('.tabs', );
function materialize(){
  $(".datepicker").datepicker({
    yearRange: 90
  });
  $("select").formSelect();
  $(".tabs").tabs({});

  $(".tooltipped").tooltip();
  $(".sidenav").sidenav();

  $("input[type=radio][name=currently_insured]").click(function() {
    if ($("input[type=radio][name=currently_insured]:checked").val() === "No") {
      jQuery("#pop").hide();
    } else {
      jQuery("#pop").show();
    }
  });

  $("select[name=coverage]").change(function() {
    if ($("select[name=coverage][id=selects_field]").val() == "liability") {
      jQuery("#full_cover").hide();
    } else {
      jQuery("#full_cover").show();
    }
  });

  $("input[type=radio][name=tickets_accidents]").click(function() {
    if ($("input[type=radio][name=tickets_accidents]:checked").val() == "No") {
      jQuery("#accidents").hide();
    } else {
      jQuery("#accidents").show();
    }
  });




}

$(window).on("load", function() {

  materialize();


  $("#add_btn").on("click", function() {
    
    drivers += 1;
    $(
      `<li class="tab"><a href="#driver${drivers}"> driver ${drivers}</a> </li>`
    ).insertBefore("#add_li");
    $(`<div id="driver${drivers}" style='display:none;'>
    <!-- driver ${drivers} Tabs-->
<h5 class="center-align">Driver ${drivers} information</h5>
<!-- <h6 class="center-align">Additional driver info</h6> -->
<div class="row">
    <div class="input field col s6 offset-m3 m3">
        <input id="first_name${drivers}" type="text" class="validate">
        <label for="first_name${drivers}">First Name</label>
    </div>

    <div class="input field col s6  m3">
        <input id="last_name${drivers}" type="text" class="validate">
        <label for="last_name${drivers}">Last Name</label>
    </div>
</div>
<div class="row">
    <div class="input field col s6 offset-m3 m3">
        <input id="cell_phone${drivers}" type="text" class="validate">
        <label for="cel_phone${drivers}">cell phone</label>
    </div>

    <div class="input field col s6 m3">
        <input id="email${drivers}" type="text" class="validate">
        <label for="email${drivers}">Email</label>
    </div>

</div>
<div class="divider"></div>
<div class="row">
    <div class="col s6 offset-m3 m3">

        <p>
            <label>
                <input class="with-gap" name="gender${drivers}" type="radio" value="male" checked />
                <span>Male</span>
            </label>
        </p>
        <p>
            <label>
                <input class="with-gap" name="gender${drivers}" type="radio" value="female" />
                <span>Female</span>
            </label>
        </p>
    </div>
    <div class="col s6 m3">
        <p>
            <label>
                <input class="with-gap" name="marital_status${drivers}" type="radio" value="single" checked />
                <span>Single</span>
            </label>
        </p>
        <p>
            <label>
                <input class="with-gap" name="marital_status${drivers}" type="radio" value="Married" />
                <span>Married</span>
            </label>
        </p>

    </div>

</div>
<div class="divider"></div>
<div class="row">

    <div class="col s6 offset-m3 m3">
        <label for="birthdate${drivers}" class>birthdate</label>
        <input id="birthdate${drivers}" type="text" class="datepicker">


    </div>

    <div class=" input-field col s6 m3">
        <select id='relation${drivers}'>
            <option  value="self" >Self</option>
            <option class="flow-text" value="spouse" selected>Spouse/common law</option>
            <option value="sibiling">Sibiling</option>
            <option value="parent">Parent</option>
            <option value="child">Child</option>
            <option value="other">Other</option>
        </select>
        <label>Relation to primary driver:</label>
    </div>
</div>

<div class="row">
    <div class=" input-field col s6 offset-m3 m3">
        <select id="id_type${drivers}">
            <option value="Tx DL" selected>Texas Drivers License</option>
            <option value="Tx ID">Texas ID</option>
            <option value="Out of state">Out of state</option>
            <option value="passport">Passport</option>
            <option value="matricula">Matricula</option>
            <option value="International DL">International Drivers License</option>
            <option value="no ID">No ID</option>
        </select>
        <label>Form of ID (Choose one):</label>
    </div>
    <div class="input field col s6 m3">
        <label for="ID_No${drivers}">ID Number</label>
        <input id="ID_No${drivers}" type="text" class="validate">

    </div>

</div>
    
    </div>`).insertBefore("#add_div");

    materialize();
  });

  // $('#add_btn').click(function(){
  //   drivers+=1
  //   $(`<li class="tab"><a href="#drvier${drivers}"> drvier ${drivers}</a> </li>`).insertBefore(`#add_li`)
  //   $(`<div id="driver${drivers}" style='display:none;' >hello</div>`).insertBefore('#add_div')

  // })
});



var driver = [
  "first_name",
  "last_name",
  "cell_phone",
  "email",
  "gender",
  "marital_status",
  "birthdate",
  "relation",
  "form_id",
  "id_no"
];
