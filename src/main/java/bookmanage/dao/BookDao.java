package bookmanage.dao;

import java.util.List;

import bookmanage.entity.Book;


public interface BookDao {
	void add(Book book);
	void update(Book book);
	void delete(int id);
	Book fetchById(int id);
	List<Book> fetchAll(int pageNum,int pageSize);
	int BookRows();
}
