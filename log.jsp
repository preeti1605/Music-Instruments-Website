<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>


<%
String id=request.getParameter("id");
session.putValue("id",id);
String password=request.getParameter("password");
Class.forName("com.mysql.jdbc.Driver");
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/MySQL","root","mysqlrootuser@1234");
Statement st= con.createStatement();
ResultSet rs=st.executeQuery("select * from SIGNUP2 where id='"+id+"' and password='"+password+"'");
try{
rs.next();
if(rs.getString("id").equals(id)&&rs.getString("password").equals(password))
{%>  
   <jsp:forward page ="Home.html" />
 <%
}
else{
 out.println("Invalid password or username.");
}
}
catch (Exception e) {}
%> 
