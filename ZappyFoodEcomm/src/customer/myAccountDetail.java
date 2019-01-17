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
import Bean.Order_Bean;
import dao.Dao_Customer;


/**
 * Servlet implementation class myAccountDetail
 */
@WebServlet("/myAccountDetail")
public class myAccountDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public myAccountDetail() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	//	response.getWriter().append("Served at: ").append(request.getContextPath());
		int count;
		HttpSession session=request.getSession();
		String user = (String)session.getAttribute("uid");
		
		  Dao_Customer d = new Dao_Customer();
		count=d.cartcount(user);
		
		request.setAttribute("count", count);
  
  
		  ArrayList<Order_Bean> list= d.vieworderuser(user);

	      RequestDispatcher rd=request.getRequestDispatcher("myAccount.jsp");
	      request.setAttribute("LIST", list);
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
