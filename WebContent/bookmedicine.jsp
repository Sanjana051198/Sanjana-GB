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
	<form action="bookmedi.jsp" >
	<table>
	<tr>
		<td>Name   :</td>
		<td><input type="text" name="name"></td>
		</tr>
		<tr>
		<td>Purpose:</td>
		<td><select name="purpose">
		<%@ page import="java.sql.*" %>
		<%@ page import="javax.sql.*" %>
		<% try
		{
			%><option >Purpose</option>
			
			<% Class.forName("com.mysql.jdbc.Driver").newInstance();
			Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/hospitalmanagement","root","root@123");
			Statement statement = connection.createStatement() ;
			ResultSet rs=statement.executeQuery("select * from pharma") ;
			String purpose;
			while(rs.next())
			{
				purpose=rs.getString(5); 			
				
            	%> <option value=<%=purpose%> ><%= purpose %></option>
        	<% } 
			statement.close();
			connection.close();
 		}
       	 catch(Exception e)
		{
             out.println("wrong entry"+e);
		}
      %>		
		</select></td>
		</tr>
		<tr>
		<td><input type="submit" value="Submit"></td>
		</tr>
		</table>		
	</form><br><br>
	<a href="http://localhost:8080/HospitalManagement/patient.jsp">BACK</a><br/>
	<a href="http://localhost:8080/HospitalManagement/patientlogin.jsp">Log Out</a><br/>
	
</body>

</html>