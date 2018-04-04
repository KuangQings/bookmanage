package bookmanage.dao;

import bookmanage.entity.User;

public interface UserDao {
	User checkLgoin(String username,String password);
}
