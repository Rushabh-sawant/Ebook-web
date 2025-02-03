<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="com.DB.DBConnect"%>
<%@ page import="com.DAO.bookDAOImpl"%>
<%@ page import="com.entity.BookDetails"%>
<%@ page import="com.entity.User"%>
<%@ page import="java.util.List"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>E-Book Store</title>
<%@include file="allComponent/allCSS.jsp"%>
<style type="text/css">
.back-img {
	background: url("img/books.jpg");
	height: 500px;
	width: 100%;
	background-size: cover;
	background-repeat: no-repeat;
}

.crd-ho:hover {
	background-color: #fcf7f7;
}
</style>
</head>
<body style="background-color: #f7f7f7">


	<%
	User u = (User) session.getAttribute("userobj");
	%>

	<%@include file="allComponent/navBar.jsp"%>
	<div class="container-fluid back-img">
		<h2 class="text-center text-warning">EBook Store</h2>
	</div>



	<!-- Start Recent Books -->

	<div class="container-fluid ml-1">
		<h3 class="text-center mt-3 mb-3">Recent Books</h3>
		<div class="row">
			<%
			bookDAOImpl dao2 = new bookDAOImpl(DBConnect.getConn());
			List<BookDetails> list2 = dao2.getRecentBooks();
			for (BookDetails b : list2) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="books/<%=b.getPhoto()%>"
							style="width: 150px; height: 200px" class="img-thumblin">
						<p class="mt-2"><%=b.getBookname()%></p>
						<p><%=b.getBookauthor()%></p>
						<p>
							Categories:
							<%=b.getBookcategory()%>
						</p>
						<div class="row">
							<%
							if (b.getBookcategory().equals("Old")) {
							%>
							<%
							if (u == null) {
							%>
							<a href="login.jsp" class="btn btn-danger btn-sm ml-4"><i
								class="fas fa-cart-plus "></i> Add Cart</a>
							<%
							} else {
							%>
							<a href="cart?bid=<%=b.getBookId()%>&uid=<%=u.getId()%>"
								class="btn btn-danger btn-sm ml-4"> <i
								class="fas fa-cart-plus"></i> Add Cart
							</a>

							<%
							}
							%>
							<a href="viewBooks.jsp?bid=<%=b.getBookId()%>"
								class="btn btn-success btn-sm ml-3"> View Details</a> <a
								href="#" class="btn btn-danger btn-sm ml-3"> <i
								class="fas fa-rupee-sign"></i> <%=b.getPrice()%>
							</a>
							<%
							} else {
							%>
							<%
							if (u == null) {
							%>
							<a href="login.jsp" class="btn btn-danger btn-sm ml-4"><i
								class="fas fa-cart-plus "></i> Add Cart</a>
							<%
							} else {
							%>
							<a href="cart?bid=<%=b.getBookId()%>&uid=<%=u.getId()%>"
								class="btn btn-danger btn-sm ml-4"> <i
								class="fas fa-cart-plus"></i> Add Cart
							</a>

							<%
							}
							%>
							<a href="viewBooks.jsp?bid=<%=b.getBookId()%>"
								class="btn btn-success btn-sm ml-3"> View Details</a> <a
								href="#" class="btn btn-danger btn-sm ml-3"> <i
								class="fas fa-rupee-sign"></i> <%=b.getPrice()%></a>
							<%
							}
							%>
						</div>
					</div>




				</div>
			</div>
			<%
			}
			%>

		</div>
		<div class="text-center mt-3 mb-3">
			<a href="all_recentBooks.jsp"
				class="btn btn-danger btn-sm text-white">View All</a>
		</div>

	</div>

	<hr>

	<!-- End Recent Books -->

	<!-- Start New Books -->
	<div class="container-fluid ml-1">
		<h3 class="text-center mt-3 mb-3">New Books</h3>
		<div class="row">
			<%
			bookDAOImpl dao = new bookDAOImpl(DBConnect.getConn());
			List<BookDetails> list = dao.getNewBook();
			for (BookDetails b : list) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="books/<%=b.getPhoto()%>"
							style="width: 150px; height: 200px" class="img-thumbin">
						<p class="mt-2"><%=b.getBookname()%></p>
						<p><%=b.getBookauthor()%></p>
						<p>
							Categories:
							<%=b.getBookcategory()%>
						</p>
						<div class="row text-center">

							<%
							if (u == null) {
							%>
							<a href="login.jsp" class="btn btn-danger btn-sm ml-4"><i
								class="fas fa-cart-plus "></i> Add Cart</a>
							<%
							} else {
							%>
							<a href="cart?bid=<%=b.getBookId()%>&uid=<%=u.getId()%>"
								class="btn btn-danger btn-sm ml-4"> <i
								class="fas fa-cart-plus"></i> Add Cart
							</a>

							<%
							}
							%>
							<a href="viewBooks.jsp?bid=<%=b.getBookId()%>"
								class="btn btn-success btn-sm ml-3"> View Details</a> <a
								href="#" class="btn btn-danger btn-sm ml-3"> <i
								class="fas fa-rupee-sign"></i> <%=b.getPrice()%>
							</a>
						</div>
					</div>
				</div>
			</div>
			<%
			}
			%>

		</div>
		<div class="text-center mt-3 mb-3">
			<a href="all_newBooks.jsp" class="btn btn-danger btn-sm text-white">View
				All</a>
		</div>

	</div>

	<hr>

	<!-- End New Books -->

	<!-- Start Old Books -->

	<div class="container-fluid ml-1">
		<h3 class="text-center mt-3 mb-3">Old Books</h3>
		<div class="row">
			<%
			bookDAOImpl dao3 = new bookDAOImpl(DBConnect.getConn());
			List<BookDetails> list3 = dao3.getOldBook();
			for (BookDetails b : list3) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="books/<%=b.getPhoto()%>"
							style="width: 150px; height: 200px" class="img-thumblin">
						<p><%=b.getBookname()%></p>
						<p><%=b.getBookauthor()%></p>
						<p>
							Categories:
							<%=b.getBookcategory()%>
						</p>
						<div class="row text-center">

							<%
							if (u == null) {
							%>
							<a href="login.jsp" class="btn btn-danger btn-sm ml-4"><i
								class="fas fa-cart-plus "></i> Add Cart</a>
							<%
							} else {
							%>
							<a href="cart?bid=<%=b.getBookId()%>&uid=<%=u.getId()%>"
								class="btn btn-danger btn-sm ml-4"> <i
								class="fas fa-cart-plus"></i> Add Cart
							</a>

							<%
							}
							%>
							<a href="viewBooks.jsp?bid=<%=b.getBookId()%>"
								class="btn btn-success btn-sm ml-3"> View Details</a> <a
								href="#" class="btn btn-danger btn-sm ml-3"> <i
								class="fas fa-rupee-sign"></i> <%=b.getPrice()%>
							</a>
						</div>
					</div>
				</div>
			</div>
			<%
			}
			%>


		</div>
		<div class="text-center mt-3 mb-3">
			<a href="all_oldBooks.jsp" class="btn btn-danger btn-sm text-white">View
				All</a>
		</div>

	</div>
	<!-- End Old Books -->

	<%@include file="allComponent/footer.jsp"%>

</body>
</html>