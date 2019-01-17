package customer;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import Bean.cart_bean;
import dao.Dao_Customer;


/**
 * Servlet implementation class dleteccartitem
 */
@WebServlet("/dleteccartitem")
public class dleteccartitem extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public dleteccartitem() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	//	response.getWriter().append("Served at: ").append(request.getContextPath());
		
		
	    int del =Integer.parseInt(request.getParameter("pid"));
	    HttpSession session=request.getSession();
		String user = (String)session.getAttribute("uid");
		   
	    Dao_Customer m=new Dao_Customer();
	    int x=m.deletecartitem(del);
    if(x!=0)
    {
    	if(user==null)
		{
			user=request.getRemoteAddr();
		}
		
		   int count;
		  count=m.cartcount(user);
		
		  request.setAttribute("count", count);
		  
		  ArrayList<cart_bean> list= m.viewcart(user);
		  if(list.isEmpty()==true)
		  {
			  response.sendRedirect("viewproductIndex");
		  }
		  else
		  {
	      ArrayList<cart_bean> listTotal = m.viewcartTotal(user);  
	  
	     
	     RequestDispatcher rd3=request.getRequestDispatcher("viewcart.jsp");
	     request.setAttribute("LIST", list);
	     request.setAttribute("LISTTotal", listTotal);
	     request.setAttribute("msg","product remove Successfully.."); 
	     rd3.forward(request, response);
		  }
       }
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	
	}

}
