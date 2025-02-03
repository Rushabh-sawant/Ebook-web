package com.admin.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.bookDAOImpl;
import com.DB.DBConnect;
import com.entity.BookDetails;

/**
 * Servlet implementation class editBook
 */
@WebServlet("/editBook")
public class editBook extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		try {
			int id = Integer.parseInt(request.getParameter("id"));
			String bookname = request.getParameter("bname");
			String bookauthor = request.getParameter("author");
			String price = request.getParameter("price");
			String bookstatus = request.getParameter("status");

			BookDetails b = new BookDetails();
			b.setBookId(id);
			b.setBookname(bookname);
			b.setBookauthor(bookauthor);
			b.setPrice(price);
			b.setStatus(bookstatus);

			bookDAOImpl dao = new bookDAOImpl(DBConnect.getConn());
			boolean f = dao.updateEditBook(b);

			HttpSession session = request.getSession();

			if (f) {
				session.setAttribute("succMsg", "Book Updated Successfully !!!");
				response.sendRedirect("admin/allBooks.jsp");
			} else {
				session.setAttribute("failedMsg", "Something went Wrong !!!");
				response.sendRedirect("admin/allBooks.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
