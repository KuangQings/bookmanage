package bookmanage.web.action;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.opensymphony.xwork2.ActionSupport;

import bookmanage.dao.BookDao;
import bookmanage.entity.Book;



@Component
@Scope("prototype")
public class BookAction extends ActionSupport {
	private Book book;
	private List<Book> books;
	private int rows;
	private int totalPages;
	private int id;
	private int pageSize;
	private int pageNum;

	public List<Book> getBooks() {
		return books;
	}

	public void setBooks(List<Book> books) {
		this.books = books;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getRows() {
		return rows;
	}

	public void setRows(int rows) {
		this.rows = rows;
	}

	public int getTotalPages() {
		return totalPages;
	}

	public void setTotalPages(int totalPages) {
		this.totalPages = totalPages;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getPageNum() {
		return pageNum;
	}

	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}

	public Book getBook() {
		return book;
	}

	public void setBook(Book book) {
		this.book = book;
	}

	@Autowired
	private BookDao bookdao;

	public String index() {
		if (pageNum == 0)
			pageNum = 1;
		if (pageSize == 0)
			pageSize = 5;
		books = bookdao.fetchAll(pageNum, pageSize);
		rows = bookdao.BookRows();
		totalPages = rows % pageSize == 0 ? rows / pageSize : rows / pageSize + 1;
		return SUCCESS;
	}

	public String fetchById() {
		book = bookdao.fetchById(id);
		return SUCCESS;
	}

	public String alter() {
		if (book.getId()== 0) {
			bookdao.add(book);
		} else {
			bookdao.update(book);
		}
		return SUCCESS;
	}

	public String delete() {
		bookdao.delete(id);
		return SUCCESS;
	}

}
