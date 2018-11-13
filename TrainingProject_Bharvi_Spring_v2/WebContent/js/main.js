document.getElementById("button-login").disabled = true;
document.getElementById("button-signup").disabled = true;

var status1 = "",status3 = "",status2 = "";

function validateEmailField() {
	var email = document.getElementById("email_signup").value;
	
	if(email == "") {
		document.getElementById("msg_email").innerHTML="<small>is mandatory</small>";
		status1 = false;
	} else {
		var mailFormat = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
		if(!(mailFormat.test(email))) {
			document.getElementById("msg_email").innerHTML="<small>enter valid email</small>";
			status1 = false;
		} else {
			document.getElementById("msg_email").innerHTML="";
			status1 = true;
		}
	}
	
	checkButton();
}
		


function validateNameField(){
	var name = document.getElementById("name_signup");
	if(name.value == ""){
		document.getElementById("msg_name").classList.add('alert-danger');
		document.getElementById("msg_name").innerHTML="<small>is mandatory</small>";
		status2=false;
	}else{
		document.getElementById("msg_name").classList.remove('alert-danger');
		document.getElementById("msg_name").innerHTML="";
		 status2=true;
	}
	
	checkButton();
	
}

function validatePassField(){
	var password = document.getElementById("pwd_signup");
	if(password.value == ""){
		document.getElementById("msg_password").classList.add('alert-danger');
		document.getElementById("msg_password").innerHTML="<small>is mandatory</small>";
		status3=false;
	}else{
		document.getElementById("msg_password").classList.remove('alert-danger');
		document.getElementById("msg_password").innerHTML="";
		status3=true;
	}
	checkButton();
}

function checkButton() {
	if(status1==true && status2==true && status3==true){
		document.getElementById("button-signup").disabled = false;
	}
}

// for signin
document.getElementById("button-login").disabled = true;
document.getElementById("button-signup").disabled = true;

var status4 = "",status5 = "";

function validateEmailField2() {
	var email = document.getElementById("email_login").value;
	
	if(email == "") {
		document.getElementById("msg_email_login").innerHTML="<small>is mandatory</small>";
		status4 = false;
	} else {
		var mailFormat = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
		if(!(mailFormat.test(email))) {
			document.getElementById("msg_email_login").innerHTML="<small>enter valid email</small>";
			status4 = false;
		} else {
			document.getElementById("msg_email_login").innerHTML="";
			status4 = true;
		}
	}
	
	checkButton2();
}
		
function validatePasswordField2(){
	var password = document.getElementById("pwd_login");
	if(password.value == ""){
		document.getElementById("msg_pwd_login").classList.add('alert-danger');
		document.getElementById("msg_pwd_login").innerHTML="<small>is mandatory</small>";
		status5=false;
	}else{
		document.getElementById("msg_pwd_login").classList.remove('alert-danger');
		document.getElementById("msg_pwd_login").innerHTML="";
		status5=true;
	}
	checkButton2();
}

function checkButton2() {
	if(status4==true && status5==true){
		document.getElementById("button-login").disabled = false;
	}
}