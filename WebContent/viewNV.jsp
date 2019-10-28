<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body background="C:\Users\gvsan\Desktop\Hospital.jpg">
	<% String name=request.getParameter("name"); %>
	<%@ page import="java.sql.*" %>
		<%@ page import="javax.sql.*" %>
		<% 
		try
		{
			Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
			Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/hospitalmanagement","root","root@123");
			PreparedStatement statement0 = connection.prepareStatement("select * from patient WHERE patientnamepat=?") ;
			statement0.setString(1,name);
			ResultSet rs0=statement0.executeQuery() ;
			String patid=rs0.getString(2);
			PreparedStatement statement = connection.prepareStatement("SELECT * from nextvisit WHERE patid=?") ;
			statement.setString(1,patid);
			ResultSet rs=statement.executeQuery() ;	
			
			rs.next();
			String docid=rs.getString(3);
			String date=rs.getString(1);
			String time=rs.getString(2);
			String purpose=rs.getString(5);
			
			PreparedStatement statement1 = connection.prepareStatement("select * from doctor WHERE useriddoc=?") ;
			statement1.setString(1,docid);
			ResultSet rs1=statement0.executeQuery() ;
			String doctorname=rs1.getString(1);
			%>
			
			<form action="patient.jsp" method="post">
			<table>
			<tr>
			<td>DoctorName :<td><input type="text" name="docotorname" value=<%=doctorname %>></td>
			</tr>
			<tr>
			<td>Date :</td><td><input type="text" name="date" value=<%=date %>></td>
			</tr>
			<tr>
			<td>Time :</td><td><input type="text" name="time" value=<%=time %>></td>
			</tr>
			<tr>
			<td>Purpose :</td><td><input type="text" name="purpose" value=<%=purpose %>></td>
			</tr>
			<tr>		
			<td>Done :</td><td><input type="submit" value="Submit"></td>
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