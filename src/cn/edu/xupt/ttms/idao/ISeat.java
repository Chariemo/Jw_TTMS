package cn.edu.xupt.ttms.idao;

import java.util.ArrayList;

import cn.edu.xupt.ttms.model.Seat;

public interface ISeat {
	//增
	public boolean insert(Seat seat);
	
	//删
	public boolean delete(int studio_id);
	
	//改
	public boolean update(Seat seat);
	
	//按id查找
	public Seat findSeatById(int seat_id);
	
	//按演出厅id查找
	public ArrayList<Seat> findSeatByStudio_Id(int studio_id);
}
