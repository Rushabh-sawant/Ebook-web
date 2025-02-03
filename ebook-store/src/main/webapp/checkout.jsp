<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<%@page import="com.entity.BookDetails"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.*"%>
<%@page import="com.entity.*"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>E-Book Shop</title>
<%@include file="allComponent/allCSS.jsp"%>
<style>
.wide-table {
	width: 100%;
	max-width: 1200px;
	margin: 0 auto; /* Center the table */
}

.card-body h3 {
	margin-bottom: 20px;
}
</style>
</head>
<body style="background-color: #f0f1f2">
	<%@include file="allComponent/navBar.jsp"%>

	<c:if test="${empty userobj }">
		<c:redirect url="login.jsp"></c:redirect>
	</c:if>

	<c:if test="${not empty succMsg }">
		<div class="alert alert-success text-center" role="alert">${succMsg}</div>
		<c:remove var="succMsg" scope="session" />
	</c:if>

	<c:if test="${not empty failedMsg }">
		<div class="alert alert-danger text-center" role="alert">${failedMsg}</div>
		<c:remove var="failedMsg" scope="session" />
	</c:if>

</body>
<div class="container">
	<div class="row p-2">

		<div class="col-md-6">
			<div class="card bg-white">
				<div class="card-body">
					<h3 class="text-center text-success">Your Selected Items</h3>
					<div class="table-responsive">
						<table class="table table-striped wide-table">
							<thead>
								<tr>
									<th scope="col">Book Name</th>
									<th scope="col">Author</th>
									<th scope="col">Price</th>
									<th scope="col">Action</th>
								</tr>
							</thead>
							<tbody>
								<%
								// Retrieve the user's cart data
								CartDAOImpl dao = new CartDAOImpl(DBConnect.getConn());
								List<Cart> cart = null;
								Double totalPrice = 0.0;

								try {
									com.entity.User u = (com.entity.User) session.getAttribute("userobj");
									if (u != null) {
										cart = dao.getBookByUser(u.getId());
									}

									if (cart != null) {
										for (Cart c : cart) {
									totalPrice += c.getPrice();
								%>
								<tr>
									<td><%=c.getBookName()%></td>
									<td><%=c.getAuthor()%></td>
									<td>₹<%=c.getPrice()%></td>
									<td><a
										href="remove_book?bid=<%=c.getBid()%>&uid=<%=c.getUserId()%>&cid=<%=c.getCid()%>"
										class="btn btn-sm btn-danger">Remove</a></td>
								</tr>
								<%
								}
								}
								} catch (Exception e) {
								e.printStackTrace();
								}
								%>
								<tr>
									<td colspan="2" class="text-right"><strong>Total
											Price:</strong></td>
									<td colspan="2">₹<%=totalPrice%></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>

		<!-- Order info -->

		<div class="col-md-6">
			<div class="card">
				<div class="card-body">
					<h3 class="text-center text-success">Your Details for Order</h3>
					<form action="order" method="post">
						<input type="hidden" value="${userobj.id}" name="id">

						<div class="form-row">
							<div class="form-group col-md-6">
								<label for="inputEmail4">Name</label> <input type="text"
									name="username" class="form-control" id="inputEmail4"
									value=${userobj.name } required>
							</div>
							<div class="form-group col-md-6">
								<label for="inputPassword4">Email</label> <input type="email"
									name="email" class="form-control" id="inputPassword4"
									value=${userobj.email } required>
							</div>
						</div>


						<div class="form-row">
							<div class="form-group col-md-6">
								<label for="inputEmail4">Phone number</label> <input name="phno"
									type="tel" pattern="^\d{10}$" required
									placeholder="Enter Phone Number"
									title="Please enter a valid 10 digit mobile number"
									class="form-control" id="inputEmail4" required>
							</div>
							<div class="form-group col-md-6">
								<label for="inputEmail4">Address</label> <input type="text"
									name="address" class="form-control" id="inputPassword4"
									value="" required>
							</div>
						</div>


						<div class="form-row">
							<div class="form-group col-md-6">
								<label for="inputEmail4">Landmark</label> <input type="text"
									name="landmark" class="form-control" id="inputEmail4" value=""
									required>
							</div>
							<div class="form-group col-md-6">
								<label for="inputPassword4">City</label> <input type="text"
									name="city" class="form-control" id="inputPassword4" value=""
									required>
							</div>
						</div>


						<div class="form-row">
							<div class="form-group col-md-6">
								<label for="inputEmail4">State</label> <input type="text"
									name="state" class="form-control" id="inputEmail4" value=""
									required>
							</div>
							<div class="form-group col-md-6">
								<label for="inputPassword4">Pin Code</label> <input type="text"
									name="pincode" class="form-control" id="inputPassword4"
									value="" required>
							</div>
						</div>

						<div class="form-group col-md-6">
							<label>Payment Mode</label> <select class="form-control"
								name="payment">
								<option value="noselect">----Select-----</option>
								<option value="online_payment">Online Payment</option>
								<option value="COD">Cash on Delivery</option>
							</select>

						</div>

						<div class="text-center">
							<button class="btn btn-warning">Order Now</button>
							<a href="index.jsp" class="btn btn-success">Continue Shopping</a>
						</div>
					</form>
				</div>
			</div>

		</div>

	</div>

</div>

<div style="margin-top: 95px">
	<%@include file="allComponent/footer.jsp"%></div>
</html>