package cn.edu.xupt.ttms.service;

import java.util.ArrayList;

import cn.edu.xupt.ttms.idao.DAOFactory;
import cn.edu.xupt.ttms.idao.IUser;
import cn.edu.xupt.ttms.model.User;

public class UserSrv {
	private IUser userDAO = DAOFactory.creatUserDAO();
	public int check(String id, String pwd) {
		return userDAO.check(id, pwd);
	}
	
	public boolean update(User user) {

		if (user.getPwd().equals("")) {
			
			user.setPwd(findUserByNo(user.getNo()).getPwd());
		}
		return userDAO.update(user);
	}
	
	public boolean insert(User user) {
		if (user.getPwd().equals("")) {
			user.setPwd("123456");
		}
		return userDAO.insert(user);
	}
	
	public boolean delete(String emp_no) {
		return userDAO.delete(emp_no);
	}
	public User findUserByNo(String emp_no) {
		return userDAO.findUserByNo(emp_no);
	}
	
	public ArrayList<User> findUserByPage(int cPage, String emp_no) {
		return userDAO.findUserByPage(cPage, emp_no);
	}
}
