/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uts.isd.model.dao;

import java.sql.*;
import java.util.ArrayList;
import uts.isd.model.Payment;


public class DBManager {
    private Statement st;
    public DBManager(Connection conn) throws SQLException {
        st = conn.createStatement();
    }
  
/**
 * @author Dinh Phan
 */    
    //Find Payemnt
    public Payment findPayment(int searchID) throws SQLException {
        String fetch = "SELECT * FROM APP.PAYMENTS WHERE PaymentID = " + searchID ;
        ResultSet rs = st.executeQuery(fetch);

        while (rs.next()) {
           int paymentID = rs.getInt(1);
           if (paymentID == searchID){
                String method = rs.getString(2);
                String name = rs.getString(3);
                String date = rs.getString(4);
                String fName = rs.getString(5);
                String lName = rs.getString(6);
                long cardNumber = rs.getLong(7);
                String expireMonth = rs.getString(8);
                String expireYear = rs.getString(9);
                int ccpin = rs.getInt(10);
                return new Payment(paymentID, method, name, date, fName, lName, cardNumber, expireMonth, expireYear, ccpin);
           }
       }      
       return null;   
        
    } 
    //Add Payemnt
    public void addPayment(String PaymentMethod, String PaymentName, String PaymentDate, String CardFName, String CardLName, long CardNumber, String CardExpireMonth, String CardExpireYear, int CardSecurityNum) throws SQLException {                    
        st.executeUpdate("INSERT INTO APP.PAYMENTS (PAYMENTMETHOD, PAYMENTNAME,PAYMENTDATE, CARDFNAME, CARDLNAME, CARDNUMBER, CARDEXPIREMONTH, CARDEXPIREYEAR, CCPIN) " + 
                "VALUES ('" + PaymentMethod + "', '" + PaymentName + "','" + PaymentDate + "','" + CardFName + "', '" + CardLName + "', " + CardNumber + ", '" + CardExpireMonth + "', '" + CardExpireYear + "', " + CardSecurityNum + ")");  
    } 
    //update Payemnt
    public void updatePayment(int PaymentID, String PaymentMethod, String PaymentName, String PaymentDate, String CardFName, String CardLName, long CardNumber, String CardExpireMonth, String CardExpireYear, int CardSecurityNum) throws SQLException {                  
        st.executeUpdate("UPDATE APP.PAYMENTS SET PaymentMethod='" + PaymentMethod + "', PaymentDate='" + PaymentName +"',PaymentName='" + PaymentDate +"', CardFName='" + CardFName + "', CardLName='" + CardLName + "', CardNumber="+CardNumber+", CardExpireMonth='" + CardExpireMonth + "', CardExpireYear='" + CardExpireYear + "', CCPIN="+CardSecurityNum+" where paymentID = " + PaymentID );
     } 
    //Delete Payemnt
    public void deletePayment(Integer paymentID) throws SQLException {      
        st.executeUpdate("DELETE FROM APP.PAYMENTS WHERE paymentID=" + paymentID);
    }
    
    //fecthPayments
    public ArrayList<Payment> fetchPayments() throws SQLException {
        ArrayList<Payment> payments = new ArrayList();
        String fetch = "SELECT * FROM APP.PAYMENTS";
        ResultSet rs = st.executeQuery(fetch);
        
        while (rs.next()) {
            int paymentID = rs.getInt(1);
            String method = rs.getString(2);
            String name = rs.getString(3);
            String date = rs.getString(4);
            String fName = rs.getString(5);
            String lName = rs.getString(6);
            long cardNumber = rs.getLong(7);
            String expireMonth = rs.getString(8);
            String expireYear = rs.getString(9);
            int ccpin = rs.getInt(10);
            payments.add(new Payment(paymentID, method, name, date, fName, lName, cardNumber, expireMonth, expireYear, ccpin));
        }
        return payments;
    }
    
    //Check Payment 
    public boolean checkPayment(int paymentID) throws SQLException{
       String fetch = "SELECT * FROM APP.PAYMENTS WHERE PaymentID = " + paymentID ;       
       ResultSet rs = st.executeQuery(fetch);
       
       while(rs.next()) {
           int userPayment = rs.getInt(1);
           
           if (paymentID == userPayment) {
               return true;
           }
       }
       return false;
   }
    
    //Search Payment
    public Payment searchPayment(Integer paymentID, String paymentDate) throws SQLException {       
       String fetch = "SELECT * FROM APP.PAYMENTS WHERE PAYMENTID= " + paymentID + " and PAYMENTDATE ='" + paymentDate +"' ";
       ResultSet rs = st.executeQuery(fetch);
       
       while(rs.next()){
           Integer searchID = rs.getInt(1);
           String searchDate = rs.getString(4);
           if(searchID.equals(paymentID) && searchDate.equals(paymentDate)){
                String method = rs.getString(2);
                String name = rs.getString(3);
                String fName = rs.getString(5);
                String lName = rs.getString(6);
                long cardNumber = rs.getLong(7);
                String expireMonth = rs.getString(8);
                String expireYear = rs.getString(9);
                int ccpin = rs.getInt(10);
                return new Payment(searchID, method, name, searchDate, fName, lName, cardNumber, expireMonth, expireYear, ccpin);
                }
           }
       return null;
    }
    
    
}

