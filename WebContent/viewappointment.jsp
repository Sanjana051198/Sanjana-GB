<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body background="C:\Users\gvsan\Desktop\Hospital.jpg">
<form >
	<%@ page import="java.sql.*" %>
		<%@ page import="javax.sql.*" %>
		<% String docname=request.getParameter("name");
		try
		{
			Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
			Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/hospitalmanagement","root","root@123");
			PreparedStatement statement0 = connection.prepareStatement("select * from doctor WHERE doctorname=?") ;
			statement0.setString(1,docname);
			ResultSet rs0=statement0.executeQuery() ;
			String docid=rs0.getString(2);
			PreparedStatement statement = connection.prepareStatement("SELECT * from appointment WHERE docid=? AND bookedappoint=?") ;
			statement.setString(1,docid);
			statement.setString(2,"Yes");
			ResultSet rs=statement.executeQuery() ;	%>
			
			<tr>
			<td>Patient Name</td>
			<td>Date</td>
			<td>Time</td>
			</tr><br>
			
			<% while(rs.next())
			{
			String patname=rs.getString(6);
			Date date=rs.getDate(3);
			String time=rs.getString(2);
			 %>
			 <tr>
			<td><%=patname %></td>
			<td><%=date %></td>
			<td><%=time %></td>
			</tr><br>
			<% }
			
		 statement.close();
			connection.close();
 		}
  	 catch(Exception e)
  	 {
        out.println("wrong entry"+e);
  	 } %>
  	 
  </form><br><br>
	<a href="http://localhost:8080/HospitalManagement/doctor.jsp">BACK</a><br/>
	<a href="http://localhost:8080/HospitalManagement/doctorlogin.jsp">Log Out</a><br/>
</body>
</html>