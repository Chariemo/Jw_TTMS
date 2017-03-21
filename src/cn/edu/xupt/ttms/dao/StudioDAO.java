package cn.edu.xupt.ttms.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import cn.edu.xupt.db.ConnectionManager;
import cn.edu.xupt.ttms.idao.IStudio;
import cn.edu.xupt.ttms.model.Studio;

public class StudioDAO implements IStudio{
	public static final int PAGE_SIZE = 5; // 每页显示条数
    private int allCount; // 数据库中条数
    private int allPageCount; // 总页数
    private int currentPage; // 当前页

    public int getAllCount()
    {
        return allCount;
    }

    public int getAllPageCount()
    {
        return allPageCount;
    }

    public int getCurrentPage()
    {
        return currentPage;
    }

    @SuppressWarnings("finally")
    public ArrayList<Studio> findStudioByPage(int cPage, String studio_name)
    {
        currentPage = cPage;
        ArrayList<Studio> list = new ArrayList<Studio>();
        
        // 若未指定查找某人，则默认全查
        if (null == studio_name || studio_name.equals("null"))
        {
            studio_name = "";
        }

        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try
        {
            // 获取记录总数
            String sql1 = "select count(studio_id) as AllRecord from studio where studio_name like ?";
            conn = ConnectionManager.getInstance().getConnection();
            pstmt = conn.prepareStatement(sql1);
            pstmt.setString(1, "%" + studio_name + "%");
          
            rs = pstmt.executeQuery();
            if (rs.next())
                allCount = rs.getInt("AllRecord");
            
            rs.close();
            pstmt.close();

            // 记算总页数
            allPageCount = (allCount + PAGE_SIZE - 1) / PAGE_SIZE;
           
            // 如果当前页数大于总页数，则赋值为总页数
            if (allPageCount > 0 && currentPage > allPageCount)
                currentPage = allPageCount;

            // 获取第currentPage页数据
            String sql2 = "select * from studio where studio_name like ? limit ?,?";
            pstmt = conn.prepareStatement(sql2);
            pstmt.setString(1, "%" + studio_name + "%");
            pstmt.setInt(2, PAGE_SIZE * (currentPage - 1));
            pstmt.setInt(3, PAGE_SIZE);
           
            rs = pstmt.executeQuery();
            Studio info = null;
            while (rs.next())
            {
                info = new Studio();
                info.setStudio_id(rs.getInt("studio_id"));
                info.setStudio_name(rs.getString("studio_name"));
                info.setCol_count(rs.getInt("studio_col_count"));
                info.setRow_count(rs.getInt("studio_row_count"));
                info.setStudio_introduction(rs.getString("studio_introduction"));
                info.setStudio_flag(rs.getInt("studio_flag"));
            
                list.add(info);
            }
        }
        catch (SQLException e)
        {
            e.printStackTrace();
        }
        finally
        {
            ConnectionManager.close(rs, pstmt, conn);
            return list;
        }
    }
    
    
    /**
     * 存储演出厅信息
     * @return 成功与否boolean
     */
    @SuppressWarnings("finally")
    public boolean insert(Studio studio)
    {
        boolean result = false;
        if(studio == null)
            return result;

        // 获取Connection
        Connection con = ConnectionManager.getInstance().getConnection();
        PreparedStatement pstmt = null;
        try
        {
            String sql = "insert into studio(studio_name, studio_row_count, studio_col_count, studio_introduction, studio_flag) values(?,?,?,?,?)";
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, studio.getStudio_name());
            pstmt.setInt(2, studio.getRow_count());
            pstmt.setInt(3, studio.getCol_count());
            pstmt.setString(4, studio.getStudio_introduction());
            pstmt.setInt(5, studio.getStudio_flag());

            pstmt.executeUpdate();
            result = true;
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        finally
        {
            // 关闭连接
            ConnectionManager.close(null, pstmt, con);
            return result;
        }
    }

    /**
     * 删除用户(通过studioId)
     * @return 成功与否boolean
     */
    @SuppressWarnings("finally")
    public boolean delete(int studio_id)
    {
        boolean result = false;
        if(studio_id == 0)
            return result;

        Connection con = ConnectionManager.getInstance().getConnection();
        PreparedStatement pstmt = null;
        try
        {
       
            String sql = "delete from studio where studio_id=?";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, studio_id);
            pstmt.executeUpdate();
            ConnectionManager.close(null, pstmt, con);

            result = true;
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        finally
        {
            // 关闭连接
            ConnectionManager.close(null, pstmt, con);
            return result;
        }
    }

    /**
     * 修改演出厅信息
     * @return 成功与否boolean
     */
    @SuppressWarnings("finally")
    public boolean update(Studio studio)
    {
        boolean result = false;
        if(studio == null)
            return result;

        Connection con = ConnectionManager.getInstance().getConnection();
        PreparedStatement pstmt = null;
        try
        {
            String sql = "update studio set studio_name = ?, studio_row_count = ?, studio_col_count = ?"
            		+ ", studio_introduction = ?, studio_flag = ? where studio_id=?";
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, studio.getStudio_name());
            pstmt.setInt(2, studio.getRow_count());
            pstmt.setInt(3, studio.getCol_count());
            pstmt.setString(4, studio.getStudio_introduction());
            pstmt.setInt(5, studio.getStudio_flag());
            pstmt.setInt(6, studio.getStudio_id());

            pstmt.executeUpdate();
            result = true;
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        finally
        {
            // 关闭连接
            ConnectionManager.close(null, pstmt, con);
            return result;
        }
    }
    
    @SuppressWarnings("finally")
	public ArrayList<Studio> findAllStudio() {
    	ArrayList<Studio> list = new ArrayList<Studio>();
    	
    	Connection con = ConnectionManager.getInstance().getConnection();
    	PreparedStatement pstmt = null;
    	ResultSet rs = null;
    	
    	try {
			String sql = "select * from studio";
	
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			Studio info = null;
			while (rs.next()) {
				info = new Studio();
                info.setStudio_id(rs.getInt("studio_id"));
                info.setStudio_name(rs.getString("studio_name"));
                info.setCol_count(rs.getInt("studio_col_count"));
                info.setRow_count(rs.getInt("studio_row_count"));
                info.setStudio_introduction(rs.getString("studio_introduction"));
                info.setStudio_flag(rs.getInt("studio_flag"));
                list.add(info);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
    	finally {
			ConnectionManager.close(rs, pstmt, con);
			return list;
		}
    }

    /**
     * 根据studio_id获取用户信息(一般用于数据内部关联操作)
     * @return 用户
     */
    @SuppressWarnings("finally")
    public Studio findStudioById(int studio_id)
    {
        Studio info = null;
        if(studio_id == 0)
            return info;

        Connection con = ConnectionManager.getInstance().getConnection();
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try
        {
            // 获取所有用户数据
            pstmt = con.prepareStatement("select * from studio where studio_id=?");
            pstmt.setInt(1, studio_id);
            rs = pstmt.executeQuery();
            if(rs.next())
            {
                // 如果有值的话再实例化
            	info = new Studio();
                info.setStudio_id(rs.getInt("studio_id"));
                info.setStudio_name(rs.getString("studio_name"));
                info.setCol_count(rs.getInt("studio_col_count"));
                info.setRow_count(rs.getInt("studio_row_count"));
                info.setStudio_introduction(rs.getString("studio_introduction"));
                info.setStudio_flag(rs.getInt("studio_flag"));
            }
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        finally
        {
            ConnectionManager.close(rs, pstmt, con);
            return info;
        }
    }
}
