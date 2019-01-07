package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import Bean.Bean_Customer;
import Bean.MY_BEAN;
import Bean.cart_bean;
import Bean.view_cart;


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

	    		
	    			
	    		  PreparedStatement ps=con.prepareStatement("insert into cust_signup(fname,lname,pass,mobile,email,adress) value(?,?,?,?,?,?)");//placeholder
	    		  ps.setString(1, B.getFname()); 
	    		  ps.setString(2,B.getLname());
	    		    ps.setString(3, B.getPassw());
	  
	    		    ps.setLong(4,B.getMobile());
	    		   ps.setString(5, B.getEmail());
	    		   ps.setString(6, B.getAdd());
	    		    
	    		    y=ps.executeUpdate();
	    		    
	    		    
	    		    con.close();
	    	 }catch(Exception e)
	    	 {
	    		  System.out.println(e);
	    	 }
	    		return y;
	    	}

	  
	  public ArrayList<MY_BEAN>  viewproductreadytocook()
		{
			ArrayList<MY_BEAN> list1=new ArrayList<>();
			try {
				Connection con = Start();
				
				PreparedStatement ps=con.prepareStatement("SELECT  * FROM itemcollection WHERE Category = 'ready to cook'");
				ResultSet rs=ps.executeQuery();
				
				while(rs.next())
				{ 
					MY_BEAN e=new MY_BEAN();
					e.setSno(rs.getInt("Sno"));
					e.setCategory(rs.getString("Category"));
					e.setFilename(rs.getString("image"));
					e.setProductdesc(rs.getString("Discription"));
					e.setProductname(rs.getString("Product_name"));
					e.setProductprice(rs.getDouble("price"));
					//e.setFilename(filename);(rs.getString("emailid"));
					//e.setAcc_no(rs.getInt("AccountNo"));
					//e.setBalance(rs.getInt("Balance"));
					//e.setSalary(rs.getDouble("salary"));
					//e.setAddress(rs.getString("address"));
					list1.add(e);
			     }
				con.close();
			}catch( SQLException w)
				{
				  System.out.println(w);
				}
		return list1;
			
		}
	  
	  public ArrayList<MY_BEAN>  viewproductreadytoeat()
		{
			ArrayList<MY_BEAN> list2=new ArrayList<>();
			try {
				Connection con = Start();
				
				PreparedStatement ps=con.prepareStatement("SELECT  * FROM itemcollection WHERE Category = 'ready to eat'");
				ResultSet rs=ps.executeQuery();
				
				while(rs.next())
				{ 
					MY_BEAN e=new MY_BEAN();
					e.setSno(rs.getInt("Sno"));
					e.setCategory(rs.getString("Category"));
					e.setFilename(rs.getString("image"));
					e.setProductdesc(rs.getString("Discription"));
					e.setProductname(rs.getString("Product_name"));
					e.setProductprice(rs.getDouble("price"));
					
					list2.add(e);
			     }
				con.close();
			}catch( SQLException w)
				{
				  System.out.println(w);
				}
		return list2;
			
		}
	  
	  public ArrayList<MY_BEAN>  viewproductreadytodrink()
		{
			ArrayList<MY_BEAN> list3=new ArrayList<>();
			try {
				Connection con = Start();
				
				PreparedStatement ps=con.prepareStatement("SELECT  * FROM itemcollection WHERE Category = 'ready to drink'");
				ResultSet rs=ps.executeQuery();
				
				while(rs.next())
				{ 
					MY_BEAN e=new MY_BEAN();
					e.setSno(rs.getInt("Sno"));
					e.setCategory(rs.getString("Category"));
					e.setFilename(rs.getString("image"));
					e.setProductdesc(rs.getString("Discription"));
					e.setProductname(rs.getString("Product_name"));
					e.setProductprice(rs.getDouble("price"));
					
					list3.add(e);
			     }
				con.close();
			}catch( SQLException w)
				{
				  System.out.println(w);
				}
		return list3;
			
		}
	  
	  
	  public int logincheck(String uid , String pwd)
		{
			int x=0;
			
			try {
				
				Connection con = Start();
				PreparedStatement ps=con.prepareStatement("select * from cust_signup where fname=? and pass=?");
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
	  public int Addtocart(view_cart v)
	     {
	    	 int y=0;
	    	 try {
	    		    Class.forName("com.mysql.jdbc.Driver");
	    			Connection	 con=DriverManager.getConnection("jdbc:mysql://localhost:3306/foodecom","root","root");

	    		
	    			
	    		  PreparedStatement ps=con.prepareStatement("insert into view_cart(pid,quantity,user) value(?,?,?)");//placeholder
	    		  ps.setInt(1, v.getPid()); 
	    		  ps.setInt(2,v.getQuantity());
	    		  ps.setString(3, v.getUser());
	  
	    		    
	    		    
	    		    y=ps.executeUpdate();
	    		    
	    		    
	    		    con.close();
	    	 }catch(Exception e)
	    	 {
	    		  System.out.println(e);
	    	 }
	    		return y;
	    	}
	  public ArrayList<cart_bean>  viewcart(String user)
		{
			ArrayList<cart_bean> list=new ArrayList<>();
			
			try {
				Connection con = Start();
				
				PreparedStatement ps=con.prepareStatement("SELECT i.image,v.quantity, i.Product_name, i.price FROM itemcollection i , view_cart v WHERE v.pid=i.Sno And v.user= ?");
				ps.setString(1, user);
				ResultSet rs=ps.executeQuery();
				
				
				while(rs.next())
				{ 
					cart_bean e=new cart_bean();
					
					
					e.setFilename(rs.getString(1));
					e.setQuantity(rs.getInt(2));
					e.setProductname(rs.getString(3));
					e.setProductprice(rs.getDouble(4));
					
					list.add(e);
			     }
				con.close();
			}catch( SQLException w)
				{
				  System.out.println(w);
				}
		return list;
			
		}
	  
	  public ArrayList<cart_bean>  viewcartTotal(String user)
		{
			ArrayList<cart_bean> list=new ArrayList<>();
			cart_bean e=new cart_bean();
			
			
			 try {
				Connection con = Start();
				
				PreparedStatement ps=con.prepareStatement("SELECT Sum(v.quantity*i.price) FROM itemcollection i , view_cart v WHERE v.pid=i.Sno And v.user= ?");
				ps.setString(1, user);
				ResultSet rs=ps.executeQuery();
					
				
				if(rs.next())
				{ 
				     e.setTotal(rs.getInt("Sum(v.quantity*i.price)"));
					 list.add(e);
			     }
				
				
				con.close();
			}catch( SQLException w)
				{
				  System.out.println(w);
				}
		 return  list;
		 
		}

	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}

}
