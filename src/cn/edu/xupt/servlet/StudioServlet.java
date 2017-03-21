package cn.edu.xupt.servlet;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oracle.jrockit.jfr.RequestableEvent;
import com.sun.glass.events.SwipeGesture;

import cn.edu.xupt.ttms.dao.StudioDAO;
import cn.edu.xupt.ttms.idao.DAOFactory;
import cn.edu.xupt.ttms.model.Seat;
import cn.edu.xupt.ttms.model.Studio;
import cn.edu.xupt.ttms.service.SeatSrv;
import cn.edu.xupt.ttms.service.StudioSrv;

/**
 * Servlet implementation class StudioServlet
 */
@WebServlet("/StudioServlet")
public class StudioServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StudioServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
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
	
	 private void add(HttpServletRequest request, HttpServletResponse response)
	    {
	       
	        String studio_name = request.getParameter("studio_name");
	        int studio_row_count = Integer.parseInt((String)request.getParameter("studio_row_count"));
	        int studio_col_count = Integer.parseInt((String)request.getParameter("studio_col_count"));
	        int studio_flag = Integer.parseInt((String)request.getParameter("studio_flag"));
	        String studio_introduction = request.getParameter("studio_introduction");
	        
	        Studio studio = new Studio();
	        studio.setStudio_name(studio_name);
	        studio.setRow_count(studio_row_count);
	        studio.setCol_count(studio_col_count);
	        studio.setStudio_flag(studio_flag);
	        studio.setStudio_introduction(studio_introduction);
	        
	       
	        if (new StudioSrv().insert(studio)) {
	        	request.setAttribute("result", "添加成功!");
	        }
	        else {
	        	request.setAttribute("result", "添加失败!");
	        }
	        
	        
	     
	        try
	        {
	            
	            request.getRequestDispatcher("files/admin/addstudio.jsp").forward(request, response);
	        }
	        catch (Exception e)
	        {
	            e.printStackTrace();
	        }
	    }

	    private void delete(HttpServletRequest request, HttpServletResponse response) {
	    	String[] delid = request.getParameterValues("delid");
	    	StudioSrv stuSrv = new StudioSrv();
	    	SeatSrv seatSrv = new SeatSrv();
	    	if (delid != null) {
	    		for (int i = 0; i < delid.length; i++) {
		    		if (seatSrv.delete(Integer.parseInt(delid[i])) && stuSrv.delete(Integer.parseInt(delid[i]))) {
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

	    private void update(HttpServletRequest request, HttpServletResponse response)
	    {
	    	int studio_id = Integer.parseInt(request.getParameter("studio_id"));
	    	String studio_name = request.getParameter("studio_name");
	        int studio_row_count = Integer.parseInt((String)request.getParameter("studio_row_count"));
	        int studio_col_count = Integer.parseInt((String)request.getParameter("studio_col_count"));
	        int studio_flag = Integer.parseInt((String)request.getParameter("studio_flag"));
	        String studio_introduction = request.getParameter("studio_introduction");
	        
	        SeatSrv seatSrv = new SeatSrv();
	        Seat seat = null;
	       
	        Studio studio = new Studio();
	        studio.setStudio_id(studio_id);
	        studio.setStudio_name(studio_name);
	        studio.setRow_count(studio_row_count);
	        studio.setCol_count(studio_col_count);
	        studio.setStudio_flag(studio_flag);
	        studio.setStudio_introduction(studio_introduction);
	        
	        if (new StudioSrv().update(studio)) {
	        	 if (studio_flag != 1) {
	 	        	seatSrv.delete(studio_id);
	 	        }
	 	        else {
	 	        	for (int row = 1; row <= studio_row_count; row++) {
	 	        		for (int col = 1; col <= studio_col_count; col++) {
	 	        			seat = new Seat();
	 	        			seat.setSeat_status(1);
	 	        			seat.setStudio_id(studio_id);
	 	        			seat.setSeat_row(row);
	 	        			seat.setSeat_column(col);
	 	        			seatSrv.insert(seat);
	 	        		}
	 	        	}
	 	        }
	        	request.setAttribute("result", "修改成功!");
	        	request.setAttribute("studio", new StudioSrv().findStudioById(studio_id));
	        }
	        else {
	        	request.setAttribute("result", "修改失败!");
	        }
	        
	        
	     
	        try
	        {
	            
	            request.getRequestDispatcher("files/admin/editstudio.jsp").forward(request, response);
	        }
	        catch (Exception e)
	        {
	            e.printStackTrace();
	        }
	
	    }

	    protected static void search(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException
	    {
	    	
	    	request.setCharacterEncoding("UTF-8");
	        response.setContentType("text/xml;charset=UTF-8");
	        /*StringBuffer sb = new StringBuffer("<tag>");*/
	        ArrayList<Studio> liststu = new StudioSrv().findAllStudio();
	    	request.setAttribute("liststu", liststu);
	    	String from = request.getParameter("from");
	    	
	    	try {
	    		if (from.equals("addseat")) {
	    			request.getRequestDispatcher("files/admin/addseat.jsp").forward(request, response);
	    		}
	    		else {
	    			request.getRequestDispatcher("files/admin/editseat.jsp").forward(request, response);
	    		}
			} catch (ServletException e) {
				// TODO 自动生成的 catch 块
				e.printStackTrace();
			} catch (IOException e) {
				// TODO 自动生成的 catch 块
				e.printStackTrace();
			}
	       
	    }

	    private void searchById(HttpServletRequest request, HttpServletResponse response)
	    {
	    	int studio_id = Integer.parseInt(request.getParameter("studio_id"));
	    	if (studio_id > 0) {
	    		Studio studio = new StudioSrv().findStudioById(studio_id);
	    		request.setAttribute("studio", studio);
	    		try {
	    			request.getRequestDispatcher("files/admin/editstudio.jsp").forward(request, response);
	    		}
	    		catch (Exception e) {
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
	        String studio_name = request.getParameter("studio_name");
	        
	        StudioDAO dao = (StudioDAO) DAOFactory.creatStudioDAO();
	        // 从UserDAO中获取所有演出厅信息
	        ArrayList<Studio> list = dao.findStudioByPage(currentPage, studio_name);
	        // 从UserDAO中获取总记录数
	        int allCount = dao.getAllCount();
	        // 从UserDAO中获取总页数
	        int allPageCount = dao.getAllPageCount();
	        // 从UserDAO中获取当前页
	        currentPage = dao.getCurrentPage();

	        // 存入request中
	        request.setAttribute("allStudio", list);
	        request.setAttribute("allCount", allCount);
	        request.setAttribute("allPageCount", allPageCount);
	        request.setAttribute("currentPage", currentPage);
	        request.setAttribute("search_studio_name", studio_name);

	        try
	        {
	            request.getRequestDispatcher("/files/admin/liststudio.jsp").forward(request, response);
	        }
	        catch (Exception e)
	        {
	            e.printStackTrace();
	        }
	    }

}
