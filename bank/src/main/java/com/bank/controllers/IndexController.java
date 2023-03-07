
package com.bank.controllers;

import com.bank.repository.UserRepository;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author aminatadiallo
 */
@Controller
public class IndexController {
    
    private UserRepository userRepository;
    
    @GetMapping("/") 
    public ModelAndView getIndex(){
       ModelAndView getIndexPage = new ModelAndView("index");
       getIndexPage.addObject("PageTitle", "Home");
       System.out.println("In index Page controller");
        return getIndexPage ;
    }
    
    
    
     @GetMapping("/error") 
    public ModelAndView getError(){
       ModelAndView getErrorPage = new ModelAndView("error");
       System.out.println("In Error Page controller");
       getErrorPage.addObject("PageTitle", "Error");
       
        return getErrorPage ;
    }
    
     @GetMapping("/verify") 
    public ModelAndView getVerify(@RequestParam("token")String token, @RequestParam("code")String code){
       ModelAndView getVerifyPage ;
       
       String dbToken = userRepository.checkToken(token);
       
       if(dbToken ==null){
           getVerifyPage = new ModelAndView("error");
           getVerifyPage.addObject("error", "This session has expired");
           return getVerifyPage;
       }
       userRepository.verifyAccount(token,code);
       System.out.println("In Verify Account controller");
       getVerifyPage = new ModelAndView("login");
       getVerifyPage.addObject("success", "Account Verify successfuly, Please log In");
       
        return getVerifyPage;
    }
    
}
