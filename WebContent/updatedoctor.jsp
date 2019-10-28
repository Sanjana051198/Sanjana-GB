<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body background="C:\Users\gvsan\Desktop\Hospital.jpg">
<br><br><br><br><br>
	<form action="updateDoc.jsp">
		<select name="name">
		<%@ page import="java.sql.*" %>
		<%@ page import="javax.sql.*" %>
		<% try
		{
			%><option >Doctor</option>
			
			<% Class.forName("com.mysql.jdbc.Driver").newInstance();
			Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/hospitalmanagement","root","root@123");
			Statement statement = connection.createStatement() ;
			ResultSet rs=statement.executeQuery("select * from doctor") ;
			String doctor_name;
			while(rs.next())
			{
				doctor_name=rs.getString(1); 			
				
            	%> <option value=<%=doctor_name%> ><%= doctor_name %></option>
        	<% } 
			statement.close();
			connection.close();
 		}
       	 catch(Exception e)
		{
             out.println("wrong entry"+e);
		}
      %>		
		</select><br><br>

		<input type="submit" value="Submit">
	</form><br><br>
	<a href="http://localhost:8080/HospitalManagement/admin.jsp">BACK</a><br/>
	<a href="http://localhost:8080/HospitalManagement/adminlogin.jsp">Log Out</a><br/>

</body>
</html>