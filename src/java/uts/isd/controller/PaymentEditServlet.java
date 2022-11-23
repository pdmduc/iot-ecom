/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uts.isd.controller;

import com.sun.istack.internal.logging.Logger;
import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import uts.isd.model.Payment;
import uts.isd.model.dao.DBManager;

/**
 *
 * @author Dinh Phan - 12937025
 */
public class PaymentEditServlet extends HttpServlet{
    @Override   
    protected void doGet(HttpServletRequest request, HttpServletResponse response)   throws ServletException, IOException {       
        HttpSession session = request.getSession();//1- retrieve the current session
        int paymentID = Integer.parseInt(request.getParameter("pID"));  
        DBManager manager = (DBManager) session.getAttribute("manager");
        
        Payment payment;
        ArrayList<Payment> payments;
        
        try{
                payment = manager.findPayment(paymentID);
                session.setAttribute("payment",payment);           
                request.getRequestDispatcher("PaymentEdit.jsp").include(request,response);
                //payments = manager.fetchPayments(); 
                //session.setAttribute("payments", payments);
                //session.setAttribute("updateMess","Update successfully");
        }
        catch (SQLException | NullPointerException ex) {
                java.util.logging.Logger.getLogger(PaymentEditServlet.class.getName()).log(Level.SEVERE, null, ex); 
        }  
    }
    @Override
        protected void doPost(HttpServletRequest request, HttpServletResponse response)
                throws ServletException, IOException{ 
            HttpSession session = request.getSession();
            DBManager manager = (DBManager) session.getAttribute("manager");
            
            String PaymentMethod = request.getParameter("paymentMethod");
            String PaymentName = request.getParameter("paymentName");
            String PaymentDate = request.getParameter("paymentDate");
            String CardFName = request.getParameter("cardfname");
            String CardLName = request.getParameter("cardlname");
            long CardNumber = Long.parseLong(request.getParameter("cardnumber"));
            String CardExpireMonth = request.getParameter("cardexpiremonth");
            String CardExpireYear = request.getParameter("cardexpireyear");
            int CardSecurityNum = Integer.parseInt(request.getParameter("ccpin"));
            int PaymentID = Integer.parseInt(request.getParameter("pID"));
            Payment payment = new Payment(PaymentID, PaymentName, PaymentDate, PaymentMethod, CardFName, CardLName, CardNumber, CardExpireMonth, CardExpireYear, CardSecurityNum);
            session.setAttribute("payment", payment);
            request.getRequestDispatcher("PaymentConfirm.jsp").include(request, response);
            
            try {
                session.setAttribute("payment", payment);
                manager.updatePayment(PaymentID, PaymentMethod, PaymentName, PaymentDate, CardFName, CardLName, CardNumber, CardExpireMonth, CardExpireYear, CardSecurityNum);
                session.setAttribute("updated", "Update was successful");
                request.getRequestDispatcher("PaymentConfirm.jsp").include(request, response);
            } catch (SQLException e){
                throw new ServletException("Cannot obtain payments from Database", e); 
            }
        }    
}
