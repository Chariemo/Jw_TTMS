package cn.edu.xupt.ttms.service;

import java.util.ArrayList;

import cn.edu.xupt.ttms.dao.StudioDAO;
import cn.edu.xupt.ttms.idao.DAOFactory;
import cn.edu.xupt.ttms.idao.IEmployee;
import cn.edu.xupt.ttms.idao.IStudio;
import cn.edu.xupt.ttms.model.Employee;
import cn.edu.xupt.ttms.model.Studio;

public class StudioSrv {

	private IStudio studioDAO = DAOFactory.creatStudioDAO();
	
	 // 增
   public boolean insert(Studio studio){
   	return studioDAO.insert(studio);
   }

   // 删
   public boolean delete(int studioId){
   	return studioDAO.delete(studioId);
   }

   // 改
   public boolean update(Studio studio) {
   	return studioDAO.update(studio);
   }


   // 根据用户id查(一般用于数据内部关联操作)
   public Studio findStudioById(int studioId) {
   	return studioDAO.findStudioById(studioId);
   }
   
   public ArrayList<Studio> findAllStudio() {
	   return studioDAO.findAllStudio();
   }
   
   public ArrayList<Studio> findStudioByPage(int cPage, String studio_name) {
   		return studioDAO.findStudioByPage(cPage, studio_name);
   }
}
