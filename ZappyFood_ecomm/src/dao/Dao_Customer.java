package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import Bean.Bean_Customer;


public class Dao_Customer {
	
	
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
	
	  public int insertCustomer(Bean_Customer B)
	     {
	    	 int y=0;
	    	 try {
	    		    Class.forName("com.mysql.jdbc.Driver");
	    			Connection	 con=DriverManager.getConnection("jdbc:mysql://localhost:3306/foodecom","root","root");

	    		
	    			
	    		  PreparedStatement ps=con.prepareStatement("insert into cust_signup(fname,lname,pass,mobile,email) value(?,?,?,?,?)");//placeholder
	    		  ps.setString(1, B.getFname()); 
	    		  ps.setString(2,B.getLname());
	    		    ps.setString(3, B.getPassw());
	    		    ps.setLong(4,B.getMobile());
	    		   ps.setString(5, B.getEmail());
	    		  
	    		    
	    		    y=ps.executeUpdate();
	    		    
	    		    
	    		    con.close();
	    	 }catch(Exception e)
	    	 {
	    		  System.out.println(e);
	    	 }
	    		return y;
	    	}


	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}

}
