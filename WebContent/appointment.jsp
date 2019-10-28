<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body background="C:\Users\gvsan\Desktop\Hospital.jpg">
	<form action="chooseappointment.jsp" method="get">
	<%String patname=request.getParameter("name"); %>
	<input type="text" name="patname" value=<%=patname %>><br><br>
		Doctor:<br><br>
		<select name="doctor">
		<%String branch=request.getParameter("department");
		%>
		<%@ page import="java.sql.*" %>
		<%@ page import="javax.sql.*" %>
		<% try
		{
			%><option >Doctor</option>
			
			<% Class.forName("com.mysql.jdbc.Driver").newInstance();
			Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/hospitalmanagement","root","root@123");
			PreparedStatement statement = connection.prepareStatement("select * from doctor WHERE branchdoc=?") ;
			statement.setString(1,branch);
			ResultSet rs=statement.executeQuery() ;
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
		
		<input type="submit" value="Submit"><br><br>
		
	</form><br><br>
	<a href="http://localhost:8080/HospitalManagement/bookappointment.jsp">BACK</a><br/>
	<a href="http://localhost:8080/HospitalManagement/patientlogin.jsp">Log Out</a><br/>
</body>
</html>