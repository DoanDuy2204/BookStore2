
<div class="col-md-6 info-table">
	<table class="table table-bordered">
		<tr>
			<td>User name :</td>
			<td>${user.username}</td>
		</tr>
		<tr>
			<td>Name :</td>
			<td>${user.getCustomer().name}</td>
		</tr>
		<tr>
			<td>Email :</td>
			<td>${user.getCustomer().email}</td>
		</tr>
		<tr>
			<td>Gender :</td>
			<td>${user.getCustomer().gender}</td>
		</tr>
		<tr>
			<td>Date of birth :</td>
			<td>${user.getCustomer().dob}</td>
		</tr>
		<tr>
			<td>Number phone :</td>
			<td>${user.getCustomer().numberPhone}</td>
		</tr>
	</table>
</div>
