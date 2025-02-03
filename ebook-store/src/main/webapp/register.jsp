<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Ebook: Register</title>
<%@include file="allComponent/allCSS.jsp"%>
</head>
<body style="background-color: #fof1f2;">
	<%@ include file="allComponent/navBar.jsp"%>
	<div class="container p-2">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
						<h4 class="text-center">Registration Page</h4>
						<c:if test="${not empty succMsg}">
							<p class="text-center text-success">${succMsg}</p>
							<c:remove var="succMsg" scope="session" />
						</c:if>
						<c:if test="${not empty failedMsg}">
							<p class="text-center text-danger">${failedMsg}</p>
							<c:remove var="failedMsg" scope="session" />
						</c:if>

						<form action="register" method="post">
							<div class="form-group">
								<label for="name">Enter name</label> <input type="text"
									class="form-control" id="name" aria-describedby="nameHelp"
									placeholder="Enter name" required="required" name="fname">
							</div>
							<div class="form-group">
								<label for="email">Enter your E-mail</label> <input type="email"
									class="form-control" id="email" aria-describedby="emailHelp"
									placeholder="Enter email" required="required" name="email">
							</div>
							<div class="form-group">
								<label for="number">Enter your Phone Number</label> <input
									type="number" class="form-control" id="number"
									aria-describedby="phoneHelp" placeholder="Enter phone number"
									required="required" name="phno">
							</div>
							<div class="form-group">
								<label for="password">Password</label> <input type="password"
									class="form-control" id="password" placeholder="Password"
									required="required" name="password">
							</div>
							<div class="form-check">
								<input type="checkbox" class="form-check-input" name="check"
									id="exampleCheck1"> <label class="form-check-label"
									for="exampleCheck1">Agree Terms and Conditions</label>
							</div>
							<button type="submit" class="btn btn-primary">Submit</button>
						</form>

					</div>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="allComponent/footer.jsp"%>




</body>
</html>


