<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<%@page import="com.entity.Book_Order"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.BookOrderDAO"%>
<%@page import="com.DAO.BookOrderDAOImpl"%>
<%@page import="com.entity.User"%>
<%@page import="com.entity.BookDetails"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EBook Store</title>
<%@include file="allCSS.jsp"%>
</head>
<body>
	<c:if test="${empty userobj }">
		<c:redirect url="../login.jsp"></c:redirect>
	</c:if>
	<%@include file="navBar.jsp"%>
	<h3 class="text-center mt-3 mb-3">Hello Admin</h3>

	<table class="table table-striped p-5 ">
		<thead class="bg-primary text-white">
			<tr>
				<th scope="col">OrderId</th>
				<th scope="col">Name</th>
				<th scope="col">Email</th>
				<th scope="col">Phone No.</th>
				<th scope="col">Address</th>
				<th scope="col">Book Name</th>
				<th scope="col">Author</th>
				<th scope="col">Category</th>
				<th scope="col">Price</th>
				<th scope="col">Payment Type</th>
			</tr>
		</thead>
		<tbody>
			<%
			BookOrderDAOImpl dao = new BookOrderDAOImpl(DBConnect.getConn());
			List<Book_Order> blist = dao.getAllOrder();
			for (Book_Order b : blist) {
			%>
			<tr>
				<th scope="row"><%=b.getOrderId()%></th>
				<td><%=b.getUsername()%></td>
				<td><%=b.getEmail()%></td>
				<td><%=b.getPhno()%></td>
				<td><%=b.getFulladd()%></td>
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

	<div style="margin-top: 330px">
		<%@include file="footer.jsp"%></div>
</body>
</html>