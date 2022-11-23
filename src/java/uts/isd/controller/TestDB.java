/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uts.isd.controller;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Scanner;
import java.util.logging.Level;
import java.util.logging.Logger;
import uts.isd.model.Payment;
import uts.isd.model.dao.DBConnector;
import uts.isd.model.dao.DBManager;

/**
 *
 * @author Dinh Phan
 */
public class TestDB {
    private static Scanner in = new Scanner(System.in);
    private DBConnector connector;
    private Connection conn;
    private DBManager db;
    
    public static void main(String[] args) throws ClassNotFoundException, SQLException{
        (new TestDB()).runQueries();
    }
    
    public TestDB(){
        try {
            connector = new DBConnector();
            conn = connector.openConnection();
            db = new DBManager(conn);
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(TestDB.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public char readChoice() {
        System.out.print("Operation CRUDS or * to exit: ");
        return in.nextLine().charAt(0);
    }
    
    private void runQueries() throws SQLException {
        char c;
        
        //Activates the testCRUDS operantion until * is entered
        while((c = readChoice()) != '*') {
            switch (c) {
                case 'C':
                    testAdd();
                    break;
                case 'R':
                    testRead();
                    break; 
                case 'U':
                    testUpdate();
                    break;    
                case 'D':
                    testDelete();
                    break;
                case 'S':
                    showAll();
                    break;    
                default:
                    System.out.println("Unkown Command");
            }
        }
    }    
    
    private void testAdd(){            
            // Add to Database
            System.out.print("User PaymentMethod: ");
            String PaymentMethod = in.nextLine();
            System.out.print("User PaymentName: ");
            String PaymentName = in.nextLine();
            System.out.print("User PaymentDate: ");
            String PaymentDate = in.nextLine();
            System.out.print("Card FName: ");
            String CardFName = in.nextLine();
            System.out.print("Card LName: ");
            String CardLName = in.nextLine();
            System.out.print("Card Number: ");
            int CardNumber = Integer.parseInt(in.nextLine());
            System.out.print("Card Expire Month: ");
            String CardExpireMonth = in.nextLine();
            System.out.print("Card Expire Year: ");
            String CardExpireYear = in.nextLine();
            System.out.print("Card Security Num: ");
            int CardSecurityNum = Integer.parseInt(in.nextLine());
            try {
                db.addPayment(PaymentMethod, PaymentName, PaymentDate, CardFName, CardLName, CardNumber, CardExpireMonth, CardExpireYear, CardSecurityNum);
            } catch (SQLException ex) {
            Logger.getLogger(TestDB.class.getName()).log(Level.SEVERE, null, ex);    
            }
            System.out.println("User is added to the database.");
    }        
            
    private void testRead() throws SQLException{            
            // Find a user by username / password
            System.out.print("User searchID: ");
            int searchID = Integer.parseInt(in.nextLine());
            Payment payment = db.findPayment(searchID);
            if (payment != null) {
                System.out.println("Student " + payment.getPaymentID() + " exists in the database.");
            } else {
                System.out.println("Student does not exist.");
            }
    }       
            
    private void testUpdate(){
        System.out.print("Payment ID: ");
        int PaymentID = Integer.parseInt(in.nextLine());

        try {
            if (db.checkPayment(PaymentID)) {
                System.out.print(" PaymentName: ");
                String PaymentName = in.nextLine();
                System.out.print(" PaymentMethod: ");
                String PaymentMethod = in.nextLine();
                System.out.print(" CardFName: ");
                String CardFName = in.nextLine();
                System.out.print(" CardLName: ");
                String CardLName = in.nextLine();
                System.out.print(" CardNumber: ");
                int CardNumber = Integer.parseInt(in.nextLine());
                System.out.print(" CardExpire: ");
                String CardExpire = in.nextLine();
                System.out.print("Card Security Num: ");
                int CardSecurityNum = Integer.parseInt(in.nextLine());
            } else {
                System.out.println("Payment does not exist.");
            }
        } catch (SQLException ex) {
            Logger.getLogger(TestDB.class.getName()).log(Level.SEVERE, null, ex);    
        }
        System.out.println("Payment is updated.");
    }        
            
    private void testDelete(){
        System.out.print("Payment ID: ");
        int PaymentID = Integer.parseInt(in.nextLine());
        try {
           if (db.checkPayment(PaymentID)) {
                db.deletePayment(PaymentID);
           } else {
                System.out.println("Payment does not exist.");
           }
        } catch (SQLException ex) {
            Logger.getLogger(TestDB.class.getName()).log(Level.SEVERE, null, ex);    
        }
        System.out.println("Payment is deleted from the database.");
    }
    
    private void showAll(){
        try {
            ArrayList<Payment> payments = db.fetchPayments();
            System.out.println("STUDENTS TABLE: ");
            payments.stream().forEach((payment) -> {
                System.out.printf("|%-20s |%-30s |%-20s |%-20s |%-20s |%-20s|%-20s|%-20s|%-20s|\n", payment.getPaymentID(), payment.getPaymentMethod(), payment.getPaymentName(), payment.getCardfname(), payment.getCardlname(), payment.getCardnumber(), payment.getCardexpiremonth(), payment.getCardexpireyear(), payment.getCcpin());
            });
            System.out.println();
        } catch (SQLException ex) {
            Logger.getLogger(TestDB.class.getName()).log(Level.SEVERE, null, ex);    
        }
        System.out.println("Student is all shown from the database.");
    }
}

