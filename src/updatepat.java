

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class updatepat
 */
@WebServlet("/updatepat")
public class updatepat extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public updatepat() {
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
		String name=request.getParameter("patientname");
		String userid=request.getParameter("userid");
		String age=request.getParameter("age");
		String sex=request.getParameter("sex");
		String address=request.getParameter("adress");
		long phone=Long.parseLong(request.getParameter("phoneno"));
		String email=request.getParameter("email");
		String doctor=request.getParameter("doctor");
		String purpose=request.getParameter("purpose");
		String password=request.getParameter("password");
		try
		{
			Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
			Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/hospitalmanagement","root","root@123");
			PreparedStatement statement = connection.prepareStatement("UPDATE patient set patientnamepat=?,useridpat=?,passwordpat=?,curdoctorpat=?,curpurposepat=?,sexpat=?,emailpat=?,"
					+ "addresspat=?,phonenumpat=?,agepat=? WHERE patientnamepat=?") ;
			statement.setString(1,name);
			statement.setString(11,name);
			statement.setString(2,userid);
			statement.setString(3,password);
			statement.setString(4,doctor);
			statement.setString(5,purpose);
			statement.setString(6,sex);
			statement.setString(7,email);
			statement.setString(8,address);
			statement.setLong(9,phone);
			statement.setString(10,age);
			statement.executeUpdate() ;	

			statement.close();
			connection.close();
 		}
       	 catch(Exception e)
       	 {
            
            out.println("wrong entry"+e);
       	 }
		response.sendRedirect("updatepatient.jsp");
	}

}
