

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
 * Servlet implementation class adddoc
 */
@WebServlet("/adddoc")
public class adddoc extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public adddoc() {
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
		String type=request.getParameter("type");
		String name=request.getParameter("doctorname");
		String userid=request.getParameter("userid");
		String age=request.getParameter("age");
		String sex=request.getParameter("sex");
		String address=request.getParameter("adress");
		long phone=Long.parseLong(request.getParameter("phoneno"));
		String email=request.getParameter("email");
		String department=request.getParameter("department");
		String quali=request.getParameter("qualification");
		String password=request.getParameter("password");
		String yop=request.getParameter("yop");
		out.println("hi");
		try
		{
			Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
			Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/hospitalmanagement","root","root@123");
			if(type=="ne")
			{
			PreparedStatement statement = connection.prepareStatement("INSERT INTO doctor(doctornamedoc,useriddoc,passworddoc,branchdoc,qualificationdoc,phonenumdoc,agedoc,sexdoc,addressdoc,yearspracticedoc,emaildoc)"
					+ " VALUES(?,?,?,?,?,?,?,?,?,?,?)") ;
			statement.setString(1,name);
			statement.setString(2,userid);
			statement.setString(3,password);
			statement.setString(4,department);
			statement.setString(5,quali);
			statement.setString(8,sex);
			statement.setString(11,email);
			statement.setString(9,address);
			statement.setLong(6,phone);
			statement.setString(7,age);
			statement.setString(10,yop);
			statement.executeUpdate() ;	
			
			statement.close();
			connection.close();
			}
			else if(type=="e")
			{
				PreparedStatement statement = connection.prepareStatement("INSERT INTO edoctor(edocname,edocphone,edocpassword,edocage,edocsex,edocaddress,edocemail,edocid)"
						+ " VALUES(?,?,?,?,?,?,?,?)") ;
				statement.setString(1,name);
				statement.setString(8,userid);
				statement.setString(3,password);
				statement.setString(5,sex);
				statement.setString(7,email);
				statement.setString(6,address);
				statement.setLong(2,phone);
				statement.setString(4,age);
				statement.executeUpdate() ;	
				
				statement.close();
				connection.close();
			}

			
 		}
       	 catch(Exception e)
       	 {
            
            out.println("wrong entry"+e);
       	 }
		response.sendRedirect("adddoctor.jsp");
	}

}
