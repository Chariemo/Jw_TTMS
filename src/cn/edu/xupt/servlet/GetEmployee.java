package cn.edu.xupt.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.JsonObject;

import cn.edu.xupt.ttms.model.Employee;
import cn.edu.xupt.ttms.service.EmployeeSrv;

/**
 * Servlet implementation class GetEmployee
 */
@WebServlet("/GetEmployee")
public class GetEmployee extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetEmployee() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setCharacterEncoding("UTF-8");
		JsonObject jsobjcet = new JsonObject();
		String no = ((Employee)request.getSession().getAttribute("emp")).getEmp_no();
		Employee info = new EmployeeSrv().findEmployeeByNo(no);
		jsobjcet.addProperty("emp_id", info.getEmp_id());
		jsobjcet.addProperty("emp_no", info.getEmp_no());
		jsobjcet.addProperty("emp_name", info.getEmp_name());
		jsobjcet.addProperty("emp_tel", info.getEmp_tel_num());
		jsobjcet.addProperty("emp_addr", info.getEmp_addr());
		jsobjcet.addProperty("emp_email", info.getEmp_email());
		jsobjcet.addProperty("emp_image", info.getEmp_image());
		PrintWriter out = response.getWriter();
	    out.write(jsobjcet.toString());
	    System.out.println(jsobjcet.toString());
	    out.close();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
