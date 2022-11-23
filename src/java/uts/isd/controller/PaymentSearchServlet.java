/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uts.isd.controller;

import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import uts.isd.model.Payment;
import uts.isd.model.dao.DBManager;

/**
 *
 * @author User
 */
public class PaymentSearchServlet  extends HttpServlet {
    @Override
        protected void doPost(HttpServletRequest request, HttpServletResponse response)
                throws ServletException, IOException {
            HttpSession session = request.getSession();
            DBManager manager = (DBManager) session.getAttribute("manager");
            
            Integer paymentId = Integer.parseInt(request.getParameter("searchPaymentID"));
            String datePaid = request.getParameter("searchDate");

            Payment payment = null;
            session.setAttribute("searchPayment", null);
            session.setAttribute("searchMessage", null);

            
            try{
                payment = manager.searchPayment(paymentId, datePaid);

                if(payment != null){
                    session.setAttribute("searchPayment", payment ); 
                    request.getRequestDispatcher("PaymentSearch.jsp").include(request, response);
                } else {
                    session.setAttribute("searchMessage", "payment not found");
                    request.getRequestDispatcher("PaymentSearch.jsp").include(request, response);
                } 
            } catch (SQLException ex) {
               System.out.println(ex.getErrorCode() + " and " + ex.getMessage());
            }
            
        } 
}
