<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="col-md-6">
	<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<form action="UserController?command=CHECKCHANGEPASS"
		onsubmit="return checkPass()" method="post">
		<table class="table table-bordered">
			<tr>
				<td>Password :</td>
				<td><input type="password" id="password" name="password"
					class="form-control" /></td>
			</tr>
			<c:if test="${error!=null}">
				<tr>
					<td colspan="2">${error}</td>
				</tr>
			</c:if>
			<tr>
				<td>New password:</td>
				<td><input type="password" name="newpass" id="newpass"
					class="form-control"></td>
			</tr>
			<tr>
				<td>Confirm password:</td>
				<td><input type="password" id="confirmpass"
					class="form-control"></td>
			</tr>
			<tr>
				<td colspan="2" id="error1"></td>
			</tr>
			<c:if test="${notify!=null}">
				<tr>
					<td colspan="2">${notify}</td>
				</tr>
			</c:if>
			<tr>
				<td colspan="2" style="text-align: right;"><button
						type="submit" class="btn btn-secondary">Confirm</button></td>
			</tr>
			<tr></tr>
		</table>
	</form>
</div>
<script type="text/javascript">
	var newpass = $('#newpass');
	var confirmpass = $('#confirmpass');
	var error = $('#error1');
	function checkPass(){
		if(newpass.val()!=""){
			if(confirmpass.val()==newpass.val()){
				return true;
			}else{
				error.html('*Newpass not same confirmpass.');
				return false;
			}
		}else{
			newpass.focus();
			error.html('*Pass is empty.');
			return false;
		}
	}
	
</script>