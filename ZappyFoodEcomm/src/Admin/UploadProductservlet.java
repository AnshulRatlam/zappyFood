package Admin;

import java.io.IOException;
//import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Bean.MY_BEAN;
import dao.my_dao;

/**
 * Servlet implementation class UploadProductservlet
 */
@WebServlet("/UploadProductservlet")
public class UploadProductservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UploadProductservlet() {
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
		//PrintWriter out=response.getWriter();
		String pid=request.getParameter("pid");
		String productname=request.getParameter("pname");
		String productprice=request.getParameter("price");
		String productdesc=request.getParameter("des");
		String category = request.getParameter("category");
		
		MY_BEAN e=new MY_BEAN();
		e.setSno(Integer.parseInt(pid));
		e.setProductname(productname);
		e.setProductprice(Double.parseDouble(productprice));
		e.setProductdesc(productdesc);
		e.setCategory(category);
		
		   my_dao m=new my_dao();
			int x= m.updateproduct(e);
	         if(x==1)
	         {
	        	 RequestDispatcher rd=request.getRequestDispatcher("viewProduct");
	        	 ArrayList<MY_BEAN> list= m.viewproduct();
			     request.setAttribute("LIST", list);
	        	 request.setAttribute("msg", "Data Updated Successfully...");
               rd.forward(request, response);
	         }// out.println("<h1>Data Inserted</h1>");
			
			
	}
	}


