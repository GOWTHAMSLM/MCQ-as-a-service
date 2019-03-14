<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Test Home</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
  <style>
  @import url(https://fonts.googleapis.com/css?family=Roboto:300);
      .navbar-custom {
    color: #FFFFFF;
    background-color: rgb(43, 141, 233);
    }
    .navbar-default .navbar-brand {
    color: #010101;
    font-family: "Roboto", sans-serif;
}
.card {
  box-shadow: 2px 3px 6px 2px rgba(0,0,0,0.2);
  transition: 0.3s;
  width: 100%;
  padding: 5px;
  border-radius: 5px;
}
.center {
  text-align: center;
}
.button{
  text-transform: uppercase;
  outline: 0;
  background: rgb(43, 141, 233);
  width: 30%;
  margin: auto;
  display: block;
  margin-bottom: 5px;
  border: 0;
  padding: 15px;
  color: #FFFFFF;
  font-size: 14px;
  -webkit-transition: all 0.3 ease;
  transition: all 0.3 ease;
  cursor: pointer;
}

  </style>
  <!-- <script type="text/javascript">
    $(document).ready(function(){
        $("input[type='button']").click(function(){
            var radioValue1 = $("input[name='qn1']:checked").val();
            alert(radioValue1);
            var radioValue2 = $("input[name='qn2']:checked").val();
            alert(radioValue2);
            var radioValue3 = $("input[name='qn3']:checked").val();
            alert(radioValue3);
            var radioValue4 = $("input[name='qn4']:checked").val();
            alert(radioValue4);
            var radioValue5 = $("input[name='qn5']:checked").val();
            alert(radioValue5);
    });
}
</script> -->
</head>
<body>

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
  
<!-- <div class="container">
  <h3>Hello Lakshmi Narasimhan K S!!</h3>
</div> -->

<div class="container">

    <div class="center">
        <h4>Take up your test!</h4>
    </div>
    <form id="qnpaper" action="result.jsp" method="post">
    <div class="card">
      <div class="container-fluid">
        <h4><b>Question 1</b></h4> 
        <p>The ratio between the length and the breadth of a rectangular park is 3 : 2. If a man cycling along the boundary of the park at the speed of 12 km/hr completes one round in 8 minutes, then the area of the park (in sq. m) is:</p>
        <input type="radio" name="qn1" value="15360"> 15360<br>
        <input type="radio" name="qn1" value="153600"> 153600<br>
        <input type="radio" name="qn1" value="30720"> 30720
       </div>
     </div><br>

     <div class="card">
        <div class="container-fluid">
            <h4><b>Question 2</b></h4> 
            <p>The cube root of .000216 is:</p>
              <input type="radio" name="qn2" value=".6"> .6<br>
              <input type="radio" name="qn2" value=".06"> .06<br>
              <input type="radio" name="qn2" value="77"> 77
             </div>
           </div><br>
           <div class="card">
                <div class="container-fluid">
                  <h4><b>Question 3</b></h4> 
                  <p>It was Sunday on Jan 1, 2006. What was the day of the week Jan 1, 2010?</p>
                  <input type="radio" name="qn3" value="Sunday"> Sunday<br>
                  <input type="radio" name="qn3" value="Saturday"> Saturday<br>
                  <input type="radio" name="qn3" value="Friday"> Friday
                 </div>
               </div><br>
               <div class="card">
                <div class="container-fluid">
                    <h4><b>Question 4</b></h4> 
                    <p>Which of the following statements is not correct?</p>
                    <input type="radio" name="qn4" value="log10 10 = 1"> log10 10 = 1<br>
                    <input type="radio" name="qn4" value="log (2 + 3) = log (2 x 3)"> log (2 + 3) = log (2 x 3)<br>
                    <input type="radio" name="qn4" value="log10 1 = 0"> log10 1 = 0
                    </div>
                   </div><br>
                   <div class="card">
                        <div class="container-fluid">
                          <h4><b>Question 5</b></h4> 
                          <p>A person crosses a 600 m long street in 5 minutes. What is his speed in km per hour?</p>
                          <input type="radio" name="qn5" value="3.6"> 3.6<br>
                          <input type="radio" name="qn5" value="7.2"> 7.2<br>
                          <input type="radio" name="qn5" value="8.4"> 8.4
                         </div>
                       </div><br> 
                    <input type="submit" class="button" value="Submit"><br>       
                </form>         
</div>

</body>
</html>
