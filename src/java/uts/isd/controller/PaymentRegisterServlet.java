/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uts.isd.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import uts.isd.model.Payment;
import uts.isd.model.dao.DBManager;

/**
 * @author Dinh Phan - 12937025
 */
public class PaymentRegisterServlet extends HttpServlet{
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Validator validator = new Validator();
        validator.clear(session);
        request.getRequestDispatcher("PaymentRegister.jsp").include(request, response);
    }

    
    @Override
        protected void doPost(HttpServletRequest request, HttpServletResponse response)
                throws ServletException, IOException{
            HttpSession session = request.getSession();
            DBManager manager = (DBManager) session.getAttribute("manager");
            Validator validator = new Validator();        
            
            String PaymentMethod = request.getParameter("paymentMethod");
            String PaymentName = request.getParameter("paymentName");
            String PaymentDate = request.getParameter("paymentDate");
            String CardFName = request.getParameter("cardfname");
            String CardLName = request.getParameter("cardlname");
            long CardNumber = Long.parseLong(request.getParameter("cardnumber"));
            String CardExpireMonth = request.getParameter("cardexpiremonth");
            String CardExpireYear = request.getParameter("cardexpireyear");
            int CardSecurityNum = Integer.parseInt(request.getParameter("ccpin"));   
            int paymentID = 1;
            validator.clear(session);
            
            try {
                if (!validator.validateName(CardFName)) {           
                    session.setAttribute("firstNameErr", "Error: First name format incorrect");
                    request.getRequestDispatcher("PaymentRegister.jsp").include(request, response);
                } else if (!validator.validateName(CardLName)) {           
                    session.setAttribute("lastNameErr", "Error: Last name format incorrect");
                    request.getRequestDispatcher("PaymentRegister.jsp").include(request, response);
                } else if (!validator.validateCcpin(request.getParameter("ccpin"))) {           
                    session.setAttribute("ccpinErr", "Error: Security Number format incorrect. Please enter at least 3 number!");
                    request.getRequestDispatcher("PaymentRegister.jsp").include(request, response);
                } else {
                    //Integer orderId = manager.getOrderId();
                    //session.setAttribute("orderId", orderId);
                    manager.addPayment(PaymentMethod, PaymentName, PaymentDate, CardFName, CardLName, CardNumber, CardExpireMonth, CardExpireYear, CardSecurityNum);
                    Payment payment = new Payment(paymentID, PaymentMethod, PaymentName, PaymentDate, CardFName, CardLName, CardNumber, CardExpireMonth, CardExpireYear, CardSecurityNum);
                    session.setAttribute("payment", payment);
                    request.getRequestDispatcher("PaymentConfirm.jsp").include(request, response);
                }
            }catch (SQLException | NullPointerException ex) {
                Logger.getLogger(PaymentUpdateServlet.class.getName()).log(Level.SEVERE, null, ex); 
            }
        }    
}
