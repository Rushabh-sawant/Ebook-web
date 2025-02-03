package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.UserDAO;
import com.DAO.UserDAOImpl;
import com.DB.DBConnect;
import com.entity.User;
import com.user.servlet.hashing.HashCode;

@WebServlet("/update_profile")
public class UpdateProfileServlet extends HttpServlet {

	@Override

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int id = Integer.parseInt(req.getParameter("id"));
			String name = req.getParameter("name");
			String email = req.getParameter("email");
			String phone_no = req.getParameter("phno");

			System.out.println("Received Values:");
			System.out.println("ID: " + id);
			System.out.println("Name: " + name);
			System.out.println("Email: " + email);
			System.out.println("Phone: " + phone_no);

			User us = new User();
			us.setId(id);
			us.setName(name);
			us.setEmail(email);
			us.setPhno(phone_no);

			HttpSession session = req.getSession();
			UserDAO dao = new UserDAOImpl(DBConnect.getConn());

			boolean f2 = dao.updateProfile(us);
			if (f2) {
				session.setAttribute("succMsg", "Profile Updated Successfully");
				resp.sendRedirect("setting.jsp");
			} else {
				session.setAttribute("failedMsg", "Something went wrong on the server");
				resp.sendRedirect("editProfile.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}