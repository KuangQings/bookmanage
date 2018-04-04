package bookmanage.dao.impl;

import java.sql.SQLException;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Projection;
import org.hibernate.criterion.Projections;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Repository;

import bookmanage.dao.BookDao;
import bookmanage.entity.Book;


@Repository
public class BookDaoImpl implements  BookDao{
	
	@Autowired
	private HibernateTemplate db;

	@Override
	public void add(Book book) {
		db.save(book);
	}

	@Override
	public void update(Book book) {
		db.update(book);
	}

	@Override
	public void delete(int id) {
		db.delete(db.get(Book.class, id));
	}

	@Override
	public List<Book> fetchAll(int pageNum, int pageSize) {
		return db.execute(new HibernateCallback<List<Book>>() {
			public List<Book> doInHibernate(Session session) throws HibernateException, SQLException {
				Criteria cri = session.createCriteria(Book.class);
				cri.addOrder(Order.desc("id")) ;
				return cri.setFirstResult((pageNum-1)*pageSize).setMaxResults(pageSize).list();
			}
		});
	}

	@Override
	public int BookRows() {
		return db.execute(new HibernateCallback<Integer>() {
			public Integer doInHibernate(Session session) throws HibernateException, SQLException {
				Criteria cri = session.createCriteria(Book.class);
				Projection proj = Projections.count("id");
				cri.setProjection(proj);
				Number num = (Number) cri.uniqueResult();
				return num.intValue();
			}
		});
	}

	@Override
	public Book fetchById(int id) {
		return db.get(Book.class, id);
	}

	
	public static void main(String[] args) {
		ApplicationContext ctx = new ClassPathXmlApplicationContext("spring-beans.xml");
		BookDao b = ctx.getBean(BookDao.class);
		System.out.println(b.fetchById(1).getName());
	}
}
