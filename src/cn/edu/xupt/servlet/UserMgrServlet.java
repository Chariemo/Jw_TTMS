package cn.edu.xupt.servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sun.org.apache.xerces.internal.impl.xpath.XPath.Step;

import cn.edu.xupt.ttms.dao.UserDAO;
import cn.edu.xupt.ttms.idao.DAOFactory;
import cn.edu.xupt.ttms.model.User;
import cn.edu.xupt.ttms.service.StudioSrv;
import cn.edu.xupt.ttms.service.UserSrv;

/**
 * Servlet implementation class UserMgrServlet
 */
@WebServlet("/UserMgrServlet")
public class UserMgrServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserMgrServlet() {
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
	        else if (method.equalsIgnoreCase("step"))
	        	step(request,response);
	      /*  else if (method.equalsIgnoreCase("search"))
	            search(request, response);
	        else if (method.equalsIgnoreCase("searchById"))
	            searchById(request, response);*/
	        else if (method.equalsIgnoreCase("searchByNo")) 
	        	searchByNo(request, response);
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
	
	private void step (HttpServletRequest request, HttpServletResponse response) {
		String emp_no = (String)request.getParameter("emp_no");
		if (emp_no != null)
        {
			request.setAttribute("emp_no", emp_no);			
            try
            {
                request.getRequestDispatcher("files/admin/adduser.jsp").forward(request, response);
            }
            catch (Exception e)
            {
                e.printStackTrace();
            }
        }
	}

	private void add(HttpServletRequest request, HttpServletResponse response) {
		String emp_no = (String) request.getParameter("emp_no");
		String emp_pass = (String) request.getParameter("npwd");
		String type = (String) request.getParameter("emp_type");
		User user = new User();
		
		user.setNo(emp_no);
		user.setPwd(emp_pass);
		user.setType(Integer.parseInt(type));
		
		if (new UserSrv().insert(user)) {
			request.setAttribute("result", "添加成功!");
        }
        else {
        	request.setAttribute("result", "添加失败!");
        }
        
        
     
        try
        {
            
            request.getRequestDispatcher("files/admin/adduser.jsp").forward(request, response);
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
	}
	
	private void  delete(HttpServletRequest request, HttpServletResponse response) {
		String[] delid = request.getParameterValues("delid");
    	UserSrv userSrv = new UserSrv();
    	
    	if (delid != null) {
    		for (int i = 0; i < delid.length; i++) {
	    		if (userSrv.delete(delid[i])) {
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
	
	private void  update(HttpServletRequest request, HttpServletResponse response) {
		String emp_no = (String) request.getParameter("emp_no");
		String emp_pass = (String) request.getParameter("npwd");
		String type = (String) request.getParameter("emp_type");
		User user = new User();
		user.setNo(emp_no);
		user.setPwd(emp_pass);
		user.setType(Integer.parseInt(type));
		
		if (new UserSrv().update(user)) {
			request.setAttribute("result", "修改成功!");
        	request.setAttribute("user", new UserSrv().findUserByNo(emp_no));
		}
		else {
        	request.setAttribute("result", "修改失败!");
        }
		
		 try
	        {
	            
	            request.getRequestDispatcher("files/admin/edituser.jsp").forward(request, response);
	        }
	        catch (Exception e)
	        {
	            e.printStackTrace();
	        }
	}
	
	private void searchByNo(HttpServletRequest request, HttpServletResponse response) {
		String emp_no = (String)request.getParameter("emp_no");
	
		if (emp_no != null)
        {
			User user = new UserSrv().findUserByNo(emp_no);
			request.setAttribute("user", user);
			
            try
            {
                request.getRequestDispatcher("files/admin/edituser.jsp").forward(request, response);
            }
            catch (Exception e)
            {
                e.printStackTrace();
            }
        }
	}
	
	private void searchByPage(HttpServletRequest request, HttpServletResponse response) {
		 int currentPage = 1; // 当前页默认为第一页
	        
	        String strpage = request.getParameter("currentPage"); // 获取前台传入当前页
	        if (strpage != null && !strpage.equals(""))
	        {
	            currentPage = Integer.parseInt(strpage) < 1 ? 1 : Integer.parseInt(strpage); // 将字符串转换成整型
	        }
	        String emp_no = request.getParameter("emp_no");
	        
	        UserDAO dao = (UserDAO) DAOFactory.creatUserDAO();
	        // 从UserDAO中获取所有演出厅信息
	        ArrayList<User> list = dao.findUserByPage(currentPage, emp_no);
	        // 从UserDAO中获取总记录数
	        int allCount = dao.getAllCount();
	        // 从UserDAO中获取总页数
	        int allPageCount = dao.getAllPageCount();
	        // 从UserDAO中获取当前页
	        currentPage = dao.getCurrentPage();

	        // 存入request中
	        request.setAttribute("allUser", list);
	        request.setAttribute("allCount", allCount);
	        request.setAttribute("allPageCount", allPageCount);
	        request.setAttribute("currentPage", currentPage);
	        request.setAttribute("search_emp_no", emp_no);
	       
	        try
	        {
	            request.getRequestDispatcher("/files/admin/UserMgr.jsp").forward(request, response);
	        }
	        catch (Exception e)
	        {
	            e.printStackTrace();
	        }
	    
	}
}
