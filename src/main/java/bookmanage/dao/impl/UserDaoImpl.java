package bookmanage.dao.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Repository;

import bookmanage.dao.UserDao;
import bookmanage.entity.User;


@Repository
public class UserDaoImpl implements UserDao {

	@Autowired
	private HibernateTemplate db;
	
	@Override
	public User checkLgoin(String username, String password) {
		List<User> user = (List<User>) db.find("from User u where u.name=? and u.password = ?",username,password);
		if(user!=null) {
			return user.get(0);
		}else {
			return null;
		}
	}

}
