package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.text.SimpleDateFormat;
import Bean.Bean_Customer;
import Bean.MY_BEAN;
import Bean.Order_Bean;
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
	  
	  public int updateAddtocart(view_cart v)
	     {
	    	 int y=0;
	    	 try {
	    		    Class.forName("com.mysql.jdbc.Driver");
	    			Connection	 con=DriverManager.getConnection("jdbc:mysql://localhost:3306/foodecom","root","root");

	    		
	    			
	    		  PreparedStatement ps=con.prepareStatement("update view_cart set quantity=quantity+? where user=? and pid=?");//placeholder
	    		  ps.setInt(3, v.getPid()); 
	    		  ps.setInt(1,v.getQuantity());
	    		  ps.setString(2, v.getUser());
	  
	    		  
	    		    
	    		    y=ps.executeUpdate();
	    		    
	    		    
	    		    con.close();
	    	 }catch(Exception e)
	    	 {
	    		  System.out.println(e);
	    	 }
	    		return y;
	    	}
	  
	
	  public int quantityCheck(String id , String user)	 
		{
			int x=0;
		
			try {
				
				Connection con =Start(); 
				// prepared Statement
				PreparedStatement ps = con.prepareStatement("Select * from view_cart where pid=? and user=?");
				ps.setInt(1, Integer.parseInt(id));
				ps.setString(2, user);
				
			//	System.out.println(ps);
				ResultSet rs=ps.executeQuery();
	             x=0;
				if(rs.next())
	           x=1;
		}catch(Exception e)
			{
			System.out.println(e);
			}
			return x;
		}
	  
	  public ArrayList<cart_bean>  viewcart(String user)
		{
			ArrayList<cart_bean> list=new ArrayList<>();
			
			try {
				Connection con = Start();
				
				PreparedStatement ps=con.prepareStatement("SELECT v.cid,i.image,v.quantity, i.Product_name, i.price FROM itemcollection i , view_cart v WHERE v.pid=i.Sno And v.user= ?");
				ps.setString(1, user);
				ResultSet rs=ps.executeQuery();
				
				
				while(rs.next())
				{ 
					cart_bean e=new cart_bean();
					
					e.setCartid(rs.getInt(1));
					e.setFilename(rs.getString(2));
					e.setQuantity(rs.getInt(3));
					e.setProductname(rs.getString(4));
					e.setProductprice(rs.getDouble(5));
					
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
				     e.setTotal(rs.getInt(1));
					 list.add(e);
			     }
				
				
				con.close();
			}catch( SQLException w)
				{
				  System.out.println(w);
				}
		 return  list;
		 
		}
	  public int  gtot(String user)
			{
				int gtot=0;
				
				 try {
					Connection con = Start();
					
					PreparedStatement ps=con.prepareStatement("SELECT Sum(v.quantity*i.price) FROM itemcollection i , view_cart v WHERE v.pid=i.Sno And v.user= ?");
					ps.setString(1, user);
					ResultSet rs=ps.executeQuery();
						
					
					if(rs.next())
					{ 
					    gtot= rs.getInt(1);
						
				     }
					
					
					con.close();
				}catch( SQLException w)
					{
					  System.out.println(w);
					}
			 return  gtot;
			 
			}
	  public int cartcount(String user)
	  {
		  int count=0;
			
			
			 try {
				Connection con = Start();
				
				PreparedStatement ps=con.prepareStatement("SELECT COUNT(*) FROM view_cart WHERE user=?");
				ps.setString(1, user);
				ResultSet rs=ps.executeQuery();
					
				
				if(rs.next())
				{ 
				    count=(rs.getInt(1));
					 
			     }
				
				
				con.close();
			}catch( SQLException w)
				{
				  System.out.println(w);
				}
		 return  count;
		
		  
	  }
	  
	  public int cartupdate(String user , String IP)
	  {
		  int x=0;
		  try {
			  
			  Connection con = Start();
				
				PreparedStatement ps=con.prepareStatement("UPDATE view_cart SET user=? WHERE user=?");
				ps.setString(1, user);
				ps.setString(2, IP);
				x=ps.executeUpdate();
				//System.out.println(ps);
				con.close();
			}catch( SQLException w)
				{
				  System.out.println(w);
				}
		 return  x;
		  
	  }
	 public ArrayList<MY_BEAN> ProductDriscption(int pid)
	 {
		 ArrayList<MY_BEAN> list2=new ArrayList<>();
			try {
				Connection con = Start();
				
				PreparedStatement ps=con.prepareStatement("SELECT  * FROM itemcollection WHERE Sno = ?");
				ps.setInt(1, pid);
				
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
	 
	 public String checkEmail(String email)
	 {
	 	String msg=null;
	 	
	 	try
	 	{	
	 		int x=0;
	 		Class.forName("com.mysql.jdbc.Driver");
	 		Connection con = Start();
			
			PreparedStatement ps=con.prepareStatement("SELECT  * FROM cust_signup WHERE email = ?");
			ps.setString(1, email);
			
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
	 public int updatecart(cart_bean c)
     {
    	 int y=0;
    	 try {
    		 Class.forName("com.mysql.jdbc.Driver");
 	 		Connection con = Start();
 			
    		
    			
    		  PreparedStatement ps=con.prepareStatement("update view_cart set quantity=? where cid = ?");//placeholder
    		  
    		  ps.setInt(1, c.getQuantity()); 
    		  ps.setInt(2,c.getCartid());
    		   
    		    
    		    y=ps.executeUpdate();
    		    
    		    
    		    con.close();
    	 }catch(Exception e)
    	 {
    		  System.out.println(e);
    	 }
    		return y;
    	}
	 public int updatecart(String cid, String quan)
     {
    	 int y=0;
    	 try {
    		    Class.forName("com.mysql.jdbc.Driver");
    			Connection	 con=DriverManager.getConnection("jdbc:mysql://localhost:3306/foodecom","root","root");

    		
    			
    		  PreparedStatement ps=con.prepareStatement("update view_cart set quantity=? where cid=? ");//placeholder
    		  ps.setInt(1,Integer.parseInt(quan)); 
    		  ps.setInt(2,Integer.parseInt(cid));
  
    		  System.out.println(ps);
    		    
    		    y=ps.executeUpdate();
    		    
    		    
    		    con.close();
    	 }catch(Exception e)
    	 {
    		  System.out.println(e);
    	 }
    		return y;
    	}
	 public ArrayList<cart_bean>  Checkout(String user,String Add)
		{
			ArrayList<cart_bean> list=new ArrayList<>();
			//cart_bean e=new cart_bean();
			
			
			 try {
				Connection con = Start();
				int y=0;
				PreparedStatement ps=con.prepareStatement("SELECT v.pid,v.quantity,v.user, i.price FROM itemcollection i , view_cart v where v.pid=i.Sno And user=?");
				ps.setString(1, user);
				ResultSet rs=ps.executeQuery();
				//	System.out.println(ps);
				while(rs.next())
				{ 
				 y=	insertOrder(rs.getInt(1),rs.getInt(2),rs.getString(3),Add,rs.getInt(4));
					
				 
				  
				}
				if(y==1)
				{
				Deletecart(user);
				}
				con.close();
			}catch( SQLException w)
				{
				  System.out.println(w);
				}
		 return  list;
		 
		} 
	 public int insertOrder(int pid, int quan, String user,String add,int price)
	     {
		 
	    	 int y=0;
	    	 try {
	    		    Class.forName("com.mysql.jdbc.Driver");
	    			//Connection	 con=DriverManager.getConnection("jdbc:mysql://localhost:3306/foodecom","root","root");
	    		    Date myDate = new Date();
	    		    SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd-HH:mm:ss");
	    		    String myDateString = sdf.format(myDate);
	    		    
	    		    Connection con = Start();
	    			//Order_Bean o = new Order_Bean();
	    		  PreparedStatement ps=con.prepareStatement("insert into orderplace(pid,quantity,price,user,address,Date) value(?,?,?,?,?,?)");
	    		  ps.setInt(1, pid);
	    		    ps.setLong(2,quan);
	    		    ps.setLong(3,price);
	    		    ps.setString(4, user);
	    		    ps.setString(5,add);
	    		   ps.setString(6, myDateString);
	    		   //ps.setString(6, B.getAdd());
	    		//   System.out.println(ps);
	    		    y=ps.executeUpdate();
	    		    
	    		    
	    		    con.close();
	    	 }catch(Exception e)
	    	 {
	    		  System.out.println(e);
	    	 }
	    		return y;
	    	}
	 
	 public int Deletecart(String user)
     {
    	 int y=0;
    	 try {
    		    //cart_bean c  = new cart_bean(); 
    		    Class.forName("com.mysql.jdbc.Driver");
    		//	Connection	 con=DriverManager.getConnection("jdbc:mysql://localhost:3306/foodecom","root","root");

    		    Connection con = Start();
    			
    		  PreparedStatement ps=con.prepareStatement("delete from view_cart where user=?");
    		  ps.setString(1,user);
    		  y=ps.executeUpdate();
    		  //System.out.println(ps);
    		  con.close();
    	 }catch(Exception e)
    	 {
    		  System.out.println(e);
    	 }
    		return y;
   }
	 
	 public int deletecartitem(int cid)
	{
         int x=0;
		
		try {
			
			Connection con= Start();
			PreparedStatement ps=con.prepareStatement("delete from view_cart where cid=?");
			ps.setInt(1,cid);
			x= ps.executeUpdate();
	       con.close();
		}catch( SQLException w)
			{
			  System.out.println(w);
			}
		
		return x;
	}
	 public ArrayList<Order_Bean>  vieworderuser(String u )
		{
			ArrayList<Order_Bean> list=new ArrayList<>();
			try {
				Connection con = Start();
				
				PreparedStatement ps=con.prepareStatement("select  * from orderplace where user=? order by oid desc");
				ps.setString(1, u);
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
				//	System.out.println(e);
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
