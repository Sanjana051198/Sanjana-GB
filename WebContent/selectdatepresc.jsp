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
<form action="viewpresc.jsp">
<table>

	<%String name=request.getParameter("name"); %>
<tr>
	<td><input type="text" name="name" value=<%=name %>></td>
	</tr>
	<tr>
	<td>Date :</td>
	<td><select name="date">
		
		<%@ page import="java.sql.*" %>
		<%@ page import="javax.sql.*" %>
		<% try
		{	
			
			%><option >Date</option><%
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/hospitalmanagement","root","root@123");
			PreparedStatement statement0 = connection.prepareStatement("select * from patient WHERE patientnamepat=?") ;
			statement0.setString(1,name);
			ResultSet rs0=statement0.executeQuery() ;
			String patid=rs0.getString(2);
			PreparedStatement statement = connection.prepareStatement("select * from prescription WHERE patid=?") ;
			statement.setString(1,patid);
			ResultSet rs=statement.executeQuery() ;
			String date;
			while(rs.next())
			{
				date=rs.getString(2);%>
				
            	<option value=<%=date%> ><%= date %></option>
        	<% } 
			statement.close();
			connection.close();
 		}
       	 catch(Exception e)
       	 {
             out.println("wrong entry"+e);
       	 } %>
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