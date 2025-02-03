<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>E-Book Store</title>
<%@ include file="allComponent/allCSS.jsp"%>
</head>
<body style="background-color: #f0f1f2;">
	<%@ include file="allComponent/navBar.jsp"%>

	<div class="container mt-4">
		<div class="row">
			<div class="col-md-6 offset-md-3">
				<div class="card">
				<h4 class="text-success text-center mt-3 mb-3">Update Address</h4>
					<div class="card-body">
						<form>
							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputEmail4">Address</label> <input type="email"
										name="email" class="form-control" id="inputPassword4" value=""
										required>
								</div>
								<div class="form-group col-md-6">
									<label for="inputEmail4">Landmark</label> <input type="text"
										name="username" class="form-control" id="inputEmail4" value=""
										required>
								</div>
							</div>


							<div class="form-row">

								<div class="form-group col-md-4">
									<label for="inputPassword4">City</label> <input type="email"
										name="email" class="form-control" id="inputPassword4" value=""
										required>
								</div>

								<div class="form-group col-md-4">
									<label for="inputEmail4">State</label> <input type="text"
										name="username" class="form-control" id="inputEmail4" value=""
										required>
								</div>
								<div class="form-group col-md-4">
									<label for="inputPassword4">Pin Code</label> <input
										type="email" name="email" class="form-control"
										id="inputPassword4" value="" required>
								</div>
							</div>
							<div class="text-center mt-3">
								<button class="btn btn-warning">Update Address</button>
							</div>

						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>