function empty_error(div_id){
    document.getElementById("reg-error").innerHTML = null;
    document.getElementById(div_id).style.backgroundColor = none;
}

function show_error(div_id, msg){
    document.getElementById("reg-error").innerHTML = msg;
    document.getElementById(div_id).style.backgroundColor = "#ff8880";
    document.getElementById(div_id).focus();
}

const full_name = document.getElementById("fname");
const email = document.getElementByName("mail");
const contact = document.getElementByName("contact");
const age = document.getElementByName("age");
const pwd = document.getElementByName("pass");
const pwd2 = document.getElementByName("re-pass");

function validateRegForm(){
    /*empty_error("fname-div");*/
const full_name = document.getElementById("fname");
alert(full_name);
    if(!full_name.value.test(/^[A-Za-z\s]+$/))
    {
	alert("HI");
       /* document.getElementById("reg-error").innerHTML = "Invalid Name";
        document.getElementById("fname-div").style.backgroundColor = "#ff8880";*/
        return false;
    }
    else{
	alert("HI");
        empty_error("fname-div");
    }
}

function validate_age(){
    if(!age.value.match(/^[0-9]{2}$/))
    {
        document.getElementById("age-div").style.backgroundColor = "#ff8880";
       document.getElementById("reg-error").innerHTML = "Age should be a number.";
       age.focus();
    }
    else{
        empty_error();
    }
}

function validate_con(){ 
    if(!contact.value.match(/^[0-9]{10}$/))
    {
        document.getElementById("contact-div").style.backgroundColor = "#ff8880";
        document.getElementById("reg-error").innerHTML = "Invalid Contact. Enter 10 digit contact number.";
        contact.focus();
    }
    else{ 
        empty_error();
    }
}

function passowrdPlaceholder(){
    if(pwd.value == ""){
        pwd.placeholder ="Enter minimum 4 character length password.";
    }
}

function validatePwd(){
    if(pwd.value.length > 0){
        if(pwd.value.length < 4){
            document.getElementById("pwd-div").style.backgroundColor = "#ff8880";
            document.getElementById("reg-error").innerHTML = "Password too short.";
        }
        else if(pwd.value.length > 8){
            document.getElementById("pwd-div").style.backgroundColor = "#ff8880";
            document.getElementById("reg-error").innerHTML = "Password too long.";
        }
        else {
            empty_error();
        }
    }
}