package Admin;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.util.Iterator;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 * Servlet implementation class UploadProduct
 */
@WebServlet("/UploadProduct")
public class UploadProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
	
	private String filePath;
	   private int maxFileSize = 1000 * 4096;
	   private int maxMemSize = 1000 * 4096;
	   private File file ;	
	
    public UploadProduct() {
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
		response.setContentType("text/html");
		  PrintWriter out = response.getWriter();
		 
		  boolean isMultipart = ServletFileUpload.isMultipartContent(request);//true
 
		  if( !isMultipart ){
        return;
 }
		  
 DiskFileItemFactory factory = new DiskFileItemFactory();
 // maximum size that will be stored in memory
 factory.setSizeThreshold(maxMemSize);
 // Location to save data that is larger than maxMemSize.
  // Create a new file upload handler
 ServletFileUpload upload = new ServletFileUpload(factory);
 // maximum file size to be uploaded.
 upload.setSizeMax( maxFileSize );

 try{
 // Parse the request to get file items.
 List fileItems = upload.parseRequest(request);  //formfied-2    Non FormField-1

 // Process the uploaded file items
 Iterator i = fileItems.iterator();
String category=null;
 String productname=null;
 String productprice=null;
 String productdesc=null;
 String filename=null;
 
 while ( i.hasNext())
 {

    FileItem fi = (FileItem)i.next();
    if ( fi.isFormField () )
    {
       // Get the uploaded file parameters
      String  fieldName = fi.getFieldName();
      if(fieldName.equals("category"))
      {
 	  category=fi.getString();
       System.out.println(category);
      }
      if(fieldName.equals("pname"))
        {
   	  productname=fi.getString();
         System.out.println(productname);
        }
      if(fieldName.equals("price"))
      {
   	   productprice=fi.getString();
       System.out.println(productprice);
      }
      if(fieldName.equals("des"))
      {
   	   productdesc=fi.getString();
       System.out.println(productprice);
      }
    }
    else
     {    
   	 String fieldName = fi.getFieldName();

       if(fieldName.equals("file"))
       {
        ServletConfig sc=getServletConfig();
       // String field=fi.getString();
       // String contentType = fi.getContentType();
        filename=fi.getName();
         //boolean isInMemory = fi.isInMemory();
         //long sizeInBytes = fi.getSize();

         //create folder
         File f = new File(sc.getServletContext().getRealPath("/")+"imgupload/") ;
            if(!f.exists())
           	 f.mkdir();
         // Write the file
            long l=System.currentTimeMillis();//1 jan 1970 00:00 AM ---->till  ms 8574389573498734
            System.out.println(l);		
  		String s=l+"";
  		String sub=s.substring(8);
         file = new File(sc.getServletContext().getRealPath("/")+"imgupload/"+sub+filename) ;
          fi.write( file ) ;
          filename=file.getName();
          out.println("Uploaded Filename: " +filename + "<br>");
       System.out.println("PATH="+file.getPath());
       }
    }
 }


 try {
	    Class.forName("com.mysql.jdbc.Driver");
		Connection	 con=DriverManager.getConnection("jdbc:mysql://localhost:3306/foodecom","root","root");

	  PreparedStatement ps=con.prepareStatement("insert into itemcollection(Category,Product_name,price,Discription,image) value(?,?,?,?,?)");//placeholder
	  ps.setString(1, category); 
	  ps.setString(2,productname);
	    ps.setString(3,productprice);
	    ps.setString(4,productdesc);
	    ps.setString(5,filename);
	    int y=0;y=ps.executeUpdate();
	    if(y!=0)
	    {
	    	RequestDispatcher rd=request.getRequestDispatcher("productadd.jsp");
		request.setAttribute("msg","uploaded successfully...");
		rd.forward(request,response);
	    	//out.println("uploaded successfully...");
       
	    }
	    
	    con.close();
 }catch(Exception e)
 {
	  System.out.println(e);
 }


}catch(Exception ex)
{
   ex.printStackTrace();
  System.out.println(ex);
}

	
	
	
	}



	

	}


