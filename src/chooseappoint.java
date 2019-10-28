

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.*;
import java.text.*;
import java.sql.Time;
import java.sql.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class chooseappoint
 */
@WebServlet("/chooseappoint")
public class chooseappoint extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public chooseappoint() {
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
		String datetime=request.getParameter("datetime");
		String doctor=request.getParameter("doctor");
		String date = null;
		String time=null;
		int j=Integer.parseInt(datetime);
		int i=0;
		
		try
		{
			Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
			Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/hospitalmanagement","root","root@123");
			PreparedStatement statementa = connection.prepareStatement("select * from patient WHERE patientnamepat=?") ;
			statementa.setString(1,patname);
			ResultSet rsa=statementa.executeQuery() ;
			String patid=rsa.getString(2);
			PreparedStatement statementb = connection.prepareStatement("select * from doctor WHERE doctorname=?") ;
			statementb.setString(1,doctor);
			ResultSet rsb=statementb.executeQuery() ;
			String docid=rsb.getString(2);
			PreparedStatement statement = connection.prepareStatement("SELECT * from appointment WHERE docid=? AND bookedappoint=?") ;
			statement.setString(1,docid);
			statement.setString(2,"No");
			ResultSet rs=statement.executeQuery() ;	
			
			while(rs.next())
			{
				i++;
				if(i==j)
				{
					date=rs.getString(3);
					time=rs.getString(2);
				}
			}
			PreparedStatement statement1 = connection.prepareStatement("UPDATE appointment SET bookedappoint=?,patientid=? WHERE docid=? AND dateappoint=? AND timeslotappoint=? AND bookedappoint=?") ;
			statement1.setString(1,"Yes");
			statement1.setString(2,patid);
			statement1.setString(3,docid);
			statement1.setString(4,date);
			statement1.setString(5,time);
			statement1.setString(6,"No");
			statement1.executeUpdate() ;
			
			PreparedStatement statement2 = connection.prepareStatement("INSERT INTO nextvisit(datenv,timenv,docid,patid,purposenv)"
					+ " VALUES(?,?,?,?,?)") ;
			statement2.setString(1,date);
			statement2.setString(2,time);
			statement2.setString(3,docid);
			statement2.setString(4,patid);
			statement2.setString(5,"NA");			
			statement2.executeUpdate() ;
						
			statement.close();
			connection.close();
 		}
       	 catch(Exception e)
       	 {
            
            out.println("wrong entry"+e);
       	 } 
		
		response.sendRedirect("bookappointment.jsp");
	}

}
