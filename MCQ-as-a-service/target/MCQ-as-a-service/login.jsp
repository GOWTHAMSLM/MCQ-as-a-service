<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.sun.jersey.api.client.Client, com.sun.jersey.api.client.ClientResponse, com.sun.jersey.api.client.WebResource" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
</head>
<body>
<%
Client client = Client.create();
//Set the appropriate URL for POST request
String postUrl = "http://localhost:8080/rest/MCQService/login";

  WebResource webResource = client.resource(postUrl);
  String inputData = "{\"fullName\":\"" + "" + "\",\"email\":\"" + request.getParameter("email") + "\",\"password\":\"" + request.getParameter("password") + "\"}";
  ClientResponse clientResponse = webResource.type("application/json").post(ClientResponse.class,inputData);
    if(clientResponse.getStatus()!=201){
        throw new RuntimeException("HTTP Error: "+ clientResponse.getStatus());
    }
     
   String result = clientResponse.getEntity(String.class); 
   
   if(result.equals("true")) {
	   String redirectURL = "home.jsp";
	   response.sendRedirect(redirectURL);
   }
   else if(result.equals("false")){
%>
	   <center><b>Invalid email or password!</b></center><br>
	   <center><a href="index.jsp">login</a></center>
<%   }	%>
</body>
</html>
