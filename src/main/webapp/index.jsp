<!DOCTYPE html>
<html lang="en">
<head>
  <title>Login</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
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
  </style>

</head>
<body>
<div class="login-page">
        <div class="form">
          <form class="register-form" action="register.jsp" method="post">
            <input name="fullName" type="text" placeholder="full name" required/>
            <input name="email" type="text" placeholder="email" required/>
            <input name="password" type="password" placeholder="password" required/>
            <button>create</button>
            <p class="message">Already registered? <a href="#">Sign In</a></p>
          </form>
          <form class="login-form" action="login.jsp" method="post">
            <input name="email" type="text" placeholder="email" required/>
            <input name="password" type="password" placeholder="password" required/>
            <button>login</button>
            <p class="message">Not registered? <a href="#">Create an account</a></p>
          </form>
        </div>
      </div>
      <script>
            $('.message a').click(function(){
         $('form').animate({height: "toggle", opacity: "toggle"}, "slow");
      });
        </script>
    </body>
    </html>
    
<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
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
</html> --%>