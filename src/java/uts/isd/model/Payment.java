/*
 *
 */
package uts.isd.model;

import java.util.Date;

/**
 *
 * @author Dinh Phan
 */
public class Payment {
    private int paymentID;
    private String paymentMethod;
    private String paymentName;
    private String paymentDate;
    private String cardfname;
    private String cardlname;
    private long cardnumber;
    private String cardexpiremonth;
    private String cardexpireyear;
    private int ccpin;
    
   // Initilise the field constructor 
    public Payment(int paymentID, String paymentMethod, String paymentName, String paymentDate, String cardfname, String cardlname, long cardnumber, String cardexpiremonth, String cardexpireyear, int ccpin) {
        this.paymentID = paymentID;
        this.paymentMethod = paymentMethod;
        this.paymentName = paymentName;
        this.paymentDate = paymentDate;
        this.cardfname = cardfname;
        this.cardlname = cardlname;
        this.cardnumber = cardnumber;
        this.cardexpiremonth = cardexpiremonth;
        this.cardexpireyear = cardexpireyear;
        this.ccpin = ccpin;
    }


    // Create getter/setter method   
    public int getPaymentID() {
        return paymentID;
    }

    public void setPaymentID(int paymentID) {
        this.paymentID = paymentID;
    }

    public String getPaymentMethod() {
        return paymentMethod;
    }

    public void setPaymentMethod(String paymentMethod) {
        this.paymentMethod = paymentMethod;
    }

    public String getPaymentName() {
        return paymentName;
    }

    public void setPaymentName(String paymentName) {
        this.paymentName = paymentName;
    }

    public String getPaymentDate() {
        return paymentDate;
    }

    public void setPaymentDate(String paymentDate) {
        this.paymentDate = paymentDate;
    }

    public String getCardfname() {
        return cardfname;
    }

    public void setCardfname(String cardfname) {
        this.cardfname = cardfname;
    }

    public String getCardlname() {
        return cardlname;
    }

    public void setCardlname(String cardlname) {
        this.cardlname = cardlname;
    }

    public long getCardnumber() {
        return cardnumber;
    }

    public void setCardnumber(long cardnumber) {
        this.cardnumber = cardnumber;
    }

    public String getCardexpiremonth() {
        return cardexpiremonth;
    }

    public void setCardexpiremonth(String cardexpiremonth) {
        this.cardexpiremonth = cardexpiremonth;
    }

    public String getCardexpireyear() {
        return cardexpireyear;
    }

    public void setCardexpireyear(String cardexpireyear) {
        this.cardexpireyear = cardexpireyear;
    }

    public int getCcpin() {
        return ccpin;
    }

    public void setCcpin(int ccpin) {
        this.ccpin = ccpin;
    }


}
