

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class deleteappointmentrecep
 */
@WebServlet("/deleteappointmentrecep")
public class deleteappointmentrecep extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public deleteappointmentrecep() {
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
		String patname=request.getParameter("name");
		String date=request.getParameter("date");
		String time=request.getParameter("time");
		try
		{
			Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
			Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/hospitalmanagement","root","root@123");
			PreparedStatement statementa = connection.prepareStatement("select * from patient WHERE patientnamepat=?") ;
			statementa.setString(1,patname);
			ResultSet rsa=statementa.executeQuery() ;
			String patid=rsa.getString(2);
			PreparedStatement statement = connection.prepareStatement("DELETE from appointment WHERE patid=? AND dateappoint=? AND timeslotappoint=?") ;
			statement.setString(1,patid);
			statement.setString(2,date);
			statement.setString(3,time);
			statement.executeUpdate() ;	
			PreparedStatement statement1 = connection.prepareStatement("DELETE from nextvisit WHERE patid=? AND datenv=? AND timenv=?") ;
			statement1.setString(1,patid);
			statement1.setString(2,date);
			statement1.setString(3,time);
			statement1.executeUpdate() ;	

			statement.close();
			connection.close();
 		}
       	 catch(Exception e)
       	 {
            
            out.println("wrong entry"+e);
       	 }
		response.sendRedirect("deleteappointrecep.jsp");
	}

}
