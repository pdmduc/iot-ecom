<%-- 
    Document   : purchase_confirm
    Created on : 03/05/2022, 9:48:31 PM
    Author     : Dinh Phan - 12937025
--%>

<%@page import="uts.isd.model.Payment"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Payment Page</title>
    </head>
    <body>
        <div class="container"> 
            <h2>User Id: 07</h1>
            <h2 style="text-align: left"> Order #20 </h2>
            <h2 style="font-size:30px; text-align:center ;">Your payment has been verified and saved. Do you want to confirm purchase ?</h2>
            
            <form action="PaymentSuccess.jsp" method="post" >
                <div class="form-group">
                    <label for name="paymentMethod">Payment Method<span class="text-danger"> *</span></label>
                    <input class="form-control" id="paymentMethod" name="paymentMethod" value="${payment.paymentMethod}" required readonly>
                </div>
                <div class="form-group">
                    <label for="paymentName">Payment Name<span class="text-danger"> *</span></label>
                    <input name="paymentName" type="text" class="form-control" placeholder="Enter Transacaction Name..." value="${payment.paymentName}" required readonly>
                </div>
                <div class="form-group">
                    <label for="paymentDate">Payment Date<span class="text-danger"> *</span></label>  
                    <input name="paymentDate" type="date" class="form-control" placeholder="Enter the date to paid..." value="${payment.paymentDate}"required readonly>
                </div>
                <h2>Enter card details below:</h2>
                <div class="form-row">
                    <div class="form-group row">
                        <div class="col">
                            <label for="cardfname">First Name<span class="text-danger"> *</span></label>
                            <input class="form-control" type="text" id="cardfname" name="cardfname" placeholder="Enter First Name on card" value="${payment.cardfname}" required readonly>
                        </div>
                        <div class="col">   
                            <label for="cardlname">Last Name<span class="text-danger"> *</span></label>
                            <input class="form-control" type="text" id="cardlname" name="cardlname" placeholder="Enter Last Name on card" value="${payment.cardlname}" required readonly>
                        </div>
                    </div>
                </div>
                <div class="form-group">                
                    <label for="creditcard">Card Number<span class="text-danger"> *</span></label>
                    <input class="form-control" type="number" id="cardnumber" name="cardnumber" placeholder="XXXX-XXXX-XXXX-XXXX" value="${payment.cardnumber}" required readonly>
                </div>
                <div class="form-row">
                    <div class="form-group row">
                        <div class="col">
                            <label for name="cardexpire">Exp Month<span class="text-danger"> *</span></label>     
                            <input class="form-control" id="cardexpiremonth" name="cardexpiremonth" value="${payment.cardexpiremonth}" required readonly>
                        </div>
                        <div class="col">
                            <label for name="cardexpire">Exp Year<span class="text-danger"> *</span></label> 
                            <input class="form-control" id="cardexpireyear" name="cardexpireyear" value="${payment.cardexpireyear}" required readonly>
                         </div>
                    </div>
                </div>
                <div class="form-group">
                    <label for="ccpin">Security Code:<span class="text-danger"> *</span></label>
                    <input class="form-control" type="number" id="password" name="ccpin" placeholder="Enter the 3 digit code on the back of your card" value="${payment.ccpin}" required readonly>
                </div>
                <div class="form-row" align="center">    
                    <div class="form-group row">
                        <div class="col">
                            <a href="index.jsp"><button type="button" class="btn btn-secondary btn-lg btn-block">Back</button></a>
                        </div>
                        <div class="col">
                            <a><button class="btn btn-primary btn-lg btn-block" type="submit">Confirm</button></a> 
                        </div>
                    </div>
                </div>
            </form>
            
        </div>
    </body>
</html>
