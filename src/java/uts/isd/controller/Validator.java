/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uts.isd.controller;

import java.io.Serializable;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Dinh Phan
 */
public class Validator implements Serializable{ 
    private String namePattern = "^[a-zA-Z \\-\\.\\']*"; /* This pattern will match if the user has multiple names in a first or last name with punctuation, i.e. O'Brien */
    private String ccpinPattern = "^[0-9]{3}$"; /* This pattern will match number from 001 to 999 */
    
    public Validator() {     }
    
    public boolean validate(String pattern, String input){       
      Pattern regEx = Pattern.compile(pattern);       
      Matcher match = regEx.matcher(input);       
      return match.matches(); 
   }
    
    public boolean validateName(String name){
      return validate(namePattern,name); 
    }
    public boolean validateCcpin(String name){
      return validate(ccpinPattern,name); 
    }
    
    public void clear(HttpSession session) {
       session.setAttribute("firstNameErr", "");
       session.setAttribute("lastNameErr", "");  

   }
}
