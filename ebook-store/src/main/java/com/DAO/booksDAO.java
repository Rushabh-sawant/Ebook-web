package com.DAO;

import java.util.List;

import com.entity.BookDetails;

public interface booksDAO {

	public boolean addBooks(BookDetails b);

	public List<BookDetails> getAllBooks();

	public BookDetails getBookById(int id);

	public boolean updateEditBook(BookDetails b);

	public boolean daleteBooks(int id);

	public List<BookDetails> getNewBook();

	public List<BookDetails> getRecentBooks();

	public List<BookDetails> getOldBook();

	public List<BookDetails> getAllRecentBooks();

	public List<BookDetails> getAllNewBooks();

	public List<BookDetails> getAllOldBooks();
	
	public List<BookDetails> getBookBySearch(String ch);

}
