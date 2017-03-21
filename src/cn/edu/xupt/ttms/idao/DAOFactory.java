package cn.edu.xupt.ttms.idao;

import cn.edu.xupt.ttms.dao.EmployeeDAO;
import cn.edu.xupt.ttms.dao.SeatDAO;
import cn.edu.xupt.ttms.dao.StudioDAO;
import cn.edu.xupt.ttms.dao.UserDAO;

public class DAOFactory
{
    public static IEmployee creatEmployeeDAO()
    {
        return new EmployeeDAO();
    }
    
    public static IUser creatUserDAO() {
    	return new UserDAO();
    }
    
    public static IStudio creatStudioDAO() {
    	return new StudioDAO();
    }
    
    public static ISeat creatSeatDAO() {
    	return new SeatDAO();
    }
}
