<%-- 
    Document   : PaymentSearch
    Created on : 19/05/2022, 12:45:45 AM
    Author     : User
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
    <body>
        <%              
              String searchMessage = (String) session.getAttribute("searchMessage");
              Payment searchPayment = (Payment) session.getAttribute("searchPayment");           
        %>
        <div class="container">
            <h1 class="display-1">Search Payment </h1>
            <p class="lead">Search Payment details by payment ID and Date Paid!</p>
            
            <form action="PaymentSearchServlet" method="post">
                <div class="form-row">
                    <div class="form-group row">
                        <div class="col">
                            <label for name="searchPaymentID">Payment ID <span class="text-danger"> *</span></label> 
                            <input  class="form-control" type ="text" id="searchPaymentID" name="searchPaymentID" placeholder= "search by paymentId" required > 
                        </div>
                        <div class="col">
                            <label for name="searchDate" >Date Paid<span class="text-danger"> *</span></label> 
                            <input class="form-control"  type ="date" id="searchDate" name="searchDate" placeholder= "search by datepaid" required > 
                        </div>
                    </div>
                </div>
                <div class="form-row" align="center">    
                    <div class="form-group row">
                        <div class="col">
                            <a href="index.jsp"><button type="button" class="btn btn-secondary btn-lg btn-block">Back</button></a>
                        </div>
                        <div class="col">
                            <a><button class="btn btn-primary btn-lg btn-block" type="submit">Search</button></a> 
                        </div>
                    </div>
                </div>
            </form>
        </div>
            <% if(searchPayment != null){ %>    
            <b><p>Payment Details!</p></b>
             <table class="table table-bordered">
                <thead>
                        <tr>
                            <th><b>Payment Id</b></th>
                            <th><b>Payment Method</b></th>
                            <th><b>Payment Name</b></th>
                            <th><b>Payment Date</b></th>
                            <th><b>First Name</b></th>
                            <th><b>Last Name</b></th>
                            <th><b>Card Number</b></th>
                            <th><b>Expiry Month</b></th>
                            <th><b>Expiry Year</b></th>
                            <th><b>CVV</b></th>
                        </tr>
                </thead>
                <tbody> 
                        <tr>
                            <td><p><%=searchPayment.getPaymentID()%></p></td>
                            <td><p><%=searchPayment.getPaymentMethod()%></p></td>
                            <td><p><%=searchPayment.getPaymentName()%></p></td>
                            <td><p><%=searchPayment.getPaymentDate()%></p></td>
                            <td><p><%=searchPayment.getCardfname()%></p></td>
                            <td><p><%=searchPayment.getCardlname()%></p></td>
                            <td><p><%=searchPayment.getCardnumber()%></p></td>
                            <td><p><%=searchPayment.getCardexpiremonth()%></p></td>
                            <td><p><%=searchPayment.getCardexpireyear()%></p></td>
                            <td><p><%=searchPayment.getCcpin()%></p></td>
                        </tr> 
                </tbody>
            </table> 
            <%  } else { %>
                <span><%=(searchMessage != null ? searchMessage : "")%></span>
            <% } %>
        
    </body>
</html>
