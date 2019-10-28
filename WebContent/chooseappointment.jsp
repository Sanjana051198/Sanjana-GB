<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body background="C:\Users\gvsan\Desktop\Hospital.jpg">
	<% String doctor=request.getParameter("doctor"); %>
	<%String patname=request.getParameter("patname"); 
	int i=0;%>
	<form action="chooseappoint" method="post">	
	<table>
	<tr>
	<td>Patient:</td>
	<td><input type="text" name="patname" value=<%=patname %>></td>
	</tr>
	<tr>
	<td>Doctor:</td>
	<td><input type="text" name="doctor" value=<%=doctor%>></td>
	</tr><br><br>

		Time,Date :
		<select name="datetime">	
		<option>Date Time</option>
		<%@ page import="java.sql.*" %>
		<%@ page import="javax.sql.*" %>
		<% try
		{			
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/hospitalmanagement","root","root@123");
			PreparedStatement statement0 = connection.prepareStatement("select * from doctor WHERE doctorname=?") ;
			statement0.setString(1,doctor);
			ResultSet rs0=statement0.executeQuery() ;
			String docid=rs0.getString(2);
			PreparedStatement statement = connection.prepareStatement("select * from appointment WHERE docid=? AND bookedappoint=?") ;
			statement.setString(1,docid);
			statement.setString(2,"No");
			ResultSet rs=statement.executeQuery() ;
			String appointtime;
			String appointdate;
			while(rs.next())
			{
				appointtime=rs.getString(2);
				appointdate=rs.getString(3);
				i++;
				%>
				
            	<option value=<%=Integer.toString(i)%>><%= appointtime %>,<%=appointdate%></option>
            	
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
		<tr>
		<td><input type="submit" value="Submit"></td>
		</tr>
		</table>	
	</form><br><br>
	<a href="http://localhost:8080/HospitalManagement/appointment.jsp">BACK</a><br/>
	<a href="http://localhost:8080/HospitalManagement/patientlogin.jsp">Log Out</a><br/>
</body>
</html>