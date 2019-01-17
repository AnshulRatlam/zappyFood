package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import Bean.MY_BEAN;
import Bean.Order_Bean;


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
     public int insertProduct(MY_BEAN B)
     {
    	 int y=0;
    	 try {
    		    Class.forName("com.mysql.jdbc.Driver");
    			Connection	 con=DriverManager.getConnection("jdbc:mysql://localhost:3306/foodecom","root","root");

    		  PreparedStatement ps=con.prepareStatement("insert into itemcollection(Category,Product_name,price,Discription,image) value(?,?,?,?,?)");//placeholder
    		  ps.setString(1, B.getCategory()); 
    		  ps.setString(2,B.getProductname());
    		    ps.setDouble(3, B.getProductprice());
    		    ps.setString(4,B.getProductdesc());
    		    ps.setString(5,B.getFilename());
    		    
    		    y=ps.executeUpdate();
    		    
    		    
    		    con.close();
    	 }catch(Exception e)
    	 {
    		  System.out.println(e);
    	 }
    		return y;
    	}
    
     public ArrayList<MY_BEAN>  viewproduct()
		{
			ArrayList<MY_BEAN> list=new ArrayList<>();
			try {
				Connection con = Start();
				
				PreparedStatement ps=con.prepareStatement("select  * from itemcollection");
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
					list.add(e);
			     }
				con.close();
			}catch( SQLException w)
				{
				  System.out.println(w);
				}
		return list;
			
		}
	 
	 
	public int deleteEmp(int pid)
	{
         int x=0;
		
		try {
			
			Connection con= Start();
			PreparedStatement ps=con.prepareStatement("delete from itemcollection where Sno=?");
			ps.setInt(1,pid);
			x= ps.executeUpdate();
	       con.close();
		}catch( SQLException w)
			{
			  System.out.println(w);
			}
		
		return x;
	}

	public  MY_BEAN getproductDetailsBypid(int pid)
	{
		MY_BEAN e=new MY_BEAN();
		try {
		Connection con= Start();
			PreparedStatement ps=con.prepareStatement("select  * from itemcollection where Sno=?");
			ps.setInt(1,pid);
			ResultSet rs=ps.executeQuery();
			if(rs.next())
			{ 
				
				e.setSno(rs.getInt("Sno"));
				e.setCategory(rs.getString("Category"));
				
				e.setProductdesc(rs.getString("Discription"));
				e.setProductname(rs.getString("Product_name"));
				e.setProductprice(rs.getDouble("price"));
			
		     }
			con.close();
		}catch( SQLException w)
			{
			  System.out.println(w);
			}
		System.out.println(e);
	return e;
		
	}
	public  MY_BEAN getproductImageBypid(int pid)
	{
		MY_BEAN e=new MY_BEAN();
		try {
		Connection con= Start();
			PreparedStatement ps=con.prepareStatement("select  * from itemcollection where Sno=?");
			ps.setInt(1,pid);
			ResultSet rs=ps.executeQuery();
			if(rs.next())
			{ 
				
				e.setSno(rs.getInt("Sno"));
				e.setCategory(rs.getString("Category"));
				e.setFilename(rs.getString("image"));
				e.setProductdesc(rs.getString("Discription"));
				e.setProductname(rs.getString("Product_name"));
				e.setProductprice(rs.getDouble("price"));
			
		     }
			con.close();
		}catch( SQLException w)
			{
			  System.out.println(w);
			}
		System.out.println(e);
	return e;
		
	}
	public int updateproduct(MY_BEAN e)
	{
		int x=0;
		
		try {

			
			
			Connection con= Start();
			PreparedStatement ps=con.prepareStatement("update itemcollection set Product_name=?,price=?,Discription=?,Category=? where Sno=?");
			ps.setInt(5,e.getSno());
			ps.setString(1,e.getProductname());
			ps.setDouble(2, e.getProductprice());
			ps.setString(3, e.getProductdesc());
			ps.setString(4, e.getCategory());
			x= ps.executeUpdate();
			
			
	       con.close();
		}catch(SQLException w)
			{
			  System.out.println(w);
			}
		
		return x;
	}
	
	 public int updateProductImage(MY_BEAN B)
     {
    	 int y=0;
    	 try {
    		    Class.forName("com.mysql.jdbc.Driver");
    			Connection	 con=DriverManager.getConnection("jdbc:mysql://localhost:3306/foodecom","root","root");

    		  PreparedStatement ps=con.prepareStatement("update itemcollection set image=? where Sno=?");//placeholder
    		  
    		    
    		    ps.setString(1,B.getFilename());
    		    ps.setInt(2,B.getSno());
    		    y=ps.executeUpdate();
    		    
    		    System.out.println(ps);
    		    con.close();
    	 }catch(Exception e)
    	 {
    		  System.out.println(e);
    	 }
    		return y;
    	}
	 public String checkproductname(String name)
	 {
	 	String msg=null;
	 	
	 	try
	 	{	
	 		int x=0;
	 		Class.forName("com.mysql.jdbc.Driver");
	 		Connection con = Start();
			
			PreparedStatement ps=con.prepareStatement("SELECT  * FROM itemcollection WHERE Product_Name = ?");
			ps.setString(1, name);
			
	 		ResultSet rs = ps.executeQuery();
	 		while(rs.next())
	 		{
	 			x=1;
	 		}
	 		if(x==1)
	 			msg="<font color=red>This Email Already Exist</font>";
	 		else
	 			msg="<font color=green>Avaliable</font>";
	 	}
	 	catch(Exception e)
	 	{
	 		System.out.println(e);
	 	}
	 	
	      return msg;
	 }

    
	   public ArrayList<Order_Bean>  vieworder()
			{
				ArrayList<Order_Bean> list=new ArrayList<>();
				try {
					Connection con = Start();
					
					PreparedStatement ps=con.prepareStatement("select  * from orderplace order by oid desc");
					ResultSet rs=ps.executeQuery();
					while(rs.next())
					{ 
						
						Order_Bean e=new Order_Bean();
						e.setOid(rs.getInt("oid"));
						e.setPid(rs.getInt("pid"));
						e.setQuantity(rs.getInt("quantity"));
						e.setPrice(rs.getInt("price"));
						e.setUser(rs.getString("user"));;
						e.setAddress(rs.getString("address"));
						e.setStatus(rs.getInt("status"));
						e.setDateo(rs.getString("Date"));
						//System.out.println(e);
						list.add(e);
				     }
					con.close();
				}catch( SQLException w)
					{
					  System.out.println(w);
					}
			return list;
				
			}
	   public ArrayList<Order_Bean>  vieworderpending()
		{
			ArrayList<Order_Bean> list=new ArrayList<>();
			try {
				Connection con = Start();
				
				PreparedStatement ps=con.prepareStatement("select  * from orderplace where status=0 order by oid desc");
				ResultSet rs=ps.executeQuery();
				while(rs.next())
				{ 
					
					Order_Bean e=new Order_Bean();
					e.setOid(rs.getInt("oid"));
					e.setPid(rs.getInt("pid"));
					e.setQuantity(rs.getInt("quantity"));
					e.setPrice(rs.getInt("price"));
					e.setUser(rs.getString("user"));;
					e.setAddress(rs.getString("address"));
					e.setStatus(rs.getInt("status"));
					e.setDateo(rs.getString("Date"));
					list.add(e);
			     }
				con.close();
			}catch( SQLException w)
				{
				  System.out.println(w);
				}
		return list;
			
		}
	   
	   public int dispatch(int oid)
	   {
		   int y=0;
  	 try {
		    //cart_bean c  = new cart_bean(); 
		    Class.forName("com.mysql.jdbc.Driver");
		//	Connection	 con=DriverManager.getConnection("jdbc:mysql://localhost:3306/foodecom","root","root");

		    Connection con = Start();
			
		  PreparedStatement ps=con.prepareStatement("Update orderplace set status=1  where oid=?");
		  ps.setInt(1,oid);
		  y=ps.executeUpdate();
		  //System.out.println(ps);
		  con.close();
	 }catch(Exception e)
	 {
		  System.out.println(e);
	 }
		return y;
	   }
		public int notavlaible(int oid)
		{int y=0;
	  	 try {
			    //cart_bean c  = new cart_bean(); 
			    Class.forName("com.mysql.jdbc.Driver");
			//	Connection	 con=DriverManager.getConnection("jdbc:mysql://localhost:3306/foodecom","root","root");

			    Connection con = Start();
				
			  PreparedStatement ps=con.prepareStatement("Update orderplace set status=2  where oid=?");
			  ps.setInt(1,oid);
			  y=ps.executeUpdate();
			  //System.out.println(ps);
			  con.close();
		 }catch(Exception e)
		 {
			  System.out.println(e);
		 }
			return y;
		}
		 public ArrayList<Order_Bean>  vieworderhistory()
			{
				ArrayList<Order_Bean> list=new ArrayList<>();
				try {
					Connection con = Start();
					
					PreparedStatement ps=con.prepareStatement("select  * from orderplace where status!=0");
					ResultSet rs=ps.executeQuery();
					while(rs.next())
					{ 
						
						Order_Bean e=new Order_Bean();
						e.setOid(rs.getInt("oid"));
						e.setPid(rs.getInt("pid"));
						e.setQuantity(rs.getInt("quantity"));
						e.setPrice(rs.getInt("price"));
						e.setUser(rs.getString("user"));;
						e.setAddress(rs.getString("address"));
						e.setStatus(rs.getInt("status"));
						
						list.add(e);
				     }
					con.close();
				}catch( SQLException w)
					{
					  System.out.println(w);
					}
			return list;
				
			}
	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}

}
