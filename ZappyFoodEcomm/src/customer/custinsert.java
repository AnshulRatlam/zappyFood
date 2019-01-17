package customer;

import java.io.IOException;
//import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Bean.Bean_Customer;
import dao.Dao_Customer;




/**
 * Servlet implementation class custinsert
 */
@WebServlet("/custinsert")
public class custinsert extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public custinsert() {
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
		String fname=request.getParameter("fname");
		String lname = request.getParameter("lname");
		String address=request.getParameter("Add");
		String mob=request.getParameter("mobile");
		String email=request.getParameter("email");
		String pass=request.getParameter("password");
		
		Bean_Customer b = new Bean_Customer();
		
		
		//b.setEid(Integer.parseInt(eid));
		b.setFname(fname);
		b.setLname(lname);
		b.setAdd(address);
		b.setMobile(Long.parseLong(mob));
		b.setPassw(pass);
		b.setEmail(email);
		//b.setSalary(Double.parseDouble(sal));
		//b.setAddress(add);

		Dao_Customer m = new Dao_Customer();
		int x= m.insertCustomer(b);
		
		if(x==1)
	         {
			 
	        	 RequestDispatcher rd=request.getRequestDispatcher("custsignup.jsp");
                request.setAttribute("msg", "Data Inserted Successfully...");
               rd.forward(request, response);
              //  PrintWriter out=response.getWriter();
  		    	 
	         
	         }
	         else
	         {
	        	 RequestDispatcher rd=request.getRequestDispatcher("custsignup.jsp");
             request.setAttribute("msg", "Data Not Inserted Successfully...");
            rd.forward(request, response);
	         }
			

	}
	}


