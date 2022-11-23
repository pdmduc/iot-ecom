<%-- 
    Document   : payment_register
    Created on : 03/05/2022, 9:32:27 PM
    Author     : Dinh Phan - 12937025
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        
        <!-- Required meta tags -->
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Payment Page</title>
        <%;
            String firstNameErr = (String) session.getAttribute("firstNameErr");
            String lastNameErr = (String) session.getAttribute("lastNameErr");      
            String ccpinErr = (String) session.getAttribute("ccpinErr");      
        %>
    </head>
    <body align="left">
        <div class="container">  
            <h1 class="display-1">Register Payment</h1>
            <p class="lead">Please add your payment details.</p>
            <h2>Order Number:${orderId}</h2>
            <h2>Payment Detail:</h2>
            <form action="PaymentRegisterServlet" method="post" >
                <div class="form-group mt-3">
                    <label for name="paymentMethod">Payment Method<span class="text-danger"> *</span></label>
                    <select id="paymentMethod" name="paymentMethod" class="form-control" required="">
                        <option value='' disabled selected>Choose Following Card</option>
                        <option value='Prepaid Card'>Prepaid Card</option>
                        <option value='Credit Card'>Credit Card</option>
                        <option value='Master Card'>Master Card</option>
                        <option value='Visa Card'>Visa Card</option>
                    </select>
                </div>
                <div class="form-group mt-3">
                    <label for="paymentName">Payment Name<span class="text-danger"> *</span></label>
                    <input name="paymentName" type="text" class="form-control" placeholder="Enter Transacaction Name..." required>
                </div>
                <div class="form-group mt-3">
                    <label for="paymentDate">Payment Date<span class="text-danger"> *</span></label>  
                    <input name="paymentDate" type="date" class="form-control" placeholder="Enter the date to paid..." required>
                    <small class="text-muted">Enter the date to paid...</small>
                </div>
                <h2>Enter card details below:</h2>
                <div class="form-row mt-3">
                    <div class="form-group row">
                        <div class="col">
                            <label for="cardfname">First Name<span class="text-danger"> *</span></label>
                            <small class="text-danger"><%=(firstNameErr != null ? firstNameErr : "")%></small>
                            <input class="form-control" type="text" id="cardfname" name="cardfname" placeholder="Enter First Name on card" required>
                        </div>
                        <div class="col">   
                            <label for="cardlname">Last Name<span class="text-danger"> *</span></label>
                            <small class="text-danger"><%=(lastNameErr != null ? lastNameErr : "")%></small>
                            <input class="form-control" type="text" id="cardlname" name="cardlname" placeholder="Enter Last Name on card" required>
                        </div>
                    </div>
                </div>
                <div class="form-group mt-3">                
                    <label for="creditcard">Card Number<span class="text-danger"> *</span></label>
                    <input class="form-control" type="number" id="cardnumber" name="cardnumber" placeholder="XXXX-XXXX-XXXX-XXXX" required>
                </div>
                <div class="form-row mt-3">
                    <div class="form-group row">
                        <div class="col">
                            <label for name="cardexpire">Exp Month<span class="text-danger"> *</span></label>     
                            <select class="form-control" id="cardexpiremonth" name="cardexpiremonth" required>
                                <option value='' disabled selected>Month</option>
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
                            <select class="form-control" id="cardexpireyear" name="cardexpireyear" required>
                                <option value='' disabled selected>Year</option>
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
                <div class="form-group mt-3" >
                    <label for="ccpin">Security Code:<span class="text-danger"> *</span></label>
                    <small class="text-danger"><%=(ccpinErr != null ? ccpinErr : "")%></small>
                    <input class="form-control" type="number" id="password" name="ccpin" placeholder="Enter the 3 digit code on the back of your card" required>
                </div>
                <div class="form-row mt-3" align="center" >    
                    <div class="form-group row">
                        <div class="col">
                            <a href="index.jsp"><button type="button" class="btn btn-secondary btn-lg btn-block">Cancel</button></a>
                        </div>
                        <div class="col">
                            <a><button class="btn btn-primary btn-lg btn-block" type="submit">Register</button></a> 
                        </div>
                    </div>
                </div>
                
           </form>
        </div>  
    </body>
</html>
