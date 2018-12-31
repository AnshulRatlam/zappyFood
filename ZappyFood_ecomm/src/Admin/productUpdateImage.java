package Admin;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
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

import Bean.MY_BEAN;
import dao.my_dao;

/**
 * Servlet implementation class productUpdateImage
 */
@WebServlet("/productUpdateImage")
public class productUpdateImage extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private String filePath;
	   private int maxFileSize = 1000 * 4096;
	   private int maxMemSize = 1000 * 4096;
	   private File file ;	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public productUpdateImage() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String pid=request.getParameter("pid");
	    MY_BEAN e=new my_dao().getproductImageBypid(Integer.parseInt(pid));
	   
	    RequestDispatcher rd=request.getRequestDispatcher("UpdateProductImage.jsp");
		request.setAttribute("pid", e);
		rd.forward(request, response);
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
factory.setSizeThreshold(maxFileSize);
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

String filename=null;
String pid=null;
while ( i.hasNext())
{
	 
		
   FileItem fi = (FileItem)i.next();
   if ( fi.isFormField () )
   {
      // Get the uploaded file parameters
     String  fieldName = fi.getFieldName();
     if(fieldName.equalsIgnoreCase("pid"))
     {
	  pid=fi.getString();
      System.out.println(">>>>>>>>>>>>>>>>>>>>>."+pid);
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
    MY_BEAN b=new MY_BEAN();
	
	//b.setEid(Integer.parseInt(eid));
	
	b.setFilename(filename);
	
	b.setSno(Integer.parseInt(pid));
	
     my_dao m = new my_dao();
     
     int y = m.updateProductImage(b);
	    if(y!=0)
	    {
	    	RequestDispatcher rd=request.getRequestDispatcher("viewProduct");
       	 ArrayList<MY_BEAN> list= m.viewproduct();
		     request.setAttribute("LIST", list);
       	 request.setAttribute("msg", "Data Updated Successfully...");
          rd.forward(request, response);
	    	//out.println("uploaded successfully...");
      
	    }


}catch(Exception ex)
{
  ex.printStackTrace();
 System.out.println(ex);
}

	
	
	
	}



	

	}

