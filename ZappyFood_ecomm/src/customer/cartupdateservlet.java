package customer;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import Bean.cart_bean;
import dao.Dao_Customer;

/**
 * Servlet implementation class cartupdateservlet
 */
@WebServlet("/cartupdateservlet")
public class cartupdateservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public cartupdateservlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		 processRequest(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		 processRequest(request, response);
	}
	
	protected void processRequest(HttpServletRequest request, 
		    HttpServletResponse response) throws ServletException, IOException {
		    response.setContentType("text/html;charset=UTF-8");
		    String cartid=request.getParameter("cartid");
		    String quantity=request.getParameter("quantity");
		    String Amount = request.getParameter("amountid");
		   
		    cart_bean c = new cart_bean();
		    
		    c.setCartid(Integer.parseInt(cartid));
		    c.setProductprice(Double.parseDouble(Amount));
		    c.setQuantity(Integer.parseInt(quantity));
		    
		    PrintWriter out=response.getWriter();
		    	 
	         out.println(cartid);
			Dao_Customer m = new Dao_Customer();
			int x= m.updatecart(c);
			
			if(x==1)
		         {
				 
		        	 RequestDispatcher rd=request.getRequestDispatcher("ajaxtest.jsp");
	                request.setAttribute("msg", "Data update Successfully...");
	               rd.forward(request, response);
	                
	  		    	 
		         out.println("Data Not Inserted Successfully...");
		         }
		         else
		         {
		        	 RequestDispatcher rd=request.getRequestDispatcher("ajaxtest.jsp");
	             request.setAttribute("msg", "Data Not Inserted Successfully...");
	            rd.forward(request, response);
		         }
				

		}
	
		    //MY_BEAN e=new my_dao().getproductDetailsBypid(Integer.parseInt(pid));
		   
		    //RequestDispatcher rd=request.getRequestDispatcher("UpdateProduct.jsp");
			//request.setAttribute("pid", e);
			//rd.forward(request, response);
		    
		    /*  PrintWriter out = response.getWriter();
		    try {
		        /* TODO output your response here.
		        out.println(request.getParameter("myName"));
		        out.println(request.getParameter("quantityid"));
		        out.println(request.getParameter("cart"));
		        out.println(request.getParameter("amount"));
		    } finally {
		        out.close();
		    }*/
		}





