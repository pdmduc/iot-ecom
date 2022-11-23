

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>IoT Bay</title>
    </head>
    <body>
        <h1 style = "text-align: center;">
            IoT Bay </h1>
        <h2 style = "text-align: center;"> 
            Please Select One Of The Options 
        </h2>
         <h3 style ="text-align: center;">
        <a href = "login.jsp" ">Login</a></br>
        <a href = "register.jsp"> Register </a></br>
        <a href = "PaymentRegister.jsp"> Test Register Payment  </a></br>
        <a href = "PaymentSearch.jsp"> Test Search Payment </a></br>
        <a href = "PaymentViewServlet"> Test View Payment </a>
        </h3>  
        <jsp:include page="/ConnServlet" flush="true" />                
    </body>
</html>
