package com.user.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.CartDAOImpl;
import com.DAO.BookOrderDAO;
import com.DAO.BookOrderDAOImpl;
import com.DB.DBConnect;
import com.entity.BookDetails;
import com.entity.Book_Order;
import com.entity.Cart;

@WebServlet("/order")
public class OrderServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			HttpSession session = req.getSession();

			int id = Integer.parseInt(req.getParameter("id"));
			String name = req.getParameter("username");
			String email = req.getParameter("email");
			String phno = req.getParameter("phno");
			String address = req.getParameter("address");
			String landmark = req.getParameter("landmark");
			String city = req.getParameter("city");
			String state = req.getParameter("state");
			String pincode = req.getParameter("pincode");
			String paymentType = req.getParameter("payment");
			String category = req.getParameter("category");

			String fulladd = address + "," + landmark + "," + city + "," + state + "," + pincode;

			//System.out.println(name + " " + email + " " + phno + " " + fulladd + " " + paymentType);

			CartDAOImpl dao = new CartDAOImpl(DBConnect.getConn());

			List<Cart> blist = dao.getBookByUser(id);

			if (blist.isEmpty()) {
				session.setAttribute("failedMsg", "Add item(s) to the cart");
				resp.sendRedirect("checkout.jsp");
			} else {
				BookOrderDAOImpl dao2 = new BookOrderDAOImpl(DBConnect.getConn());
				int i = dao2.getOrderNo();
				Book_Order o = null;
				ArrayList<Book_Order> orderList = new ArrayList<Book_Order>();

				for (Cart c : blist) {
					o = new Book_Order();
					o.setOrderId("BOOK-ORD-00" + i);
					o.setUsername(name);
					o.setEmail(email);
					o.setPhno(phno);
					o.setFulladd(fulladd);
					o.setBookName(c.getBookName());
					o.setAuthor(c.getAuthor());
					o.setCategory(c.getCategory());
					o.setPrice(c.getPrice() + "");
					o.setPaymentType(paymentType);
					orderList.add(o);
					i++;

				}

				if ("noselect".equals(paymentType)) {
					session.setAttribute("failedMsg", "Please choose payment mode");
					resp.sendRedirect("checkout.jsp");

				} else if ("online_payment".equals(paymentType)) {
					boolean f = dao2.saveOrder(orderList);

					if (f) {
						resp.sendRedirect("card_Payment.jsp");
					} else {
						session.setAttribute("failedMsg", "Your order gets failed");
						resp.sendRedirect("checkout.jsp");
					}
				} else {
					boolean f = dao2.saveOrder(orderList);

					if (f) {
						resp.sendRedirect("order_success.jsp");
					} else {
						session.setAttribute("failedMsg", "Your order gets failed");
						resp.sendRedirect("checkout.jsp");
					}
				}

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}