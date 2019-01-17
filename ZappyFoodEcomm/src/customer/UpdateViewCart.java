package customer;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.Dao_Customer;

/**
 * Servlet implementation class UpdateViewCart
 */
@WebServlet("/UpdateViewCart")
public class UpdateViewCart extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateViewCart() {
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
		
		
		String cid=request.getParameter("cid");
		String quantity = request.getParameter("q");
		PrintWriter out = response.getWriter();
		Dao_Customer d = new Dao_Customer();
		int x= d.updatecart(cid,quantity);
		HttpSession session = request.getSession();
		String user = (String)session.getAttribute("uid");
		 if(user==null)
			{
				user=request.getRemoteAddr();
			}
		 
		 int y = d.gtot(user);
		if(x==1)
		{
			System.out.println("sucess");
		}
		out.println(y);
	}

}
