package com.user.servlet;

import com.DAO.bookDAOImpl;
import com.DB.DBConnect;
import com.entity.BookDetails;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

@WebServlet("/AddOldBook")

@MultipartConfig
public class AddOldBook extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String bookname = req.getParameter("bname");
			String bookauthor = req.getParameter("author");
			String price = req.getParameter("price");
			String category = "Old";
			String bookstatus = "Active";
			Part part = req.getPart("bimg");
			String fileName = part.getSubmittedFileName();

			String useremail = req.getParameter("user");

			BookDetails b = new BookDetails(bookname, bookauthor, price, category, bookstatus, fileName, useremail);
			bookDAOImpl dao = new bookDAOImpl(DBConnect.getConn());
			boolean f = dao.addBooks(b);

			HttpSession session = req.getSession();

			if (f) {

				String path = getServletContext().getRealPath("/books");

				File uploadDir = new File(path);
				if (!uploadDir.exists()) {
					uploadDir.mkdir();
				}

				// Save the uploaded file to the books folder
				part.write(path + File.separator + fileName);

				session.setAttribute("succMsg", "Book Added Successfully !!!");
			} else {
				session.setAttribute("failedMsg", "Something went Wrong !!!");
			}
			resp.sendRedirect("sellOldBook.jsp");

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
