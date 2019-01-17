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

import Bean.MY_BEAN;
import dao.Dao_Customer;


/**
 * Servlet implementation class viewproductIndex
 */
@WebServlet("/viewproductIndex")
public class viewproductIndex extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public viewproductIndex() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		int count;
		HttpSession session=request.getSession();
		String user = (String)session.getAttribute("uid");
		
		Dao_Customer m=new Dao_Customer();
		         

		if(user==null)
		{
			user=request.getRemoteAddr();
		}
		        count=m.cartcount(user);
		
				request.setAttribute("count", count);
		  
		  ArrayList<MY_BEAN> list1= m.viewproductreadytocook();

	     request.setAttribute("LIST1", list1);
	      
	      ArrayList<MY_BEAN> list2= m.viewproductreadytodrink();

	     request.setAttribute("LIST2", list2);
	      
	      ArrayList<MY_BEAN> list3= m.viewproductreadytoeat();

	      RequestDispatcher rd3=request.getRequestDispatcher("Custindex.jsp");
	     request.setAttribute("LIST3", list3);
	      rd3.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
