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
 *
 * @author Dinh Phan - 12937025
 */
public class PaymentDeleteServlet extends HttpServlet {
    @Override
        protected void doGet(HttpServletRequest request, HttpServletResponse response)
                throws ServletException, IOException{ 
            HttpSession session = request.getSession();
            DBManager manager = (DBManager) session.getAttribute("manager");
            int paymentID = Integer.parseInt(request.getParameter("pID"));
            System.out.println(paymentID);
            
            ArrayList<Payment> payments;

            try {
                manager.deletePayment(paymentID);
                payments = manager.fetchPayments();
                session.setAttribute("payments", payments);
                request.getRequestDispatcher("PaymentView.jsp").include(request,response);
            } catch(SQLException | NullPointerException ex) {
                Logger.getLogger(PaymentDeleteServlet.class.getName()).log(Level.SEVERE, null, ex); 
            }
            response.sendRedirect("PaymentView.jsp");
        }
}

