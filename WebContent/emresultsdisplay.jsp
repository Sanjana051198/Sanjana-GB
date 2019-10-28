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
<table>
<%String pid=request.getParameter("pid"); %>
<%@ page import=" com.mongodb.MongoClient" %> 
<%@ page import=" com.mongodb.DBCollection" %> 
<%@ page import=" com.mongodb.DBCursor" %> 
<%@ page import=" com.mongodb.DB" %>
<%@ page import=" com.mongodb.BasicDBObject" %>
<%
try
{
	MongoClient mongoclient=new MongoClient("localhost",27017);
	DB db =mongoclient.getDB("hmmd");
	String text;
	DBCollection emergency=db.getCollection("emergency");
	BasicDBObject obj=new BasicDBObject("pid",pid);
	DBCursor cur=emergency.find(obj);
	
	while(cur.hasNext())
	{
		String result=cur.next().get("em").toString();
		if(result.equalsIgnoreCase("yes"))
		{
			text="Please do visit the hospital";
		}
		else 
		{
			text="Not required to visit the hospital,but if symptoms persist pleae do visit";
		}
		%>
		
		<tr>
		<td>Result : </td>
		<td><input type="text" name="result" size="50" value=<%=text%>></td>
		</tr>
		
	<%}
	
	mongoclient.close();
	}
	catch(Exception e)
	{
		out.println("wrong entry"+e);
	}
%>			
</table>
<br><br>
<a href="http://localhost:8080/HospitalManagement/emresults.jsp">BACK</a><br/>
</body>
</html>