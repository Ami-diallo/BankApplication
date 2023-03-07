
package com.bank.controllers;

import com.bank.helpers.Token;
import com.bank.models.User;
import com.bank.repository.UserRepository;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

/**
 *
 * @author aminatadiallo
 */
@Controller
public class AuthController {
    
    @Autowired
    private UserRepository userRepository;
    
    @GetMapping("/login") 
    public ModelAndView getLogin(){
       System.out.println("In Login Page controller");
       ModelAndView getLoginPage = new ModelAndView("login");
       String token = Token.generateToken();
       getLoginPage.addObject("token", token);
       getLoginPage.addObject("PageTitle", "Login");
       
        return getLoginPage ;
    }
    @PostMapping("/login")
    public String login(@RequestParam("email")String email,
            @RequestParam("password")String password,
            @RequestParam("_token")String token,
            Model model,
            HttpSession session){
        
        //validate input fields
        if(email.isEmpty() || email==null || password.isEmpty()|| password==null){
            model.addAttribute("error","username or password cannot be empty");
            return "login";
        }
        
        //check if email exist
        String getEmailDatabase = userRepository.getUserEmail(email);
        
        if(getEmailDatabase!=null){
            String getPasswordDatabase = userRepository.getUserPassword(getEmailDatabase);
            
            //validate password
            if(!BCrypt.checkpw(password, getPasswordDatabase)){
                model.addAttribute("error","Incorrect username or password");
                return "login";
            
            }
            
            }else{
                model.addAttribute("error","Something was wrong");
                return "error";
            
        }
        //check if account user verifie
      
        
        int verified = userRepository.isVerified(getEmailDatabase);
        
        if(verified !=1){
            model.addAttribute("error","This Account is not verified yet");
                return "login";
        }
        User user= userRepository.getUserDetails(getEmailDatabase);
         
        session.setAttribute("user", user);
        session.setAttribute("token", token);
        session.setAttribute("authenticated", true);
        
        return "redirect:app/dashboard";
    } 
    
    @GetMapping("/logout")
    public String logout(HttpSession session, RedirectAttributes redirectAttributes){
        session.invalidate();
        redirectAttributes.addFlashAttribute("logged_out", "logout successfuly");
        return "redirect:/login";
        
    }
    
    
}
