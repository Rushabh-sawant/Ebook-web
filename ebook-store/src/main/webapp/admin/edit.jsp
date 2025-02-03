<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<%@ page import="com.DB.DBConnect"%>
<%@ page import="java.util.List"%>
<%@ page import="com.entity.BookDetails"%>
<%@ page import="com.DAO.bookDAOImpl"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EBook Store</title>
<%@include file="allCSS.jsp"%>
</head>
<body style="background-color: #f0f2f2;">
    <%@include file="navBar.jsp"%>
    
    <c:if test="${empty userobj }">
	<c:redirect url="../login.jsp"></c:redirect>
	</c:if>
    
    <div class="container mt-5">
        <div class="row">
            <div class="col-md-4 offset-md-4">
                <div class="card">
                    <div class="card-body">
                        <h4 class="text-center">Edit Book</h4>

                        

                        <%
                        int id = Integer.parseInt(request.getParameter("id"));
                        bookDAOImpl dao = new bookDAOImpl(DBConnect.getConn());
                        BookDetails b = dao.getBookById(id);
                        %>

                        <form action="../editBook" method="post">
                        <input type="hidden" name="id" value="<%= b.getBookId()%>">
                        
                            <div class="form-group">
                                <label for="exampleInputEmail1">Book Name*</label>
                                <input name="bname" type="text" class="form-control" id="exampleInputEmail1"
                                    aria-describedby="emailHelp" value="<%=b.getBookname()%>">
                            </div>
                            <div class="form-group">
                                <label for="exampleInputEmail1">Author Name*</label>
                                <input name="author" type="text" class="form-control" id="exampleInputEmail1"
                                    aria-describedby="emailHelp" value="<%=b.getBookauthor()%>">
                            </div>
                            <div class="form-group">
                                <label for="exampleInputEmail1">Price*</label>
                                <input name="price" type="number" class="form-control" id="exampleInputEmail1"
                                    value="<%=b.getPrice()%>">
                            </div>

                            <div class="form-group">
                                <label for="inputState">Book Status</label>
                                <select id="inputState" name="status" class="form-control">
                                    <option value="Active" <%= "Active".equals(b.getStatus()) ? "selected" : "" %>>Active</option>
                                    <option value="Inactive" <%= "Inactive".equals(b.getStatus()) ? "selected" : "" %>>Inactive</option>
                                </select>
                            </div>

                            <button type="submit" class="btn btn-primary">Update</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div style="margin-top: 120px">
        <%@include file="footer.jsp"%>
    </div>
</body>
</html>
