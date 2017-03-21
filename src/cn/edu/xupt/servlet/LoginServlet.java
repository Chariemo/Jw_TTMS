package cn.edu.xupt.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.websocket.Session;

import cn.edu.xupt.db.ConnectionManager;
import cn.edu.xupt.ttms.idao.IUser;
import cn.edu.xupt.ttms.model.Employee;
import cn.edu.xupt.ttms.service.EmployeeSrv;
import cn.edu.xupt.ttms.service.UserSrv;
import jdk.nashorn.internal.ir.Flags;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		response.setContentType("text/html; charset = UTF-8");
		String emp_no = (String) request.getParameter("emp_no");
		String userpwd = (String) request.getParameter("userpwd");
		
	
		int type = new UserSrv().check(emp_no, userpwd);
		
		if (type == 0 || type == 1) {
			Employee emp = null;
			emp = new EmployeeSrv().findEmployeeByNo(emp_no);
			/*System.out.println(emp.getEmp_no());*/
	/*		request.getSession().setAttribute("name", emp.getEmp_name());
			request.getSession().setAttribute("emp_image", emp.getEmp_image());
			request.getSession().setAttribute("no", emp_no);*/
			request.getSession().setAttribute("emp", emp);
			request.getSession().setAttribute("type", Integer.toString(type));
			request.getRequestDispatcher("/files/common/index.jsp").forward(request,response);
		}
		else {
			request.getSession().setAttribute("tip", "账户或密码错误！");	
			request.getRequestDispatcher("login.jsp").forward(request,response); 
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
