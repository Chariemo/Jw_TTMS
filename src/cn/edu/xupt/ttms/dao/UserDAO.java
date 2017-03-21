package cn.edu.xupt.ttms.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import cn.edu.xupt.db.ConnectionManager;
import cn.edu.xupt.ttms.idao.IUser;
import cn.edu.xupt.ttms.model.User;

public class UserDAO implements IUser{
	
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
	public ArrayList<User> findUserByPage(int cPage, String emp_no) {
		currentPage = cPage;
        ArrayList<User> list = new ArrayList<User>();

        // 若未指定查找某人，则默认全查
        if (null == emp_no || emp_no.equals("null"))
        {
            emp_no = "";
        }

        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        
        try
        {
            // 获取记录总数
            String sql1 = "select count(emp_no) as AllRecord from user where emp_no like ?";
            
            conn = ConnectionManager.getInstance().getConnection();
            pstmt = conn.prepareStatement(sql1);
            
            pstmt.setString(1, "%" + emp_no + "%");
            
            
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
            String sql2 = "select * from user where emp_no like ? limit ?,?";
          
            pstmt = conn.prepareStatement(sql2);
            pstmt.setString(1, "%" + emp_no + "%");
            pstmt.setInt(2, PAGE_SIZE * (currentPage - 1));
            pstmt.setInt(3, PAGE_SIZE);
          
            rs = pstmt.executeQuery();
            User user = null;
            while (rs.next())
            {	user = new User();
                user.setNo(rs.getString("emp_no"));
                user.setPwd(rs.getString("emp_pass"));
                user.setType(rs.getInt("type"));
            
                // 将该用户信息插入列表
                list.add(user);
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
	
	
	@SuppressWarnings("finally")
	public int check(String id, String pwd) {
		
		Connection con = ConnectionManager.getInstance().getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = -1;
		
		try {
			pstmt = con.prepareStatement("select * from user");
			rs = pstmt.executeQuery();
			while (rs.next()) {
				if (rs.getString("emp_no").equals(id) && rs.getString("emp_pass").equals(pwd)) {
					result = rs.getInt("type");
 				}
			}
			
		} catch (SQLException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}
		finally
        {
            ConnectionManager.close(rs, pstmt, con);
            return result;
        }
	}
	
	@SuppressWarnings("finally")
	public boolean update(User user) {
		 boolean result = false;
	        if(user == null)
	            return result;

	        Connection con = ConnectionManager.getInstance().getConnection();
	        PreparedStatement pstmt = null;
	        try
	        {
	            String sql = "update user set emp_pass=?, type = ? where emp_no = ?";
	            pstmt = con.prepareStatement(sql);
	            pstmt.setString(1, user.getPwd());
	            pstmt.setInt(2, user.getType());
	            pstmt.setString(3, user.getNo());

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
	public boolean delete(String emp_no) {
		// TODO 自动生成的方法存根
		boolean result = false;
		if (emp_no == null) {
			return result;
		}
		
		Connection con = ConnectionManager.getInstance().getConnection();
        PreparedStatement pstmt = null;
        
        try {
			String sql = "delete from user where emp_no = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, emp_no);
			
			pstmt.executeUpdate();
			result = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
        
        finally {
			ConnectionManager.close(null, pstmt, con);
        	return result;
		}
		
	}
	
	@SuppressWarnings("finally")
	public boolean insert(User user)
    {
        boolean result = false;
        if(user == null)
            return result;

        // 获取Connection
        Connection con = ConnectionManager.getInstance().getConnection();
        PreparedStatement pstmt = null;
        try
        {
            String sql = "insert into user(emp_no, emp_pass, type) values(?,?,?)";
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, user.getNo());
            pstmt.setString(2, user.getPwd());
            pstmt.setInt(3, user.getType());
        

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
	public User findUserByNo(String emp_no)
    {
        if(emp_no == null || emp_no.equals(""))
            return null;

        User info = null;

        Connection con = ConnectionManager.getInstance().getConnection();
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try
        {
            // 获取所有用户数据:模糊查询
            pstmt = con.prepareStatement("select * from user where emp_no = " + emp_no);
          
            rs = pstmt.executeQuery();
            rs.next();
            info = new User();
            
            info.setNo(rs.getString("emp_no"));
            info.setPwd(rs.getString("emp_pass"));
            info.setType(rs.getInt("type"));
           
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
