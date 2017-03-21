package cn.edu.xupt.ttms.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import cn.edu.xupt.db.ConnectionManager;
import cn.edu.xupt.ttms.idao.ISeat;
import cn.edu.xupt.ttms.model.Seat;

public class SeatDAO implements ISeat{
	@SuppressWarnings("finally")
	public boolean insert(Seat seat) {
		boolean result = false;
		if (seat == null) {
			return result;
		}
		
		java.sql.Connection con = ConnectionManager.getInstance().getConnection();
		PreparedStatement pstmt = null;
		try {
			String sql = "insert into seat(studio_id, seat_row, seat_column, seat_status)"
					+ " value(?, ?, ?, ?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, seat.getStudio_id());
			pstmt.setInt(2, seat.getSeat_row());
			pstmt.setInt(3, seat.getSeat_column());
			pstmt.setInt(4, seat.getSeat_status());
			
			pstmt.executeUpdate();
			result = true;
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			ConnectionManager.close(null, pstmt, con);
			return result;
		}
		
	}
	
	@SuppressWarnings("finally")
	public boolean delete(int studio_id) {
		boolean result = false;
		
		if (studio_id == 0) {
			return result;
		}
		
		Connection con = ConnectionManager.getInstance().getConnection();
		PreparedStatement pstmts = null;
		
		try {
			String sql = "delete from seat where studio_id = ?";
			pstmts = con.prepareStatement(sql);
			pstmts.setInt(1, studio_id);
			
			pstmts.executeUpdate();
			result = true;
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		finally {
			ConnectionManager.close(null, pstmts, con);
			return result;
			
		}
	}
	
	@SuppressWarnings("finally")
	public boolean update(Seat seat) {
		boolean result = false;
		if (seat == null) {
			return result;
		}
		
		Connection con = ConnectionManager.getInstance().getConnection();
		PreparedStatement pstmts = null;
		
		try {
			String sql = "update seat set studio_id = ?, seat_row = ?, seat_column = ?, seat_status = ? "
					+ " where seat_id = ?";
			pstmts = con.prepareStatement(sql);
			
			pstmts.setInt(1, seat.getStudio_id());
			pstmts.setInt(2, seat.getSeat_row());
			pstmts.setInt(3, seat.getSeat_column());
			pstmts.setInt(4, seat.getSeat_status());
			pstmts.setInt(5, seat.getSeat_id());
			
			pstmts.executeUpdate();
			result = true;
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		finally {
			ConnectionManager.close(null, pstmts, con);
			return result;
		}
	}
	
	@SuppressWarnings("finally")
	public Seat findSeatById(int seat_id) {
		Seat seat = null;
		if (seat_id == 0) {
			return seat;
		}
		
		Connection con = ConnectionManager.getInstance().getConnection();
		PreparedStatement pstmts = null;
		ResultSet rst = null;
 		
		try {
			String sql = "select * from seat where seat_id = ?";
			pstmts = con.prepareStatement(sql);
			pstmts.setInt(1, seat_id);

			rst = pstmts.executeQuery();
			
			if (rst.next()) {
				seat = new Seat();
				seat.setSeat_id(rst.getInt("seat_id"));
				seat.setStudio_id(rst.getInt("studio_id"));
				seat.setSeat_row(rst.getInt("seat_row"));
				seat.setSeat_column(rst.getInt("seat_column"));
				seat.setSeat_status(rst.getInt("seat_status"));
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		finally {
			ConnectionManager.close(rst, pstmts, con);
			return seat;
		}
	}
	
	@SuppressWarnings("finally")
	public ArrayList<Seat> findSeatByStudio_Id(int studio_id) {
		if (studio_id == 0) {
			return null;
		}
		
		ArrayList<Seat> list = new ArrayList<Seat>();
		Seat seat = null;
		
		Connection con = ConnectionManager.getInstance().getConnection();
		PreparedStatement pstmts = null;
		ResultSet rst = null;
		
		try {
			String sql = "select * from seat where studio_id = ?";
			pstmts = con.prepareStatement(sql);
			pstmts.setInt(1, studio_id);
			
			rst = pstmts.executeQuery();
			
			while (rst.next()) {
				seat = new Seat();
				seat.setSeat_id(rst.getInt("seat_id"));
				seat.setStudio_id(rst.getInt("studio_id"));
				seat.setSeat_row(rst.getInt("seat_row"));
				seat.setSeat_column(rst.getInt("seat_column"));
				seat.setSeat_status(rst.getInt("seat_status"));
				list.add(seat);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		finally {
			ConnectionManager.close(rst, pstmts, con);
			return list;
		}
	}
}
