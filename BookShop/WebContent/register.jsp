<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>D&Shop</title>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.4.1/css/all.css"
	integrity="sha384-5sAR7xN1Nv6T6+dT2mhtzEpVJvfS3NScPQTrOxhwjIuvcA67KV2R5Jz6kr4abQsz"
	crossorigin="anonymous">
<link href="https://fonts.googleapis.com/css?family=Roboto"
	rel="stylesheet">
<link rel="stylesheet" type="text/css"
	href="bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="css/home.css">
<script type="text/javascript" src="bootstrap/js/jquery-3.3.1.min.js">
</script>
</head>
<body>
	<jsp:include page="header/header.jsp"></jsp:include>
	<div class="container">
	<div class="col-md-6" style="margin:0 auto;" >
	<form action="UserController"
		onsubmit="return checkAccount()" name="vform" method="post">
		<h2 style="text-align:center;">Register</h2>
		<table class="table ">
		<tr>
			<td><input type="hidden" value="REGISTER" class="form-control" name="command"></td>
		</tr>
			<tr>
				<td scope="row">Name :</td>
				<td><input type="text"  class="form-control" name="u_name"></td>
			</tr>
			<tr>
				<td colspan="2" id="name_error" class="erro"></td>
			</tr>
			<tr>
				<td scope="row">Username :</td>
				<td><input type="text"  class="form-control" name="userName" id="username"></td>
			</tr>
			<tr>
				<td colspan="2" id="userName_error" class="erro"></td>
			</tr>
			<tr>
				<td scope="row">Password :</td>
				<td><input type="password"  class="form-control" name="passWord"></td>
			</tr>
			<tr>
				<td colspan="2" id="passWord_error" class="erro"></td>
			</tr>
			<tr>
				<td scope="row">Confirm :</td>
				<td><input type="password"  class="form-control" name="confirm"></td>
			</tr>
			<tr>
				<td colspan="2" id="confirm_error" class="erro"></td>
			</tr>
			<tr>
				<td scope="row">Gender :</td>
				<td><input type="radio" name="gender" value="Male" id="male"
					checked  > <label for="male">Male</label> <input type="radio"
					name="gender" value="Female" id="female" > <label
					for="female">Female</label></td>
			</tr>
			<tr>
				<td scope="row">Email :</td>
				<td><input type="text" name="email"  class="form-control"></td>
			</tr>

			<tr>
				<td scope="row">Address :</td>
				<td><input type="text" name="address"  class="form-control"></td>
			</tr>
			<tr>
				<td scope="row">Date :</td>
				<td><input type="date" name="dob"  class="form-control"></td>
			</tr>
			<tr>
				<td colspan="2" id="dob_error" class="erro" class="form-control" ></td>
			</tr>
			<tr>
				<td scope="row">Numberphone :</td>
				<td><input type="text" name="numberPhone"  class="form-control"></td>
			</tr>
			<tr>
				<td></td>
				<td >
					<button type="submit" class="btn btn-secondary">Created</button>
					<button type="submit"  class="btn btn-secondary">Reset</button>
				</td>
			</tr>
		</table>
	</form>
	</div>
	</div>
	<script type="text/javascript">
		$(document).ready(function(){
			$('#username').blur(function(){
				var username = $('#username').val();
				$.ajax({
					method:'GET',
					data:{username:username},
					url:'UserController',
					success : function(data){
						$('#userName_error').html(data);
					}
				});
			});
		});
		var u_name = document.forms['vform']['u_name'];
		var userName = document.forms['vform']['userName'];
		var passWord = document.forms['vform']['passWord'];
		var confirm = document.forms['vform']['confirm'];
		var dob = document.forms['vform']['dob'];

		var name_error = document.getElementById('name_error');
		var userName_error = document.getElementById('userName_error');
		var passWord_error = document.getElementById('passWord_error');
		var confirm_error = document.getElementById('confirm_error');
		var dob_error = document.getElementById('dob_error');

		u_name.addEventListener('blur',nameCheck,true);
		userName.addEventListener('blur',userNameCheck,true);
		passWord.addEventListener('blur',passWordCheck,true);
		confirm.addEventListener('blur',confirmCheck,true);
		dob.addEventListener('blur',dobCheck,true);

		function checkAccount(){
			if(u_name.value==""){
				u_name.style.border = "1px solid red";
				name_error.textContent = "*Name isn't empty."
				u_name.focus();
				return false;
			}
			if(userName.value==""){
				userName.style.border = "1px solid red";
				userName_error.textContent = "*Name isn't empty."
				userName.focus();
				return false;
			}
			if(passWord.value==""){
				passWord.style.border = "1px solid red";
				passWord_error.textContent = "*Name isn't empty."
				passWord.focus();
				return false;
			}
			if(confirm.value==""){
				confirm.style.border = "1px solid red";
				confirm_error.textContent = "*Name isn't empty."
				confirm.focus();
				return false;
			}
			if(dob.value==""){
				dob.style.border = "1px solid red";
				dob_error.textContent = "*Name isn't empty."
				dob.focus();
				return false;
			}
			if(passWord.value!=confirm.value){
				alert('Password and confirm don\'t together');
				return false;
			}
		}
		function nameCheck(){
			if(u_name.value!=""){
				u_name.style.border = "1px solid #DCDCDC";
				name_error.textContent = "";
				return true;
			}
		}
		function userNameCheck(){
			if(userName.value!=""){
				userName.style.border = "1px solid #DCDCDC";
				userName_error.textContent = "";
				return true;
			}
		}
		function passWordCheck(){
			if(passWord.value!=""){
				passWord.style.border = "1px solid #DCDCDC";
				passWord_error.textContent = "";
				return true;
			}
		}
		function confirmCheck(){
			if(confirm.value!=""){
				confirm.style.border = "1px solid #DCDCDC";
				confirm_error.textContent = "";
				return true;
			}
		}
		function dobCheck(){
			if(dob.value!=""){
				dob.style.border = "1px solid #DCDCDC";
				dob_error.textContent = "";
				return true;
			}
		}
	</script>
</body>
</html>