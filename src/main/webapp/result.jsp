<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.sun.jersey.api.client.Client, com.sun.jersey.api.client.ClientResponse, com.sun.jersey.api.client.WebResource" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <title>Login</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
  <script
  src="https://code.jquery.com/jquery-3.3.1.min.js"
  integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
  crossorigin="anonymous"></script>
  <script src = "script.js"></script>
  <style>
  @import url(https://fonts.googleapis.com/css?family=Roboto:300);

.login-page {
  width: 360px;
  padding: 8% 0 0;
  margin: auto;
}
.form {
  position: relative;
  z-index: 1;
  background: #FFFFFF;
  max-width: 360px;
  margin: 0 auto 100px;
  padding: 45px;
  text-align: center;
  box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0 rgba(0, 0, 0, 0.24);
}
.form input {
  font-family: "Roboto", sans-serif;
  outline: 0;
  background: #f2f2f2;
  width: 100%;
  border: 0;
  margin: 0 0 15px;
  padding: 15px;
  box-sizing: border-box;
  font-size: 14px;
}
h3{
    color:rgb(43, 141, 233);
}
.form button {
  font-family: "Roboto", sans-serif;
  text-transform: uppercase;
  outline: 0;
  background: rgb(43, 141, 233);
  width: 100%;
  border: 0;
  padding: 15px;
  color: #FFFFFF;
  font-size: 14px;
  -webkit-transition: all 0.3 ease;
  transition: all 0.3 ease;
  cursor: pointer;
}
.form button:hover,.form button:active,.form button:focus {
  background:rgb(5, 56, 104);
}
.form .message {
  margin: 15px 0 0;
  color: #b3b3b3;
  font-size: 12px;
}
.form .message a {
  color: rgb(43, 141, 233);
  text-decoration: none;
}
.form .register-form {
  display: none;
}
.container {
  position: relative;
  z-index: 1;
  max-width: 300px;
  margin: 0 auto;
}
.container:before, .container:after {
  content: "";
  display: block;
  clear: both;
}
.container .info {
  margin: 50px auto;
  text-align: center;
}
.container .info h1 {
  margin: 0 0 15px;
  padding: 0;
  font-size: 36px;
  font-weight: 300;
  color: #1a1a1a;
}
.container .info span {
  color: #4d4d4d;
  font-size: 12px;
}
.container .info span a {
  color: #000000;
  text-decoration: none;
}
.container .info span .fa {
  color: #EF3B3A;
}
body {
  background: rgb(206, 212, 218); /* fallback for old browsers */
  font-family: "Roboto", sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;      
}
.navbar-custom {
    color: #FFFFFF;
    background-color: rgb(43, 141, 233);
    }
    .navbar-default .navbar-brand {
    color: #010101;
}
  </style>

</head>
<body>
<%
 Client client = Client.create();
//Set the appropriate URL for POST request
String postUrl = "http://localhost:8080/MCQ-as-a-service/rest/MCQService/calculateResult";

WebResource webResource = client.resource(postUrl);
 
String inputData = "{\"submittedTest\": {" +
							"\"qn1\":\"" + request.getParameter("qn1") + "\"," +
							"\"qn2\":\"" + request.getParameter("qn2") + "\"," +
							"\"qn3\":\"" + request.getParameter("qn3") + "\"," +
							"\"qn4\":\"" + request.getParameter("qn4") + "\"," +
							"\"qn5\":\"" + request.getParameter("qn5") + "\"}}";
							
 ClientResponse clientResponse = webResource.type("application/json").post(ClientResponse.class,inputData);
  if(clientResponse.getStatus()!=201){
      throw new RuntimeException("HTTP Error: "+ clientResponse.getStatus());
  }
   
 String result = clientResponse.getEntity(String.class);  
%>
        <nav class="navbar navbar-default navbar-custom">
                <div class="container-fluid">
                  <div class="navbar-header">
                    <a class="nav navbar-brand" href="#">Test your Skill!</a>
                  </div>
                  <ul class="nav navbar-nav">
                    <li class="active"><a href="#">Home</a></li>
                  </ul>
                  <ul class="nav navbar-nav navbar-right">
                      <li><a href="index.jsp"><span class="glyphicon glyphicon-log-in"></span> Logout</a></li>
                  </ul>
                </div>
              </nav>
<div class="login-page">
        <div class="form">
          <h1>Successfully completed Test !</h1>
          <h3>Your Score: <%= result %>/10</h3>
        </div>
      </div>
      <script>
            $('.message a').click(function(){
         $('form').animate({height: "toggle", opacity: "toggle"}, "slow");
      });
        </script>
    </body>
    </html>
    