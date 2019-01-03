package customer;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Bean.Bean_Customer;
import Bean.view_cart;
import dao.Dao_Customer;

/**
 * Servlet implementation class addtocart
 */
@WebServlet("/addtocart")
public class addtocart extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addtocart() {
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
		
      view_cart b = new view_cart();
		
		
		Dao_Customer m = new Dao_Customer();
		
		if(user==null)
		{
			user=request.getRemoteAddr();
			
			b.setPid(Integer.parseInt(pid));
			b.setQuantity(Integer.parseInt(quantity));
			b.setUser(user);
			int x= m.Addtocart(b);
			
			if(x==1)
		         {
				 
		        	 RequestDispatcher rd=request.getRequestDispatcher("index1.jsp");
	                request.setAttribute("msg", "item add Successfully...");
	               rd.forward(request, response);
	                PrintWriter out=response.getWriter();
	  		    	 
		         
		         }
		         else
		         {
		        	 RequestDispatcher rd=request.getRequestDispatcher("index1.jsp");
	             request.setAttribute("msg", "Data Not Inserted Successfully...");
	            rd.forward(request, response);
		         }
		}
		if(user!=null)
		{
			b.setPid(Integer.parseInt(pid));
			b.setQuantity(Integer.parseInt(quantity));
			b.setUser(user);
			int x= m.Addtocart(b);
			
			if(x==1)
		         {
				 
		        	 RequestDispatcher rd=request.getRequestDispatcher("index1.jsp");
	                request.setAttribute("msg", "item add Successfully...");
	               rd.forward(request, response);
	                PrintWriter out=response.getWriter();
	  		    	 
		         
		         }
		         else
		         {
		        	 RequestDispatcher rd=request.getRequestDispatcher("index1.jsp");
	             request.setAttribute("msg", "Data Not Inserted Successfully...");
	            rd.forward(request, response);
		         }
			
		}
		
			

	}


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
