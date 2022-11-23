<%-- 
    Document   : payment_view
    Created on : 10/05/2022, 8:41:57 AM
    Author     : Dinh Phan - 12937025
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="uts.isd.model.Payment"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Payment Page</title>
    </head>
    <body>
        <div class="container"> 
        <h1>View Payment</h1>
        <p>View payments here</p>
        <%
            ArrayList<Payment> payments = (ArrayList<Payment>)request.getAttribute("payments");
        %>
        <table class="table table-bordered">
            <thead>
              <tr>
                <th>Payment ID</th><th>Payment Method</th><th>Payment Name</th><th>Payment Date</th><th>Card First Name</th><th>Card Last Name</th><th>Card Number</th><th>Expire Month</th><th>Expire Year</th><th>CVV</th><th>Options</th>              
                <c:forEach items="${payments}" var="payment">
                    <tr>
                        <td>${payment.paymentID}</td>
                        <td>${payment.paymentMethod}</td>
                        <td>${payment.paymentName}</td>
                        <td>${payment.paymentDate}</td>
                        <td>${payment.cardfname}</td>
                        <td>${payment.cardlname}</td>
                        <td>${payment.cardnumber}</td>
                        <td>${payment.cardexpiremonth}</td>
                        <td>${payment.cardexpireyear}</td>
                        <td>${payment.ccpin}</td>
                        
                        <td>
                            <a class="button" href="PaymentEditServlet?pID=${payment.paymentID}">Update</a>
                            <a class="button" href="PaymentDeleteServlet?pID=${payment.paymentID}">Delete</a>
                        </td>    
                    </tr>
                </c:forEach>
              
              </tr>
            </thead>
        </table>
        <a href="index.jsp"><button type="button">Return to Menu</button></a>
        </div>
    </body>
</html>
