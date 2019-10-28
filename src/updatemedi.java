

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
 * Servlet implementation class updatemedi
 */
@WebServlet("/updatemedi")
public class updatemedi extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public updatemedi() {
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
		String name=request.getParameter("medicinename");
		String price=request.getParameter("price");
		String alternative=request.getParameter("alternative");
		String quantity=request.getParameter("quantity");
		String purpose=request.getParameter("purpose");
		
		try
		{
			Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
			Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/hospitalmanagement","root","root@123");
			PreparedStatement statement = connection.prepareStatement("UPDATE pharma SET medicinenamepharma=?,availibilitypharma=?,priceperunitpharma=?,alternativepharma=?,medpurposepharma=?"
				+"WHERE medicinenamepharma=?") ;
			statement.setString(1,name);
			statement.setString(2,quantity);
			statement.setString(3,price);
			statement.setString(4,alternative);
			statement.setString(5,purpose);
			statement.setString(6,name);
			
			statement.executeUpdate() ;	

			statement.close();
			connection.close();
 		}
       	 catch(Exception e)
       	 {
            
            out.println("wrong entry"+e);
       	 }
		response.sendRedirect("updatemedicine.jsp");
	}

}
