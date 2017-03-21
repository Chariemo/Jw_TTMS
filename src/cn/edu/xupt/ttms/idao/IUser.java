package cn.edu.xupt.ttms.idao;

import java.util.ArrayList;

import cn.edu.xupt.ttms.model.User;

public interface IUser {
	//验证登录信息
	public int check(String id, String pwd);
	public boolean update(User user);
	public boolean insert(User user);
	public boolean delete(String emp_no);
	public User findUserByNo(String emp_no);
	
	public ArrayList<User> findUserByPage(int cPage, String emp_no);
	
}
