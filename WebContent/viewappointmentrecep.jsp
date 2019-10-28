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
		<% String patname=request.getParameter("name");
		String date=request.getParameter("date");
		try
		{
			Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
			Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/hospitalmanagement","root","root@123");
			PreparedStatement statement0 = connection.prepareStatement("select * from patient WHERE patientnamepat=?") ;
			statement0.setString(1,patname);
			ResultSet rs0=statement0.executeQuery() ;
			String patid=rs0.getString(2);
			PreparedStatement statement = connection.prepareStatement("SELECT * from appointment WHERE patid=? AND dateappoint=?") ;
			statement.setString(1,patid);
			statement.setString(2,date);
			ResultSet rs=statement.executeQuery() ;	%>
			<table>
			<tr>
			<td>Doctor Name</td>
			<td>Date</td>
			<td>Time</td>
			</tr>
			
			<% while(rs.next())
			{
			String docname=rs.getString(1);
			String date1=rs.getString(3);
			String time=rs.getString(2);
			 %>
			 <tr>
			<td><%=docname %></td><td></td>
			<td><%=date1 %></td><td></td>
			<td><%=time %></td><td></td>
			</tr>
			<% }%>
			</table>
			<%
		 statement.close();
			connection.close();
 		}
  	 catch(Exception e)
  	 {
        out.println("wrong entry"+e);
  	 } %>
  	 
  </form><br><br>
  	
	<a href="http://localhost:8080/HospitalManagement/recep.jsp">BACK</a><br/>
	<a href="http://localhost:8080/HospitalManagement/receplogin.jsp">Log Out</a><br/>
	
</body>
</html>