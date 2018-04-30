<!-- second Tabs-->
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





