

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.mongodb.MongoClient;
import com.mongodb.DBCollection;
import com.mongodb.DBCursor;
import com.mongodb.DBObject;
import com.mongodb.BasicDBObject;
import com.mongodb.DB;
import java.text.DateFormat;
import java.text.SimpleDateFormat;

/**
 * Servlet implementation class emtriage
 */
@WebServlet("/emtriage")
public class emtriage extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public emtriage() {
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
		PrintWriter out=response.getWriter();
		long millis=System.currentTimeMillis();  
	    java.sql.Date date=new java.sql.Date(millis);
	    DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");  
	    String strDate = dateFormat.format(date);
		String phone=request.getParameter("phone");
		String complain=request.getParameter("complain");
		
		try
		{
			MongoClient mongoclient=new MongoClient("localhost",27017);
			DB db =mongoclient.getDB("hmmd");
			DBCollection emergency=db.getCollection("emergency");
			BasicDBObject obj=new BasicDBObject();
			obj.put("pid", phone+strDate);
			obj.put("complain", complain);
			obj.put("em", "NA");
			emergency.insert(obj);
			
			mongoclient.close();
		}
		catch(Exception e)
		{
			out.println("wrong entry"+e);
		}
		response.sendRedirect("emserlogin.jsp");
		
	}

}
