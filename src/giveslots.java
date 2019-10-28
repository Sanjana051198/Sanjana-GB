

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class giveslots
 */
@WebServlet("/giveslots")
public class giveslots extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public giveslots() {
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
		String docname=request.getParameter("docname");
		String date=request.getParameter("date");
		String t=request.getParameter("time");
		/*SimpleDateFormat formatter = new SimpleDateFormat("yyyy/MM/dd");  
	    String strdate= formatter.format(date); */
		try
		{
			Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
			Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/hospitalmanagement","root","root@123");
			PreparedStatement statementb = connection.prepareStatement("select * from doctor WHERE doctorname=?") ;
			statementb.setString(1,docname);
			ResultSet rsb=statementb.executeQuery() ;
			String docid=rsb.getString(2);			
			PreparedStatement statement0 = connection.prepareStatement("SELECT * from appointment WHERE docid=? AND timeslotappoint=? AND dateappoint=? AND (bookedappoint=? OR bookedappoint=?) ");
			statement0.setString(3,date);
			statement0.setString(2,t);
			statement0.setString(1,docid);
			statement0.setString(4,"No");
			statement0.setString(5,"Yes");
			ResultSet rs0=statement0.executeQuery() ;
			
			boolean empty = true;
			if( rs0.next() ) {
			    empty = false;
			}		
			
			if(empty)
			{
			PreparedStatement statement1 = connection.prepareStatement("INSERT INTO appointment(docid,timeslotappoint,dateappoint,patid,bookedappoint)"
					+ " VALUES(?,?,?,?,?)") ;
			statement1.setString(3,date);
			statement1.setString(2,t);
			statement1.setString(1,docid);
			statement1.setString(4,null);
			statement1.setString(5,"No");			
			statement1.executeUpdate() ;
			
			statement1.close();
			}	
			
			
			connection.close();
 		}
       	 catch(Exception e)
       	 {
            
            out.println("wrong entry"+e);
       	 }
		response.sendRedirect("giveslots.jsp");
	}

}
