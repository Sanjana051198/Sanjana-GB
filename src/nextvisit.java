

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.text.SimpleDateFormat;  

/**
 * Servlet implementation class nextvisit
 */
@WebServlet("/nextvisit")
public class nextvisit extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public nextvisit() {
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
		String patname=request.getParameter("patname");
		String docname=request.getParameter("docname");
		String purpose=request.getParameter("purpose");
		String date=request.getParameter("strdate");
		/*SimpleDateFormat formatter = new SimpleDateFormat("yyyy/MM/dd");  
	    String strdate= formatter.format(date); */
		String t=request.getParameter("time");
		
		try
		{
			Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
			Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/hospitalmanagement","root","root@123");
			PreparedStatement statementa = connection.prepareStatement("select * from patient WHERE patientnamepat=?") ;
			statementa.setString(1,patname);
			ResultSet rsa=statementa.executeQuery() ;
			String patid=rsa.getString(2);
			PreparedStatement statementb = connection.prepareStatement("select * from doctor WHERE doctorname=?") ;
			statementb.setString(1,docname);
			ResultSet rsb=statementb.executeQuery() ;
			String docid=rsb.getString(2);
			PreparedStatement statement = connection.prepareStatement("INSERT INTO nextvisit(datenv,timenv,docid,patid,purposenv)"
					+ " VALUES(?,?,?,?,?)") ;
			statement.setString(1,date);
			statement.setString(2,t);
			statement.setString(3,docid);
			statement.setString(4,patid);
			statement.setString(5,purpose);			
			statement.executeUpdate() ;
			
			PreparedStatement statement0 = connection.prepareStatement("SELECT * from appointment WHERE docid=? AND timeslotappoint=? AND dateappoint=? AND bookedappoint=?");
			statement0.setString(3,date);
			statement0.setString(2,t);
			statement0.setString(1,docid);
			statement0.setString(4,"No");			
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
			statement1.setString(4,patid);
			statement1.setString(5,"Yes");			
			statement1.executeUpdate() ;
			}
			else
			{
				PreparedStatement statement2 = connection.prepareStatement("SELECT * from appointment WHERE docid=? AND timeslotappoint=? AND dateappoint=? AND bookedappoint=?");
				statement2.setString(3,date);
				statement2.setString(2,t);
				statement2.setString(1,docid);
				statement2.setString(4,"Yes");			
				ResultSet rs2=statement2.executeQuery() ;
				
				boolean empty2 = true;
				if( rs2.next() ) {
				    empty2 = false;
				}
				
				if(empty2)
				{
					PreparedStatement statement3 = connection.prepareStatement("UPDATE appointment SET bookedappoint=?,patid=? WHERE docid=? AND timeslotappoint=? AND dateappoint=?");
					statement3.setString(5,date);
					statement3.setString(4,t);
					statement3.setString(3,docid);
					statement3.setString(2,patid);
					statement3.setString(1,"Yes");			
					statement3.executeUpdate() ;
					
				}
								
			}
			
			
			statement.close();
			connection.close();
 		}
       	 catch(Exception e)
       	 {
            
            out.println("wrong entry"+e);
       	 }
		response.sendRedirect("nextVisit.jsp");
	}

}
