package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.Book_Order;

public class BookOrderDAOImpl implements BookOrderDAO {
	private Connection conn;

	public BookOrderDAOImpl(Connection conn) {
		super();
		this.conn = conn;
	}

	public int getOrderNo() {
		int i = 1;
		String sql = "SELECT * FROM book_order";
		try (PreparedStatement ps = conn.prepareStatement(sql); ResultSet rs = ps.executeQuery()) {
			while (rs.next()) {
				i++;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return i;
	}

	public boolean saveOrder(List<Book_Order> blist) {
		boolean f = false;
		try {

			String sql = "insert into book_order(order_id,user_name,email,address,phone,book_name,author,category,price,payment) values(?,?,?,?,?,?,?,?,?,?)";

			conn.setAutoCommit(false);
			PreparedStatement ps = conn.prepareStatement(sql);

			for (Book_Order b : blist) {
				ps.setString(1, b.getOrderId());
				ps.setString(2, b.getUsername());
				ps.setString(3, b.getEmail());
				ps.setString(4, b.getFulladd());
				ps.setString(5, b.getPhno());
				ps.setString(6, b.getBookName());
				ps.setString(7, b.getAuthor());
				ps.setString(8, b.getCategory());
				ps.setString(9, b.getPrice());
				ps.setString(10, b.getPaymentType());
				ps.addBatch();
			}

			int[] count = ps.executeBatch();
			conn.commit();
			f = true;
			conn.setAutoCommit(true);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	public List<Book_Order> getBook(String email) {
		List<Book_Order> list = new ArrayList<Book_Order>();
		Book_Order o = null;

		try {

			String sql = "select * from book_order where email=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, email);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				o = new Book_Order();
				o.setId(rs.getInt("id")); 
				o.setOrderId(rs.getString("order_id"));
				o.setUsername(rs.getString("user_name"));
				o.setEmail(rs.getString("email"));
				o.setPhno(rs.getString("phone")); 
				o.setBookName(rs.getString("book_name")); 
				o.setAuthor(rs.getString("author"));
				o.setCategory(rs.getString("category"));
				o.setPrice(rs.getString("price")); 
				o.setPaymentType(rs.getString("payment")); 
				list.add(o);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public List<Book_Order> getAllOrder() {
		List<Book_Order> list = new ArrayList<Book_Order>();
		Book_Order o = null;

		try {

			String sql = "select * from book_order";
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				o = new Book_Order();
				o.setId(rs.getInt("id")); 
				o.setOrderId(rs.getString("order_id"));
				o.setUsername(rs.getString("user_name"));
				o.setEmail(rs.getString("email"));
				o.setPhno(rs.getString("phone")); 
				o.setFulladd(rs.getString("address"));
				o.setBookName(rs.getString("book_name")); 
				o.setAuthor(rs.getString("author"));
				o.setCategory(rs.getString("category"));
				o.setPrice(rs.getString("price")); 
				o.setPaymentType(rs.getString("payment")); 
				list.add(o);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
}
