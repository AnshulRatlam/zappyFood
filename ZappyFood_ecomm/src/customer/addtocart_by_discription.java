package customer;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Bean.MY_BEAN;
import Bean.view_cart;
import dao.Dao_Customer;

/**
 * Servlet implementation class addtocart_by_discription
 */
@WebServlet("/addtocart_by_discription")
public class addtocart_by_discription extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addtocart_by_discription() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		
		String pid = request.getParameter("pid");
		String quantity = request.getParameter("quantity");
		HttpSession session=request.getSession();
		String user = (String)session.getAttribute("uid");
		PrintWriter out=response.getWriter();
      view_cart b = new view_cart();
		
		
		Dao_Customer m = new Dao_Customer();
		
		
		 if(user==null)
		{
			 out.println(user);
			user=request.getRemoteAddr();
		}
		 
		 int count;
			count=m.cartcount(user);
			
			request.setAttribute("count", count);
		 
		 	b.setPid(Integer.parseInt(pid));
			b.setQuantity(Integer.parseInt(quantity));
			b.setUser(user);
			int y = m.quantityCheck(pid, user);
			int x = 0;
			
			 if(y==1)
		     {
			   m.updateAddtocart(b);
		     }	
			 if(y==0)
			 {
			 x= m.Addtocart(b);
			 }
			
			 //RequestDispatcher rd=request.getRequestDispatcher("index1.jsp");
				
			
	        
		    
	 	      ArrayList<MY_BEAN> list= m.ProductDriscption(Integer.parseInt(pid));
	 	   RequestDispatcher rd=request.getRequestDispatcher("Productdiscription.jsp");
	 	   request.setAttribute("LIST", list);
			  //  request.setAttribute("msg","product: "+eid+ " deleted Successfully..");
	 	   	  
				  
				 
			      
			   if(x==1 || y==1)
			   {
				   request.setAttribute("msg", "item add Successfully...");
			   }
	             else
		         {
	            	 request.setAttribute("msg", "Data Not Inserted Successfully...");
		         }
			   
			   rd.forward(request, response);   

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
