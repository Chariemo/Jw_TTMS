package cn.edu.xupt.ttms.service;

import java.util.ArrayList;

import cn.edu.xupt.ttms.idao.DAOFactory;
import cn.edu.xupt.ttms.idao.IEmployee;
import cn.edu.xupt.ttms.model.Employee;

public class EmployeeSrv {
		
	private IEmployee employeeDAO = DAOFactory.creatEmployeeDAO();
	
	 // 增
    public boolean insert(Employee employee){
    	return employeeDAO.insert(employee);
    }

    // 删
    public boolean delete(int employeeId){
    	return employeeDAO.delete(employeeId);
    }

    // 改
    public boolean update(Employee employee) {
    	return employeeDAO.update(employee);
    }

    // 查所有用户(一般用于和界面交互)
    public ArrayList<Employee> findEmployeeAll() {
    	return employeeDAO.findEmployeeAll();
    }

    // 根据用户名查(一般用于和界面交互)
    public ArrayList<Employee> findEmployeeByName(String employeeName) {
    	return employeeDAO.findEmployeeByName(employeeName);
    }
    
    public Employee findEmployeeByNo(String no) {
    	return employeeDAO.findEmployeeByNo(no);
    }

    // 根据用户id查(一般用于数据内部关联操作)
    public Employee findEmployeeById(int employeeId) {
    	return employeeDAO.findEmployeeById(employeeId);
    }
    
    
    public ArrayList<Employee> findEmployeeByPage(int cPage, String emp_name) {
    	return employeeDAO.findEmployeeByPage(cPage, emp_name);
    }
}
