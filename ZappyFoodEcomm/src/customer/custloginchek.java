package customer;

import java.io.IOException;
//import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.Dao_Customer;
//import dao.my_dao;

/**
 * Servlet implementation class custloginchek
 */
@WebServlet("/custloginchek")
public class custloginchek extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public custloginchek() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		
		String u=request.getParameter("name");
		String p=request.getParameter("psw");
		String ip=request.getRemoteAddr();
		// PrintWriter out = response.getWriter();
		Dao_Customer m=new Dao_Customer();
	  //   out.println(ip);
	     //System.out.print(ip);
	     int x=m.logincheck(u, p);
	     int y= m.cartupdate(u, ip);
	     

		if(x==1 || y==1)
		{
		   //Session code here
			HttpSession session=request.getSession();
			session.setAttribute("uid",u);
			response.sendRedirect("index.jsp");
			
		}
		else {
			RequestDispatcher rd=request.getRequestDispatcher("login.jsp");
			request.setAttribute("msg","Login fail try again...");
			rd.forward(request,response);
			  //response.sendRedirect("index.jsp");
		}
		
	}
	
	}


