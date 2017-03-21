package cn.edu.xupt.ttms.idao;

import java.util.ArrayList;

import cn.edu.xupt.ttms.model.Employee;

public interface IEmployee
{
    // 增
    public boolean insert(Employee employee);

    // 删
    public boolean delete(int employeeId);

    // 改
    public boolean update(Employee employee);

    // 查所有用户(一般用于和界面交互)
    public ArrayList<Employee> findEmployeeAll();

    // 根据用户名查(一般用于和界面交互)
    public ArrayList<Employee> findEmployeeByName(String employeeName);
    
    public Employee findEmployeeByNo(String no);

    // 根据用户id查(一般用于数据内部关联操作)
    public Employee findEmployeeById(int employeeId);
    
    public ArrayList<Employee> findEmployeeByPage(int cPage, String emp_name);
}
