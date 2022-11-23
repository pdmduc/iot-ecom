<%-- 
    Document   : payment_edit
    Created on : 10/05/2022, 8:57:07 AM
    Author     : Dinh Phan - 12937025
--%>

<%@page import="uts.isd.model.Payment"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Payment Page</title>
    </head>
    <body align="left">
        <% 
            String firstNameErr = (String) session.getAttribute("firstNameErr");
            String lastNameErr = (String) session.getAttribute("lastNameErr"); 
            String ccpinErr = (String) session.getAttribute("ccpinErr");
        %>
        <div class="container">  
            <h1 class="display-1">Please edit your payment details.</h1>
            
            <h2>Order Number:${orderId}</h2>
            <form action="PaymentUpdateServlet" method="post" >
                <div class="form-group">
                    <label>Payment ID</label>
                    <input class="form-control" name="paymentID" readonly type="text" value="${payment.paymentID}" required>
                    <small class="text-muted">This payment's ID can not be change</small>
                </div>
                <div class="form-group">
                    <label for name="paymentMethod">Payment Method<span class="text-danger"> *</span></label>
                    <select class="form-control" id="paymentMethod" name="paymentMethod" value="${payment.paymentMethod}" required>
                        <option value='Prepaid Card'>Prepaid Card</option>
                        <option value='Credit Card'>Credit Card</option>
                        <option value='Master Card'>Master Card</option>
                        <option value='Visa Card'>Visa Card</option>
                    ></select>
                </div>
                <div class="form-group">
                    <label for="paymentName">Payment Name<span class="text-danger"> *</span></label>
                    <input name="paymentName" type="text" class="form-control" placeholder="Enter Transacaction Name..." value="${payment.paymentName}" required>
                </div>
                <div class="form-group">
                    <label for="paymentDate">Payment Date<span class="text-danger"> *</span></label>  
                    <input name="paymentDate" type="date" class="form-control" placeholder="Enter the date to paid..." value="${payment.paymentDate}"required>
                    <small class="text-muted">Enter the date to paid...</small>
                </div>
                <h2>Enter card details below:</h2>
                <div class="form-row">
                    <div class="form-group row">
                        <div class="col">
                            <label for="cardfname">First Name<span class="text-danger"> *</span></label>
                            <small class="text-danger"><%=(firstNameErr != null ? firstNameErr : "")%></small>
                            <input class="form-control" type="text" id="cardfname" name="cardfname" placeholder="Enter First Name on card" value="${payment.cardfname}" required>
                        </div>
                        <div class="col">   
                            <label for="cardlname">Last Name<span class="text-danger"> *</span></label>
                            <small class="text-danger"><%=(lastNameErr != null ? lastNameErr : "")%></small>`
                            <input class="form-control" type="text" id="cardlname" name="cardlname" placeholder="Enter Last Name on card" value="${payment.cardlname}" required>
                        </div>
                    </div>
                </div>
                <div class="form-group">                
                    <label for="creditcard">Card Number<span class="text-danger"> *</span></label>
                    <input class="form-control" type="number" id="cardnumber" name="cardnumber" placeholder="XXXX-XXXX-XXXX-XXXX" value="${payment.cardnumber}" required>
                </div>
                <div class="form-row">
                    <div class="form-group row">
                        <div class="col">
                            <label for name="cardexpire">Exp Month<span class="text-danger"> *</span></label>     
                            <select class="form-control" id="cardexpiremonth" name="cardexpiremonth" value="${payment.cardexpiremonth}" required>
                                <option value='01'>January</option>
                                <option value='02'>February</option>
                                <option value='03'>March</option>
                                <option value='04'>April</option>
                                <option value='05'>May</option>
                                <option value='06'>June</option>
                                <option value='07'>July</option>
                                <option value='08'>August</option>
                                <option value='09'>September</option>
                                <option value='10'>October</option>
                                <option value='11'>November</option>
                                <option value='12'>December</option>
                            </select>
                        </div>
                        <div class="col">
                            <label for name="cardexpire">Exp Year<span class="text-danger"> *</span></label> 
                            <select class="form-control" id="cardexpireyear" name="cardexpireyear" value="${payment.cardexpireyear}" required>
                                <option value='23'>2023</option>
                                <option value='24'>2024</option>
                                <option value='25'>2025</option>
                                <option value='26'>2026</option>
                                <option value='27'>2027</option>
                                <option value='28'>2028</option>
                                <option value='29'>2029</option>
                                <option value='30'>2030</option>
                            </select>
                         </div>
                    </div>
                </div>
                <div class="form-group">
                    <label for="ccpin">Security Code:<span class="text-danger"> *</span></label>
                    <small class="text-danger"><%=(ccpinErr != null ? ccpinErr : "")%></small>
                    <input class="form-control" type="number" id="password" name="ccpin" placeholder="Enter the 3 digit code on the back of your card" value="${payment.ccpin}" required>
                </div>
                <div class="form-row" align="center">    
                    <div class="form-group row">
                        <div class="col">
                            <a href="PaymentView.jsp"><button type="button" class="btn btn-secondary btn-lg btn-block">Back</button></a>
                        </div>
                        <div class="col">
                            <a><button class="btn btn-primary btn-lg btn-block" type="submit">Save Payment</button></a> 
                        </div>
                    </div>
                </div>
            </form>
        </div>        
    </body>
</html>
