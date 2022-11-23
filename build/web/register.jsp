<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register</title>
    </head>
    <body>
        <h1>Register to IoT Bay</h1>
        
        <form action="welcome.jsp" method="post">
            <table>
                <tr>
                    <td> <label for = "accountType"> Account Type: </label> </td>
                    <td>
                        <select name=" accountType" id = "accountType"required>
                            <option style="display: none">
                            <option value="Staff">Staff</option>
                            <option value="Customer">Customer</option>
                    </td> 
                </tr>
                
                <tr>
                    <td><label for="email">Email:</label><br></td>
                    <td><input type="email" id="email" name="email" required><br></td>
                </tr>
                
                <tr>
                    <td><label for="fName"> Name:</label><br></td>
                    <td><input type="text" id="fname" name="name" required><br></td>
                </tr>
                <!-- 
                    <td><label for="lName">Last Name:</label><br></td>
                    <td><input type="text" id="lname" name="lName" required><br></td>
                </tr>-->
                <tr>
                    <td><label for="password">Password:</label><br></td>
                    <td><input type="password" id="password" name="password" required></td>
                </tr>
                
                <tr>
                    <td><label for="gender">Gender:</label></td>
                    <td>
                    <table>
                        <tr>
                           
                           <td> <input type="radio" name="gender" value ="Male" > Male</td>
                           <td> <input type="radio" name="gender" value ="Female"> Female  </td>
                        </tr>
                    </table>
                    </td>
                </tr>
                
                <tr>
                    <td><label for="dob">Date of Birth:</label></td>
                    <td><input type="date" id="dob" name="dob" required></br></td>
                </tr>
                
                <tr>
                    <td><label for="phoneNum">Phone Number:</label></td>
                    <td><input type="tel" id="phoneNum" name="phoneNum" required></br></td>
                </tr>
                
                <tr>
                    <td><label for="billing_address">Billing Address:</label></br></td>
                    <td><input type="text" id="billing_address" name="billing_address" required></br></td>
                </tr>

                <tr>
                    <td><input type="submit" formmethod="post" value="Register"></br> </td>
                    <td> <a href="index.jsp">Cancel</a></br> </td>
                    
                </tr>
            </table>

               
              

            
       </form> 
        
            
    </body>
</html>