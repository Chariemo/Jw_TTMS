package cn.edu.xupt.db;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;


public final class ConnectionManager
{
    private static ConnectionManager instance;
    private static DataSource ds;

    // 初始化,只执行一次
    static
    {
        try
        {
            Context ctx = new InitialContext();
            // java:comp/env/是java中访问JEE资源JNDI固定写法
            ds = (DataSource) ctx.lookup("java:comp/env/jdbc/mydb");
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
    }

   
    public synchronized static final ConnectionManager getInstance()
    {
        if(instance == null)
        {
            try
            {
                instance = new ConnectionManager();
            }
            catch(Exception e)
            {
                e.printStackTrace();
            }
        }
        return instance;
    }

    @SuppressWarnings("finally")
    public synchronized Connection getConnection()
    {
        // 获得对数据源的引用
        Connection conn = null;
        try
        {
            conn = ds.getConnection();
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        finally
        {
            return conn;
        }
    }

   
    public static void close(ResultSet rs, Statement stmt, Connection con)
    {
        try
        {
            if(rs != null)
                rs.close();
            if(stmt != null)
                stmt.close();
            if(con != null)
                con.close();
        }
        catch(SQLException e)
        {
            e.printStackTrace();
        }
    }

}
