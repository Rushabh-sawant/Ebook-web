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
<style>
.crd-ho:hover {
	background-color: #fcf7f7;
}
</style>

</head>
<body>
	<%@include file="allComponent/navBar.jsp"%>

	<%
	User u = (User) session.getAttribute("userobj");
	%>

	<div class="container-fluid mt-2">
		<div class="row mt-2">

			<%
			String ch=request.getParameter("ch");
			bookDAOImpl dao2 = new bookDAOImpl(DBConnect.getConn());
			List<BookDetails> list2 = dao2.getBookBySearch(ch);
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
	</div>

</body>
</html>