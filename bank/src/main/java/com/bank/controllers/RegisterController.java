
package com.bank.controllers;

import com.bank.helpers.HTML;
import com.bank.helpers.Token;
import com.bank.mailMessenger.MailMessenger;
import com.bank.models.User;
import com.bank.repository.UserRepository;
import jakarta.mail.MessagingException;
import jakarta.validation.Valid;
import java.util.Random;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author aminatadiallo
 */
@Controller
public class RegisterController {
    
    @Autowired
    private UserRepository userRepository;
    
     @GetMapping("/register") 
    public ModelAndView getRegister(){
       ModelAndView getRegisterPage = new ModelAndView("register");
       System.out.println("In Register Page controller");
       getRegisterPage.addObject("PageTitle", "Register");
       
        return getRegisterPage ;
    }
    
    @PostMapping("/register")
    public ModelAndView register(@Valid @ModelAttribute("registerUser")User user,
            BindingResult result,
            @RequestParam("firstname") String firstname,
            @RequestParam("lastname") String lastname,
            @RequestParam("email") String email,
            @RequestParam("password") String password,
            @RequestParam("confirm_password") String confirm_password) throws MessagingException{
        
        ModelAndView registrationPage = new ModelAndView("register");
        
        //Check for errors
        if(result.hasErrors()&& confirm_password.isEmpty()){
            registrationPage.addObject("confirm_pass", "The confirm password is required");
            return registrationPage;
        }
        
        // Check passaword match
        if(!password.equals(confirm_password)){
            registrationPage.addObject("confirmMisMatch", "passwords do not match");
            return registrationPage;
        }
        
        // get token string
        String token = Token.generateToken();
        
        //generate random code
        Random rand = new Random();
        int bound = 123;
        int code = bound + rand.nextInt(bound);
        
        //get email html body
        String emailBody= HTML.htmlEmailTemplate(token,  code);
        
        //hash password
        String hashed_password = BCrypt.hashpw(password, BCrypt.gensalt());
        
        //register user
        userRepository.registerUser(firstname, lastname, email, hashed_password, token, code);
        
        //send email notification
        MailMessenger.htmlEmailMessenger("bankapptesting@gmail.com", email, "verify account",emailBody);
        
        //return to register page
        String successMessage="Account Registered Successfuly, Please check your email and verify account";
        registrationPage.addObject("sucess", successMessage);
        return registrationPage;
    }
    
}
