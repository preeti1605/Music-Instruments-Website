<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<%
String name=request.getParameter("name");
String id=request.getParameter("id");
String email=request.getParameter("email");
String password=request.getParameter("password");
String cpassword=request.getParameter("cpassword");

try
{
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/MySQL", "root", "mysqlrootuser@1234");
Statement st=conn.createStatement();

st.executeUpdate("insert into SIGNUP2(name,id,email,password,cpassword)values('"+name+"','"+id+"','"+email+"','"+password+"','"+cpassword+"')");
%>  
<jsp:forward page ="Home.html" />
<%
}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
%>
