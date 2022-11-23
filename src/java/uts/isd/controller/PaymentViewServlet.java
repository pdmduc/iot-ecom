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
public class PaymentViewServlet extends HttpServlet{
    @Override   
        protected void doGet(HttpServletRequest request, HttpServletResponse response)   throws ServletException, IOException {       
            HttpSession session = request.getSession();//1- retrieve the current session
            DBManager manager = (DBManager) session.getAttribute("manager");

            ArrayList<Payment> payments;           
            try {       
                payments = manager.fetchPayments();
                session.setAttribute("payments", payments);
                request.getRequestDispatcher("PaymentView.jsp").include(request,response);
            }catch (SQLException | NullPointerException ex) {
                Logger.getLogger(PaymentViewServlet.class.getName()).log(Level.SEVERE, null, ex);
             }
          
        }
}
