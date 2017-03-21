package cn.edu.xupt.servlet;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.jsp.JspFactory;
import javax.servlet.jsp.PageContext;

import com.jspsmart.upload.SmartUpload;
import com.jspsmart.upload.SmartUploadException;

import cn.edu.xupt.ttms.dao.EmployeeDAO;
import cn.edu.xupt.ttms.idao.DAOFactory;
import cn.edu.xupt.ttms.model.Employee;
import cn.edu.xupt.ttms.model.User;
import cn.edu.xupt.ttms.service.EmployeeSrv;
import cn.edu.xupt.ttms.service.StudioSrv;
import cn.edu.xupt.ttms.service.UserSrv;


/**
 * Servlet implementation class EmployeeServlet
 */
@WebServlet("/EmployeeServlet")
public class EmployeeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EmployeeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 String method = request.getParameter("method");
	        if (method.equalsIgnoreCase("add"))
	            add(request, response);
	        else if (method.equalsIgnoreCase("delete"))
	            delete(request, response);
	        else if (method.equalsIgnoreCase("update"))
	            update(request, response);
	        else if (method.equalsIgnoreCase("search"))
	            search(request, response);
	        else if (method.equalsIgnoreCase("searchById"))
	            searchById(request, response);
	        else if (method.equalsIgnoreCase("searchByPage"))
	            searchByPage(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

	
	 private void add(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException
	 {
		 
		 SmartUpload mySmartUpload = new SmartUpload();
	        // PageContext是jsp的内置对象，在servlet不能直接使用，需要做一些处理
	        JspFactory _jspxFactory = JspFactory.getDefaultFactory();
	        PageContext pageContext = _jspxFactory.getPageContext(this, request, response, "", true, 8192, true);
	        // 初始化
	        mySmartUpload.initialize(pageContext);
	        // 设置上载的最大值,注意:如果这里设置过大会出现问题!
	        mySmartUpload.setMaxFileSize(10 * 1024 * 1024);
	        // 上载文件
	        try
	        {
	            mySmartUpload.upload();
	            //mySmartUpload.save("userimage/"); // TODO:只能原名保存，不能改名
	        }
	        catch (SmartUploadException e)
	        {
	            e.printStackTrace();
	        }

	        // 取得上载的文件
	        com.jspsmart.upload.File myFile = mySmartUpload.getFiles().getFile(0);
	       /* if (!myFile.isMissing())
	        {*/
	            // 取得别的参数
	      
	    
	        	String emp_no = (String) mySmartUpload.getRequest().getParameter("emp_no");
	        	String emp_name = (String) mySmartUpload.getRequest().getParameter("username");
	        	String emp_tel_num = (String) mySmartUpload.getRequest().getParameter("tel");
	        	String emp_addr = (String) mySmartUpload.getRequest().getParameter("addr");
	        	String emp_email = (String) mySmartUpload.getRequest().getParameter("email");
	            // 取得上载的文件的文件名
	            String myFileName = myFile.getFileName();
	            // 取得不带后缀的文件名
	            String suffix = myFileName.substring(0, myFileName.lastIndexOf('.'));
	            // 取得后缀名
	            String ext = myFile.getFileExt();
	            // 取得文件的大小
	            int fileSize = myFile.getSize();
	            // 保存路径
	            String aa = getServletContext().getRealPath("/") + "userimage\\";
	            File aadir = new File(aa);
	            if (!aadir.exists())
	                aadir.mkdirs();
	            String trace = aa + myFileName;
	            System.out.println(trace);
	            // 将文件保存在服务器端(使用全路径)
	            try
	            {
	                myFile.saveAs(trace , mySmartUpload.SAVE_PHYSICAL);
	            }
	            catch (SmartUploadException e)
	            {
	                e.printStackTrace();
	            }

	            // 将上传参数及文件路径存入vo类
	      
	            
	            Employee employee = new Employee();
	           
	            employee.setEmp_no(emp_no);
	            employee.setEmp_name(emp_name);
	            employee.setEmp_tel_num(emp_tel_num);
	            employee.setEmp_addr(emp_addr);
	            employee.setEmp_email(emp_email);
	            employee.setEmp_image("userimage\\" + myFileName);
	            
	            
	            User user = new User();
	    		
	    		user.setNo(emp_no);
	    		user.setPwd("");
	    		user.setType(0);	
		 try
		 {
	            if (new EmployeeSrv().insert(employee) && new UserSrv().insert(user))
	                request.setAttribute("result", "添加成功!");
	            else
	                request.setAttribute("result", "添加失败!");
	            request.getRequestDispatcher("files/admin/register.jsp").forward(request, response);
	        }
	        catch (Exception e)
	        {
	            e.printStackTrace();
	        }
	    }

	    private void delete(HttpServletRequest request, HttpServletResponse response)
	    {
	    	String[] delid = request.getParameterValues("delid");
	    	EmployeeSrv  empSrv = new EmployeeSrv();
	    	UserSrv userSrv = new UserSrv();
	    	if (delid != null) {
	    		for (int i = 0; i < delid.length; i++) {
		    		if (userSrv.delete(new EmployeeSrv().findEmployeeById(Integer.parseInt(delid[i])).getEmp_no()) && empSrv.delete(Integer.parseInt(delid[i]))) {
		    			request.setAttribute("result", "删除成功!");
		    		}
		    		else
		                request.setAttribute("result", "删除失败!");
		    	}
	    	}
	    	else {
	    		request.setAttribute("result", "请选择要删除的演出厅！");
	    	}
	    	searchByPage(request, response);
			 
	    }

	    private void update(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	    {
	    	 SmartUpload mySmartUpload = new SmartUpload();
	         // PageContext是jsp的内置对象，在servlet不能直接使用，需要做一些处理
	         JspFactory _jspxFactory = JspFactory.getDefaultFactory();
	         PageContext pageContext = _jspxFactory.getPageContext(this, request, response, "", true, 8192, true);
	         // 初始化
	         mySmartUpload.initialize(pageContext);
	         // 设置上载的最大值,注意:如果这里设置过大会出现问题!
	         mySmartUpload.setMaxFileSize(10 * 1024 * 1024);
	         // 上载文件
	         try
	         {
	             mySmartUpload.upload();
	             //mySmartUpload.save("userimage/"); // TODO:只能原名保存，不能改名
	         }
	         catch (SmartUploadException e)
	         {
	             e.printStackTrace();
	         }

	         // 取得上载的文件
	         com.jspsmart.upload.File myFile = mySmartUpload.getFiles().getFile(0);
	         
	      // 取得别的参数
	        String emp_id = (String) mySmartUpload.getRequest().getParameter("emp_id");
	     	String emp_no = (String) mySmartUpload.getRequest().getParameter("emp_no");
	     	String emp_name = (String) mySmartUpload.getRequest().getParameter("username");
	     	String emp_tel_num = (String) mySmartUpload.getRequest().getParameter("tel");
	     	String emp_addr = (String) mySmartUpload.getRequest().getParameter("addr");
	     	String emp_email = (String) mySmartUpload.getRequest().getParameter("email");
	     	String emp_image = "";
	        if (!myFile.isMissing())
	        {
	        	// 取得上载的文件的文件名
	        	String myFileName = myFile.getFileName();
	        	// 取得不带后缀的文件名
	        	String suffix = myFileName.substring(0, myFileName.lastIndexOf('.'));
	        	// 取得后缀名
	        	String ext = myFile.getFileExt();
	        	// 取得文件的大小
	        	int fileSize = myFile.getSize();
	        	// 保存路径
	        	String aa = getServletContext().getRealPath("/") + "userimage\\";
	        	File aadir = new File(aa);
	        	if (!aadir.exists())
	        		aadir.mkdirs();
	        	String trace = aa + myFileName;
	        	System.out.println(trace);
	        	// 将文件保存在服务器端(使用全路径)
	        	try
	        	{
	        		myFile.saveAs(trace , mySmartUpload.SAVE_PHYSICAL);
	        		emp_image += ("userimage\\" + myFileName);
	        	}
	        	catch (SmartUploadException e)
	        	{
	        		e.printStackTrace();
	        	}
	        }
	        
	        else {
	        	emp_image = new EmployeeSrv().findEmployeeByNo(emp_no).getEmp_image();
	        }
	        // 将上传参数及文件路径存入vo类
	       
	             
	        Employee employee = new Employee();
	        employee.setEmp_id(Integer.parseInt(emp_id));
	        employee.setEmp_no(emp_no);
	        employee.setEmp_name(emp_name);
	        employee.setEmp_tel_num(emp_tel_num);
	        employee.setEmp_addr(emp_addr);
	        employee.setEmp_email(emp_email);
	        employee.setEmp_image(emp_image);
	       
	        
	        UserSrv userSrv = new UserSrv();
	        User user = userSrv.findUserByNo(emp_no);
	        user.setPwd((String) mySmartUpload.getRequest().getParameter("npwd"));
	        
	        try
	        {
	            if (new EmployeeSrv().update(employee) && userSrv.update(user))
	                request.setAttribute("result", "更新成功!");
	            else
	                request.setAttribute("result", "更新失败!");
	            request.setAttribute("emp", employee);
	            request.getRequestDispatcher("files/admin/editemployee.jsp").forward(request, response);
	        }
	        catch (Exception e)
	        {
	            e.printStackTrace();
	        }
	      
	    }

	    private void search(HttpServletRequest request, HttpServletResponse response)
	    {
	        
	    }

	    private void searchById(HttpServletRequest request, HttpServletResponse response)
	    {
	        int emp_id = Integer.parseInt(request.getParameter("employee_id"));
	        if (emp_id > 0)
	        {
	            EmployeeSrv empSrv = new EmployeeSrv();
	            Employee emp = empSrv.findEmployeeById(emp_id);
	            request.setAttribute("emp", emp);
	            try
	            {
	                request.getRequestDispatcher("files/admin/editemployee.jsp").forward(request, response);
	            }
	            catch (Exception e)
	            {
	                e.printStackTrace();
	            }
	        }
	    }

	    private void searchByPage(HttpServletRequest request, HttpServletResponse response)
	    {
	        int currentPage = 1; // 当前页默认为第一页
	        String strpage = request.getParameter("currentPage"); // 获取前台传入当前页
	        if (strpage != null && !strpage.equals(""))
	        {
	            currentPage = Integer.parseInt(strpage) < 1 ? 1 : Integer.parseInt(strpage); // 将字符串转换成整型
	        }
	        String emp_name = request.getParameter("employee_name");
	        EmployeeDAO dao = (EmployeeDAO) DAOFactory.creatEmployeeDAO();
	        // 从UserDAO中获取所有用户信息
	        ArrayList<Employee> list = dao.findEmployeeByPage(currentPage, emp_name);
	        // 从UserDAO中获取总记录数
	        int allCount = dao.getAllCount();
	        // 从UserDAO中获取总页数
	        int allPageCount = dao.getAllPageCount();
	        // 从UserDAO中获取当前页
	        currentPage = dao.getCurrentPage();

	        // 存入request中
	        request.setAttribute("allEmployee", list);
	        request.setAttribute("allCount", allCount);
	        request.setAttribute("allPageCount", allPageCount);
	        request.setAttribute("currentPage", currentPage);
	        request.setAttribute("search_employee_name", emp_name);

	        try
	        {
	            request.getRequestDispatcher("files/admin/listemployee.jsp").forward(request, response);
	        }
	        catch (Exception e)
	        {
	            e.printStackTrace();
	        }
	    }
}
