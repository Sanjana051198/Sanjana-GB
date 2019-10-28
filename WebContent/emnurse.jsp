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
<form action="emnursej" method="post">
	<table>
<%@ page import=" com.mongodb.MongoClient" %> 
<%@ page import=" com.mongodb.DBCollection" %> 
<%@ page import=" com.mongodb.DBCursor" %> 
<%@ page import=" com.mongodb.DB" %>
<%
try
{
	MongoClient mongoclient=new MongoClient("localhost",27017);
	DB db =mongoclient.getDB("hmmd");
	DBCollection emergency=db.getCollection("emergency");
	DBCursor cur=emergency.find();
	
	while(cur.hasNext())
	{
		
		String id=cur.next().get("pid").toString();
		String complain=cur.curr().get("complain").toString();%>
		
		<tr>
		<td>Patient Id : </td>
		<td><input type="checkbox" name="pid" value=<%=id%>><%=id%></td>
		</tr>
		<tr>
		<td>Complain : </td>
		<td><input type="text" name="complain" value=<%=complain%>></td>
		</tr>
		
	<%}
	
	mongoclient.close();
}
catch(Exception e)
{
	out.println("wrong entry"+e);
}
%> 
			<tr>
			<td>	<input type="submit" value="Submit"></td>
			</tr>
			</table>
	</form><br><br>
	<a href="http://localhost:8080/HospitalManagement/emnurselogin.jsp">LOGOUT</a><br/>
</body>
</html>