<%@page import="com.entity.Book_Order"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.BookOrderDAO"%>
<%@page import="com.DAO.BookOrderDAOImpl"%>
<%@page import="com.entity.User"%>
<%@page import="com.entity.BookDetails"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Order Book</title>
<%@include file="allComponent/allCSS.jsp"%>
</head>
<body style="background-color: #f0f1f2">
	<c:if test="${empty userobj }">
		<c:redirect url="login.jsp"></c:redirect>
	</c:if>
	<%@include file="allComponent/navBar.jsp"%>
	<div class="container p-1">

		<h3 class="text-center text-primary">Your Order</h3>
		<table class="table table-striped wide-table mt-3">
			<thead>
				<tr>
					<th scope="col">Order ID</th>
					<th scope="col">Name</th>
					<th scope="col">Phone No</th>
					<th scope="col">Book Name</th>
					<th scope="col">Author</th>
					<th scope="col">Category</th>
					<th scope="col">Price</th>
					<th scope="col">Payment Mode</th>
				</tr>
			</thead>
			<tbody>
				<%
				com.entity.User u = (com.entity.User) session.getAttribute("userobj");
				BookOrderDAOImpl dao = new BookOrderDAOImpl(DBConnect.getConn());
				List<Book_Order> blist = dao.getBook(u.getEmail());
				for (Book_Order b : blist) {
				%>
				<tr>
					<th scope="row"><%=b.getOrderId()%></th>
					<td><%=b.getUsername()%></td>
					<td><%=b.getPhno()%></td>
					<td><%=b.getBookName()%></td>
					<td><%=b.getAuthor()%></td>
					<td><%=b.getCategory()%></td>
					<td>₹<%=b.getPrice()%></td>
					<td><%=b.getPaymentType()%></td>

				</tr>
				<%
				}
				%>

			</tbody>
		</table>
	</div>


</body>
</html>