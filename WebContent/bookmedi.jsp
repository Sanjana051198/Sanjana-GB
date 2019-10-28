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
	<form action="bookMediBill.jsp" >
	<% String name=request.getParameter("name"); %>
	<% String purpose=request.getParameter("purpose"); %>
	<table>
	<tr>
		<td>Name   :</td>
		<td><input type="text" name="name" value=<%=name%>></td>
		</tr>
		<tr>
		<td>Medi Name:</td>
		<td><select name="medicinename">
		<%@ page import="java.sql.*" %>
		<%@ page import="javax.sql.*" %>
		<% try
		{
			%><option >Name</option>
			
			<% Class.forName("com.mysql.jdbc.Driver").newInstance();
			Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/hospitalmanagement","root","root@123");
			PreparedStatement statement = connection.prepareStatement("select * from pharma where medpurposepharma=?") ;
			statement.setString(1,purpose);
			ResultSet rs=statement.executeQuery() ;
			String medi;
			while(rs.next())
			{
				medi=rs.getString(1); 			
				
            	%> <option value=<%=medi%> ><%= medi %></option>
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
		<td>Quantity   :</td>
		<td><input type="text" name="quantity"></td>
		</tr>
		<tr>
		<td><input type="submit" value="Submit"></td>
		</tr>
		</table>		
	</form><br><br>
	<a href="http://localhost:8080/HospitalManagement/bookmedicine.jsp">BACK</a><br/>
	<a href="http://localhost:8080/HospitalManagement/patientlogin.jsp">Log Out</a><br/>
	
</body>

</html>