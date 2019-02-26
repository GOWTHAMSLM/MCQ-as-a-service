<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.util.*, com.sun.jersey.api.client.Client, com.sun.jersey.api.client.ClientResponse, com.sun.jersey.api.client.WebResource" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MCQ Service</title>
</head>
<body>
<%
/* Client client = Client.create();
//set the appropriate URL
String getUrl = "http://localhost:8080/MCQ-as-a-service/rest/MCQService/sarath";
 
WebResource webResource = client.resource(getUrl);
ClientResponse clientResponse = webResource.accept("application/json").get(ClientResponse.class);
//a successful response returns 200
        if(clientResponse.getStatus()!=200){
    throw new RuntimeException("HTTP Error: "+ clientResponse.getStatus());
}
 
String result = clientResponse.getEntity(String.class);
System.out.println("Response from the Server: ");
System.out.println(result); */

Client client = Client.create();
//Set the appropriate URL for POST request
String postUrl = "http://localhost:8080/MCQ-as-a-service/rest/MCQService/login";

  WebResource webResource = client.resource(postUrl);
  String inputData = "{\"fullName\":\"Sarath Kumar S\",\"email\":\"sk331857@gmail.com\",\"password\":\"password\"}";
  ClientResponse clientResponse = webResource.type("application/json").post(ClientResponse.class,inputData);
    if(clientResponse.getStatus()!=201){
        throw new RuntimeException("HTTP Error: "+ clientResponse.getStatus());
    }
     
   String result = clientResponse.getEntity(String.class);
   
  
%>

<%= result %>
</body>
</html>