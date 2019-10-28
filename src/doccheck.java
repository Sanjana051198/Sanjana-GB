

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
 * Servlet implementation class doccheck
 */
@WebServlet("/doccheck")
public class doccheck extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public doccheck() {
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
		String username=request.getParameter("username");
		String password=request.getParameter("password");
		PrintWriter out=response.getWriter();
		
		try
		{
			Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
			Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/hospitalmanagement","root","root@123");
			PreparedStatement statement = connection.prepareStatement("SELECT * from doctor WHERE useriddoc=?") ;
			statement.setString(1,username);
			ResultSet rs=statement.executeQuery() ;	
			
			rs.next();
			String name=rs.getString(1);
			String user=rs.getString(2);
			String pass=rs.getString(3);
			
			if(user.equals(username)&&pass.equals(password))
				response.sendRedirect("doctor.jsp");
			else
				response.sendRedirect("doctorlogin.jsp");
			
			statement.close();
			connection.close();
 		}
       	 catch(Exception e)
       	 {
            
            out.println("wrong entry"+e);
       	 } 
	}

}
