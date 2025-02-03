
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>


<div class="container-fluid"
	style="height: 10px; background-color: #303f9f"></div>


<div class="container-fluid p-3 bg-light">
	<div class="row">
		<div class="col-md-3 text-success">
			<h3>
				<i class="fas fa-book"></i> Ebook Store
			</h3>
		</div>
		<div class="col-md-5">
			<form class="form-inline my-2 my-lg-0" action="search.jsp"
				method="post">
				<input class="form-control mr-sm-2" type="search" name="ch"
					placeholder="Search" aria-label="Search">
				<button class="nav-text btn btn-outline-dark my-2 my-sm-0"
					type="submit">Search</button>
			</form>
		</div>

		<c:if test="${not empty userobj}">
			<div class="col-md-4">
				<a href="checkout.jsp" class="btn btn-warning "> <i
					class="fas fa-cart-plus fa-1.5x"></i> View Cart
				</a> <a href="editProfile.jsp" class="btn btn-success"><i
					class="fas fa-user"></i> ${userobj.name}</a> <a href="logout"
					class="btn btn-danger"><i class="fas fa-sign-out-alt"></i>
					Logout</a>
			</div>
		</c:if>

		<c:if test="${empty userobj }">
			<div class="col-md-3">
				<a href="login.jsp" class="btn btn-success"><i
					class="fas fa-sign-in-alt"></i> Login</a> <a href="register.jsp"
					class="btn btn-primary"><i class="fas fa-user-plus"></i>
					Register</a>
			</div>
		</c:if>

	</div>
</div>


<nav class="navbar navbar-expand-lg navbar-dark bg-custom">

	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarSupportedContent"
		aria-controls="navbarSupportedContent" aria-expanded="false"
		aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>

	<div class="collapse navbar-collapse" id="navbarSupportedContent">
		<ul class="navbar-nav mr-auto">
			<li class="nav-item active ml-1"><a class="nav-link"
				href="index.jsp"><i class="fas fa-home"></i> Home <span
					class="sr-only">(current)</span> </a></li>
			<li class="nav-item active ml-1"><a class="nav-link"
				href="all_recentBooks.jsp"><i class="fas fa-book-open"></i>
					Recent Books</a></li>
			<li class="nav-item active ml-1"><a class="nav-link"
				href="all_newBooks.jsp"><i class="fas fa-book-open"></i> New
					Books</a></li>

			<li class="nav-item active ml-1"><a class="nav-link"
				href="all_oldBooks.jsp"><i class="fas fa-book-open"></i> Old
					Books</a></li>
		</ul>
		<form class="form-inline my-2 my-lg-0">
			<a href="setting.jsp" class="btn btn-light my-2 my-sm-0"
				type="submit"> <i class="fas fa-cog"></i> Settings
			</a> <a href="helpline.jsp" class="btn btn-light my-2 my-sm-0 ml-1"
				type="submit"> <i class="fas fa-phone-square-alt"></i>
				Contact-Us
			</a>
		</form>
	</div>
</nav>