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
	Update Details
	<%@ page import="java.sql.*" %>
	<%@ page import="javax.sql.*" %>
	<%
		String name=request.getParameter("name");
	try
	{
		Class.forName("com.mysql.jdbc.Driver").newInstance();
		Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/hospitalmanagement","root","root@123");
		PreparedStatement statement = connection.prepareStatement("select * from doctor where doctornamedoc=?") ;
		statement.setString(1,name);
		ResultSet rs=statement.executeQuery();
		
		rs.next();
		name=rs.getString(1);
		String userid=rs.getString(2);
		String age=rs.getString(7);
		String sex=rs.getString(8);
		String address=rs.getString(9);
		long phone=Long.parseLong(rs.getString(6));
		String email=rs.getString(11);
		String department=rs.getString(4);
		String quali=rs.getString(5);
		String password=rs.getString(3);
		String yop=rs.getString(10);
		%>
		
		<form action="updatedoc" method="post">
		Name   :<input type="text" name="doctorname" value=<%=name%>><br><br>
		UserId :<input type="text" name="userid" value=<%=userid%>><br><br>
		Age    :<input type="text" name="age" value=<%=age%>><br><br>
		Sex    :<input type="text" name="sex" value=<%=sex%>><br><br>
		Address:<input type="text" name="address" value=<%=address%>><br><br>
		Phone  :<input type="text" name="phoneno" value=<%=phone%>><br><br>
		Email  :<input type="text" name="email" value=<%=email %>><br><br>
		Qualification :<input type="text" name="qualification" value=<%=quali%>><br><br>
		Years of practice :<input type="text" name="yop" value=<%=yop%>><br><br>
		Department:<br><br>
		<select name="department">
		<% try
		{
			%><option value=<%=department%>><%=department%></option>
			
			<% 
			Statement stat = connection.createStatement() ;
			ResultSet r=stat.executeQuery("select * from branches") ;
			String branch_name;
			while(r.next())
			{
				branch_name=r.getString(1); 			
				
            	%> <option value=<%=branch_name%> ><%= branch_name %></option>
        	<% } 
			
 		}
       	 catch(Exception e)
		{
             out.println("wrong entry"+e);
		}
      %>		
		</select><br><br>
		Password:<input type="password" name="password" value=<%=password%>><br>
		<input type="submit" value="Submit"><br><br>
		
		<%
		statement.close();
		connection.close();
		}
	catch(Exception e)
	{
	    out.println("wrong entry"+e);
	}
	
	 
	%>	
		
	</form><br><br>
	<a href="http://localhost:8080/HospitalManagement/updatedoctor.jsp">BACK</a><br/>
	<a href="http://localhost:8080/HospitalManagement/adminlogin.jsp">Log Out</a><br/>

</body>
</html>