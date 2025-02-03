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

<script>
	function validateCard() {
		var cardNum = document.getElementById('cardNum').value;
		var visaRegex = /^(?:4[0-9]{12}(?:[0-9]{3})?)$/;
		var mastercardRegex = /^(?:5[1-5][0-9]{14})$/;
		var cardTypeField = document.getElementById('cardType');
		var errorField = document.getElementById('error');

		if (visaRegex.test(cardNum)) {
			cardTypeField.innerHTML = "Visa";
			cardTypeField.classList.remove('error');
			return true;
		} else if (mastercardRegex.test(cardNum)) {
			cardTypeField.innerHTML = "Mastercard";
			cardTypeField.classList.remove('error');
			return true;
		} else {
			errorField.innerHTML = 'Please enter a valid Visa or Mastercard card number.';
			cardTypeField.innerHTML = "";
			cardTypeField.classList.add('error');
			return false;
		}
	}
</script>
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


	<div class="col-md-4 offset-md-4 mt-4">

		<div class="card">
			<div class="card-body">
				<h3 class="text-center text-success">Enter Card Details</h3>
				<form action="order" method="post">
					<input type="hidden" value="${userobj.id}" name="id">

					<div class="form-row">


						<label for="inputEmail4">Card number</label> <input name="phno"
							type="tel" pattern="^\d{16}$" required
							placeholder="XXXX-XXXX-XXXX-XXXX"
							title="Please enter a valid 10 digit mobile number"
							class="form-control" id="inputEmail4" required>


						<div class="card-type" id="cardType"></div>
						<div class="error" id="error"></div>

					</div>

					<div class="form-row mt-2">
						<label for="cardholderName">Cardholder Name:</label> <input
							type="text" placeholder="Enter your full name"
							id="cardholderName" class="form-control" name="cardholderName"
							required>
					</div>


					<div class="form-row">
						<div class="form-group col-md-6">
							<label for="expDate">Expiration Date:</label> <input type="text"
								placeholder="MM/YY" id="expDate" name="expDate"
								title="Please enter card Expiry Date" class="form-control"
								maxlength="5" required>
						</div>
						<div class="form-group col-md-6">
							<label for="cvv">CVV:</label> <input type="text"
								placeholder="XXX" id="cvv" name="cvv" title="Please enter CVV"
								class="form-control" maxlength="3" required>
						</div>
					</div>

					<div class="text-center">
						<a href="order_success.jsp" class="btn btn-success">Confirm
							Order</a> <a href="checkout.jsp" class="btn btn-danger">Cancel
							Payment</a>
					</div>
				</form>
			</div>
		</div>

	</div>

	</div>

</body>

<div style="margin-top: 225px">
	<%@include file="allComponent/footer.jsp"%></div>
</html>