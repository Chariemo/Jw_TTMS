package cn.edu.xupt.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sound.midi.MidiDevice.Info;

import org.apache.coyote.http11.filters.VoidInputFilter;

import com.google.gson.JsonObject;
import com.sun.xml.internal.bind.v2.schemagen.xmlschema.List;

import cn.edu.xupt.ttms.model.Seat;
import cn.edu.xupt.ttms.model.Studio;
import cn.edu.xupt.ttms.service.SeatSrv;
import cn.edu.xupt.ttms.service.StudioSrv;
import jdk.nashorn.internal.scripts.JO;

/**
 * Servlet implementation class SeatServlet
 */
@WebServlet("/SeatServlet")
public class SeatServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SeatServlet() {
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
            /*
        else if (method.equalsIgnoreCase("searchById"))
            searchById(request, response);
        else if (method.equalsIgnoreCase("searchByPage"))
            searchByPage(request, response);*/
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
	private void add(HttpServletRequest request, HttpServletResponse response) {
		String [] seatlist = request.getParameterValues("seat");
		String studio_id = request.getParameter("studio");
		SeatSrv seatSrv = new SeatSrv();
		Seat seat = null;
		if (seatlist != null) {
			for (String info: seatlist) {
				String [] temp = info.split(",");
				seat = new Seat();
				seat.setStudio_id(Integer.parseInt(studio_id));
				seat.setSeat_row(Integer.parseInt(temp[0]));
				seat.setSeat_column(Integer.parseInt(temp[1]));
				seat.setSeat_status(1);
				seatSrv.insert(seat);
			}
			StudioSrv studioSrv = new StudioSrv();
			Studio studio = studioSrv.findStudioById(Integer.parseInt(studio_id));
			studio.setStudio_flag(1);
			studioSrv.update(studio);
			request.setAttribute("result", "添加成功!");
		}
		else {
			request.setAttribute("result", "请选择要生成的座位");
		}
		
		
		 try
	        {
	            StudioServlet.search(request, response);
	            /*request.getRequestDispatcher("files/admin/seatMgr.jsp").forward(request, response);*/
	        }
	        catch (Exception e)
	        {
	            e.printStackTrace();
	        }
		
	}
	
	private void delete(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {
		String studio_id = request.getParameter("studio");
		if (!studio_id.equals("")) {
			if (new SeatSrv().delete(Integer.parseInt(studio_id))){
				StudioSrv stuSrv = new StudioSrv();
				Studio studio = stuSrv.findStudioById(Integer.parseInt(studio_id));
				studio.setStudio_flag(0);
				stuSrv.update(studio);
				request.setAttribute("result", "删除成功!");
			}
			else
                request.setAttribute("result", "删除失败!");
			
		}
		else {
    		request.setAttribute("result", "请选择要删除座位的演出厅！");
    	}
		StudioServlet.search(request, response);
		
	}
	
	private void update(HttpServletRequest request, HttpServletResponse response) {
		String studio_id = request.getParameter("studio");
		String [] seatids = request.getParameterValues("seat");
		SeatSrv seatSrv = new SeatSrv();
		Seat info = null;
		
		boolean flag;
		if (seatids != null) {
			ArrayList<Seat> seatlist = seatSrv.findSeatByStudioId(Integer.parseInt(studio_id));
			for (Seat seat : seatlist) {	
				flag = false;
				for (String seat_id: seatids) {
					if (Integer.parseInt(seat_id) == seat.getSeat_id()) {
						seat.setSeat_status(1);
						flag = true;break;
					}
				}
				if (!flag) {
					seat.setSeat_status(0);
				}
				seatSrv.update(seat);
			}
			request.setAttribute("result", "修改成功!");
		}
		else {
			request.setAttribute("result", "请选择要修改座位的演出厅");
		}
		try
        {
            StudioServlet.search(request, response);
            /*request.getRequestDispatcher("files/admin/seatMgr.jsp").forward(request, response);*/
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
		
	}
	
	private void search(HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.setCharacterEncoding("UTF-8");
        JsonObject jsobjcet = new JsonObject();
        String studio_id = request.getParameter("studio_id");
        
        if (!studio_id.equals("")) {       
        	
        	Studio studio = new StudioSrv().findStudioById(Integer.parseInt(studio_id));
            jsobjcet.addProperty("row_count", studio.getRow_count());
            jsobjcet.addProperty("col_count", studio.getCol_count());
            
            ArrayList<Seat> list = new SeatSrv().findSeatByStudioId(Integer.parseInt(studio_id));
            String seatids = "";
            for (Seat seat : list) {
            	seatids += (seat.getSeat_id() + " " + seat.getSeat_status() + ",");
            }
            
            jsobjcet.addProperty("listids", seatids.toString());
            
        }
        
        PrintWriter out = response.getWriter();
        out.write(jsobjcet.toString());
        
        out.close();
	}

}
