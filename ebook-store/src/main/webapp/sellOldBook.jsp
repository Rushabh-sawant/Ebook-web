<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>E-Book Store</title>
<%@include file="allComponent/allCSS.jsp"%>
</head>
<body style="background-color: #f0f1f2">
	<c:if test="${empty userobj }">
		<c:redirect url="Login.jsp" />
	</c:if>



	<%@include file="allComponent/navBar.jsp"%>


	<div>
		<div class="container mt-3">
			<div class="row">
				<div class="col-md-4 offset-md-4">
					<div class="card">
						<div class="card-body">
							<h4 class="text-center text-primary p-1">Sell Old Book</h4>

							<c:if test="${not empty succMsg }">
								<p class="text-center text-success">${succMsg}</p>
								<c:remove var="succMsg" scope="session" />
							</c:if>

							<c:if test="${not empty failedMsg }">
								<p class="text-center text-danger">${failedMsg}</p>
								<c:remove var="failedMsg" scope="session" />
							</c:if>

							<form action="${pageContext.request.contextPath}/AddOldBook"
								method="post" enctype="multipart/form-data">
								<input type="hidden" value="${userobj.email}" name="user">

								<div class="form-group">
									<label for="bookName">Book Name*</label> <input name="bname"
										type="text" class="form-control" id="bookName" required>
								</div>

								<div class="form-group">
									<label for="bookAuthor">Book Author*</label> <input
										name="author" type="text" class="form-control" id="bookAuthor"
										required>
								</div>

								<div class="form-group">
									<label for="bookPrice">Price*</label> <input name="price"
										type="number" class="form-control" id="bookPrice" required>
								</div>

								<div class="form-group">
									<label for="bookImage">Upload Photo</label> <input name="bimg"
										type="file" class="form-control-file" id="bookImage">
								</div>

								<div class="text-center mt-3">
									<button type="submit" class="btn btn-primary">Sell</button>
								</div>
							</form>

						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Footer -->
	<div style="margin-top: 100px">
		<%@include file="allComponent/footer.jsp"%></div>
</body>
</html>