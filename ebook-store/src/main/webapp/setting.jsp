<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Settings - E-Book Store</title>
<%@ include file="allComponent/allCSS.jsp"%>
<style>
a {
	text-decoration: none;
	color: black;
}

a:hover {
	text-decoration: none;
}
</style>
</head>
<body style="background-color: #FEFEFF;">
	<!-- Redirect to login if user is not logged in -->
	<c:if test="${empty userobj}">
		<c:redirect url="login.jsp" />
	</c:if>

	<!-- Navigation Bar -->
	<%@ include file="allComponent/navBar.jsp"%>

	<div class="container">
		<!-- Greeting User -->
		<h3 class="text-center">Hello, ${userobj.name}</h3>

		<c:if test="${not empty succMsg}">
			<h5 class="text-center text-success">${succMsg}</h5>
			<c:remove var="succMsg" scope="session" />
		</c:if>
		<div class="row p-5">
			<!-- Sell Old Books -->
			<div class="col-md-6">
				<a href="sellOldBook.jsp">
					<div class="card">
						<div class="card-body text-center">
							<div class="text-primary">
								<i class="fas fa-solid fa-book fa-3x"></i>
							</div>
							<h4 class="mt-3">Sell Old Books</h4>
						</div>
					</div>
				</a>
			</div>



			<div class="col-md-6">
				<a href="editProfile.jsp">
					<div class="card">
						<div class="card-body text-center">
							<div class="text-warning">
								<i class="fas fa-edit fa-3x"></i>
							</div>
							<h4 class="mt-3">Edit Profile</h4>
						</div>
					</div>
				</a>
			</div>

			

			<!-- My Orders -->
			<div class="col-md-6 mt-3">
				<a href="orders.jsp">
					<div class="card">
						<div class="card-body text-center">
							<div class="text-danger">
								<i class="fas fa-box-open fa-3x"></i>
							</div>
							<h4 class="mt-3">My Orders</h4>
							<p>Track Your Orders</p>
						</div>
					</div>
				</a>
			</div>

			<!-- Help Center -->
			<div class="col-md-6 mt-3">
				<a href="helpline.jsp">
					<div class="card">
						<div class="card-body text-center">
							<div class="text-primary">
								<i class="fas fa-user-circle fa-3x"></i>
							</div>
							<h4 class="mt-3">Help Center</h4>
							<p>24/7 Service</p>
						</div>
					</div>
				</a>
			</div>
		</div>
	</div>

	<!-- Footer -->
	<div style="margin-top: 95px">
		<%@include file="allComponent/footer.jsp"%></div>
</body>
</html>
