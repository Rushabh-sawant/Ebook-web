package com.entity;

public class BookDetails {

	public BookDetails() {
		super();
		// TODO Auto-generated constructor stub
	}

	private int bookId;
	private String bookname;
	private String bookauthor;
	private String price;
	private String bookcategory;
	private String status;
	private String photo;
	private String user_email;

	public BookDetails(String bookname, String bookauthor, String price, String bookcategory, String status,
			String photo, String user_email) {
		super();
		this.bookname = bookname;
		this.bookauthor = bookauthor;
		this.price = price;
		this.bookcategory = bookcategory;
		this.status = status;
		this.photo = photo;
		this.user_email = user_email;
	}

	public int getBookId() {
		return bookId;
	}

	public void setBookId(int bookId) {
		this.bookId = bookId;
	}

	public String getBookname() {
		return bookname;
	}

	public void setBookname(String bookname) {
		this.bookname = bookname;
	}

	public String getBookauthor() {
		return bookauthor;
	}

	public void setBookauthor(String bookauthor) {
		this.bookauthor = bookauthor;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getBookcategory() {
		return bookcategory;
	}

	public void setBookcategory(String bookcategory) {
		this.bookcategory = bookcategory;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getPhoto() {
		return photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}

	public String getUser_email() {
		return user_email;
	}

	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}

	@Override
	public String toString() {
		return "BookDetails [bookId=" + bookId + ", bookname=" + bookname + ", bookauthor=" + bookauthor + ", price="
				+ price + ", bookcategory=" + bookcategory + ", status=" + status + ", photo=" + photo + ", user_email="
				+ user_email + "]";
	}

}
