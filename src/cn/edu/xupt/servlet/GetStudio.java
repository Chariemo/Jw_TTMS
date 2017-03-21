package cn.edu.xupt.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.JsonObject;

import cn.edu.xupt.ttms.model.Studio;
import cn.edu.xupt.ttms.service.StudioSrv;

/**
 * Servlet implementation class GetStudio
 */
@WebServlet("/GetStudio")
public class GetStudio extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetStudio() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
        JsonObject jsobjcet = new JsonObject();
        String studio_id = request.getParameter("studio_id");
        if (!studio_id.equals("")) {
        	 Studio studio = new StudioSrv().findStudioById(Integer.parseInt(studio_id));
             jsobjcet.addProperty("row_count", studio.getRow_count());
             jsobjcet.addProperty("col_count", studio.getCol_count());
        }
        PrintWriter out = response.getWriter();
        out.write(jsobjcet.toString());
        
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
