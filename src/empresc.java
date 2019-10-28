

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
 * Servlet implementation class empresc
 */
@WebServlet("/empresc")
public class empresc extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public empresc() {
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
		String name=request.getParameter("name");
		String stdate=request.getParameter("stdate");
		String endate=request.getParameter("endate");
		String mediname=request.getParameter("mediname");
		String ail=request.getParameter("ail");
		String detail=request.getParameter("detail");
		try
		{
			Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
			Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/hospitalmanagement","root","root@123");
			PreparedStatement statementa = connection.prepareStatement("select * from patient WHERE patientnamepat=?") ;
			statementa.setString(1,name);
			ResultSet rsa=statementa.executeQuery() ;
			String patid=rsa.getString(2);
			PreparedStatement statement = connection.prepareStatement("INSERT INTO prescription(patid,startdatepresc,enddatepresc,typediseasepresc,medid,prescdetail)"
					+ " VALUES(?,?,?,?,?,?)") ;
			statement.setString(1,patid);
			statement.setString(2,stdate);
			statement.setString(3,endate);
			statement.setString(4,ail);
			statement.setString(5,mediname);
			statement.setString(6,detail);
			statement.executeUpdate() ;	

			statement.close();
			connection.close();
 		}
       	 catch(Exception e)
       	 {
            
            out.println("wrong entry"+e);
       	 }
		response.sendRedirect("emdoc.jsp");

	}

}
