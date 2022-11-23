<%-- 
    Document   : payment_delete
    Created on : 12/05/2022, 7:57:48 PM
    Author     : Dinh Phan - 12937025
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delete Payment</title>
    </head>
    <body>
        <div class="container">
            <h1 class="display-1">Delete Payment</h1>
            <p>Are you sure you want to delete this payment?</p>
            <p>All the involved information with this payment will also be deleted.</p>
            <div class="container">
                    <a href="PaymentView.jsp"><button>Back</button></a>
                    <a href="PaymentView.jsp"><button>Delete Payment</button></a>
            </div>
        </div>
    </body>
</html>
