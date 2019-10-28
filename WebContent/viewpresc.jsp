<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body background="C:\Users\gvsan\Desktop\Hospital.jpg">
	<%@ page import="java.sql.*" %>
		<%@ page import="javax.sql.*" %>
		<% String name=request.getParameter("name");
		   String dat=request.getParameter("date");
		   
		try
		{
			Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
			Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/hospitalmanagement","root","root@123");
			PreparedStatement statement0 = connection.prepareStatement("select * from patient WHERE patientnamepat=?") ;
			statement0.setString(1,name);
			ResultSet rs0=statement0.executeQuery() ;
			String patid=rs0.getString(2);
			PreparedStatement statement = connection.prepareStatement("SELECT * from prescription WHERE patid=? AND startdatepresc=?") ;
			statement.setString(1,patid);
			statement.setString(2,dat);
			ResultSet rs=statement.executeQuery() ;	
			
			rs.next();
			String medi_name=rs.getString(5);
			String enddate=rs.getString(3);
			String prescdetail=rs.getString(6);
			 %>
			
			<form action="checkprescription.jsp" method="post">
			<table>
			<tr>
			<td>MedicineName :</td><td><input type="text"  value=<%=medi_name %>></td>
			</tr>
			<tr>
			<td>Start date :</td><td><input type="text"  value=<%=dat %>></td>
			</tr>
			<tr>
			<td>End date :</td><td><input type="text"  value=<%=enddate %>></td>
			</tr>
			<tr>
			<td>Detail :</td><td><input type="text"  value=<%=prescdetail %>></td>
			</tr>
			<tr>		
			<td>Done :<input type="submit" value="Submit"></td>
			</tr>
			</table>
		    </form>
			
			<% statement.close();
			connection.close();
 		}
       	 catch(Exception e)
       	 {
            
            out.println("wrong entry"+e);
       	 } %><br><br>
	<a href="http://localhost:8080/HospitalManagement/patient.jsp">BACK</a><br/>
	<a href="http://localhost:8080/HospitalManagement/patientlogin.jsp">Log Out</a><br/>
	
</body>
</html>