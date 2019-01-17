package customer;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Bean.MY_BEAN;
import dao.Dao_Customer;


/**
 * Servlet implementation class productdiscriptionservlet
 */
@WebServlet("/productdiscriptionservlet")
public class productdiscriptionservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public productdiscriptionservlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		
		Dao_Customer m=new Dao_Customer();
	      int pid =Integer.parseInt(request.getParameter("pid"));
        
    
 	      ArrayList<MY_BEAN> list= m.ProductDriscption(pid);
 	   RequestDispatcher rd=request.getRequestDispatcher("Productdiscription.jsp");
 	   request.setAttribute("LIST", list);
		  //  request.setAttribute("msg","product: "+eid+ " deleted Successfully..");
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
