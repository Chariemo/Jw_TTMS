package cn.edu.xupt.ttms.service;

import java.util.ArrayList;

import cn.edu.xupt.ttms.idao.DAOFactory;
import cn.edu.xupt.ttms.idao.ISeat;
import cn.edu.xupt.ttms.model.Seat;

public class SeatSrv {
	private ISeat seatDAO = DAOFactory.creatSeatDAO();
	
	public boolean insert(Seat seat) {
		return seatDAO.insert(seat);
	}
	
	public boolean delete(int Studio_id) {
		return seatDAO.delete(Studio_id);
	}
	
	public boolean update(Seat seat) {
		return seatDAO.update(seat);
	}
	
	public Seat findSeatById(int seat_id) {
		return seatDAO.findSeatById(seat_id);
	}
	
	public ArrayList<Seat> findSeatByStudioId(int studio_id) {
		return seatDAO.findSeatByStudio_Id(studio_id);
	}
}
