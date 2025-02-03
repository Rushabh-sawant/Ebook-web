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

@WebServlet("/delete")

public class deleteBook extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		try {

			int id = Integer.parseInt(req.getParameter("id"));

			bookDAOImpl dao = new bookDAOImpl(DBConnect.getConn());
			boolean f = dao.daleteBooks(id);

			HttpSession session = req.getSession();

			if (f) {
				session.setAttribute("succMsg", "Book Deleted Successfully !!!");
				resp.sendRedirect("admin/allBooks.jsp");
			} else {
				session.setAttribute("failedMsg", "Something went Wrong !!!");
				resp.sendRedirect("admin/allBooks.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
