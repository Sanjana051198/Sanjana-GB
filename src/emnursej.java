

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mongodb.BasicDBObject;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.DBObject;
import com.mongodb.MongoClient;

/**
 * Servlet implementation class emnursej
 */
@WebServlet("/emnursej")
public class emnursej extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public emnursej() {
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
		String[] pid = request.getParameterValues("pid");
		try
		{
		MongoClient mongoclient=new MongoClient("localhost",27017);
		DB db =mongoclient.getDB("hmmd");
		DBCollection emergency=db.getCollection("emergency");		
		for(int i=0;i<pid.length;i++)
		{
			    BasicDBObject ud=new BasicDBObject();
			    ud.append("$set",new BasicDBObject().append("em", "yes"));
			    BasicDBObject od=new BasicDBObject("pid",pid[i]);
				emergency.update(od,ud,false,false);			
				
		}
		mongoclient.close();
		}
			catch(Exception e)
			{
				out.println("wrong entry"+e);
			}
		response.sendRedirect("emnurse.jsp");
		
	}

}
