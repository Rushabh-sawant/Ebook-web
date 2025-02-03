<%@page import="com.DAO.bookDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<%@ page import="com.DB.DBConnect"%>
<%@ page import="java.util.List"%>
<%@ page import="com.entity.BookDetails"%>
<%@ page import="com.DAO.bookDAOImpl"%>
<%@ page import="java.util.List"%>
<%@ page import="com.entity.BookDetails"%>
<%@ page import="com.DB.DBConnect"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>E-Book Shop</title>
<%@include file="allComponent/allCSS.jsp"%>
</head>
<body style="background-color: #f0f1f2;">
	<%@include file="allComponent/navBar.jsp"%>


	<%
	int bid = Integer.parseInt(request.getParameter("bid"));
	bookDAOImpl dao = new bookDAOImpl(DBConnect.getConn());
	BookDetails b = dao.getBookById(bid);
	%>

	<div class="container p-3">
		<div class="row">
			<div class="col-md-6 text-center p-5 border bg-white">
				<img src="books/<%=b.getPhoto()%>"
					style="height: 200px; width: 150px">
				<h4 class="mt-3">
					Book Name: <span class="text-success"><%=b.getBookname()%></span>
				</h4>
				<h4>
					Author Name: <span class="text-success"><%=b.getBookauthor()%></span>
				</h4>
				<h5>
					Category: <span class="text-success"><%=b.getBookcategory()%></span>
				</h5>
			</div>

			<div class="col-md-6 text-center p-5 border bg-white">

				<h2 class="text-primary"><%=b.getBookname()%></h2>

				<%
				if ("Old".equals(b.getBookcategory())) {
				%>
				<h5 class="mt-4">Contact to Seller</h5>
				<h6>
					<i class="fas fa-envelope"></i> Email:
					<%=b.getUser_email()%>
				</h6>

				<%
				}
				%>


				<div class="row">
					<div class="col-md-4 text-danger text-center p-2 mt-3">
						<i class="fas fa-money-bill-wave fa-2x"></i>
						<p>Cash on Delivery</p>
					</div>
					<div class="col-md-4 text-danger text-center p-2 mt-3">
						<i class="fas fa-undo-alt fa-2x"></i>
						<p>Return Available</p>
					</div>
					<div class="col-md-4 text-danger text-center p-2 mt-3">
						<i class="fas fa-truck-moving fa-2x"></i>
						<p>Free Shipping</p>
					</div>


					<%
					if ("Old".equals(b.getBookcategory())) {
					%>
					<div class="text-center p-3 mt-3">
						<a href="index.jsp" class="btn btn-success"><i class="fas fa-cart-plus"></i>
							Continue Shopping</a> <a href="" class="btn btn-danger"><i
							class="fas fa-rupee-sign"></i> <%=b.getPrice()%></a>
					</div>

					<%
					} else {
					%>


				</div>
				<div class="text-center p-3 mt-3">
					<a href="" class="btn btn-primary"><i class="fas fa-cart-plus"></i>
						Add to Cart</a> <a href="" class="btn btn-danger"><i
						class="fas fa-rupee-sign"></i> <%=b.getPrice()%></a>
				</div>

				<%
				}
				%>
			</div>
		</div>
	</div>
</body>
</html>