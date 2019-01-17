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
 * Servlet implementation class checkServlet
 */
@WebServlet("/checkServlet")
public class checkServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public checkServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		String Adress = request.getParameter("Adress");
		HttpSession session = request.getSession();
		String user = (String)session.getAttribute("uid");
		Dao_Customer D = new Dao_Customer();
		 
	 	  
		if (user==null)
		{
			//RequestDispatcher rd=request.getRequestDispatcher("login.jsp");
			response.sendRedirect("login.jsp");
			//rd.forward(request, response);
		}
		else
		{
		
		 ArrayList<cart_bean> list= D.Checkout(user,Adress);
		  
			  RequestDispatcher rd=request.getRequestDispatcher("myAccountDetail");
	 	 //  request.setAttribute("LIST", list);
	 	  rd.forward(request, response);
	}

}
}