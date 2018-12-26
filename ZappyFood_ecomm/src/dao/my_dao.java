package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class my_dao {
	public Connection Start()
	{
	     Connection con = null;
	     try
	     {
	    	    Class.forName("com.mysql.jdbc.Driver");
				 con=DriverManager.getConnection("jdbc:mysql://localhost:3306/foodecom","root","root");
	     }
	     catch(ClassNotFoundException | SQLException w)
			{
			   System.out.println(w);
			}

		
		return con;
		


	}


	public int logincheck(String uid , String pwd)
	{
		int x=0;
		
		try {
			
			Connection con = Start();
			PreparedStatement ps=con.prepareStatement("select * from admin where aid=? and pasw=?");
			ps.setString(1, uid);
			ps.setString(2, pwd);
			 ResultSet rs= ps.executeQuery();
	          x=0;
			 if(rs.next())
				 x=1;
			con.close();
		}catch( SQLException w)
			{
			   System.out.println(w);
			}

		
		return x;
		
	}


	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}

}
