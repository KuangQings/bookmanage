package bookmanage.web.action;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.opensymphony.xwork2.ActionSupport;

import bookmanage.dao.UserDao;
import bookmanage.entity.User;


@Component
@Scope("prototype")
public class UserAction extends ActionSupport{



	@Autowired
	private UserDao userdao;
	
	private User user;
	private String message;
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public String getMessage() {
		return message;
	}
	
	public String checkLogin() {
		User loginUser = userdao.checkLgoin(user.getName(), user.getPassword());
		if(loginUser!=null) {		
			 return SUCCESS;
		}else {
			this.message="用户或密码错误";
			return INPUT;
		}
	}
}
