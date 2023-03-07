
package com.bank.controllers;

import com.bank.helpers.GenAccountNumber;
import com.bank.models.User;
import com.bank.repository.AccountRepository;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

/**
 *
 * @author aminatadiallo
 */
@Controller
@RequestMapping("/account")
public class AccountController {
    
    @Autowired
    private AccountRepository accountRepository;
    
    @PostMapping("/create_account")
    public String createAccount(@RequestParam("account_name")String accountName,
                                 @RequestParam("account_type")String accountType,
                                 RedirectAttributes redirectAttributes,
                                 HttpSession session){
        //Check for empty strings
        if(accountName.isEmpty()|| accountType.isEmpty()){
          redirectAttributes.addFlashAttribute("error", "Account name and Account type cannot be empty");
          return "redirect:/app/dashboard";
        }
        //Get logged in user
        User user = (User)session.getAttribute("user");
        
        //Generate account number
        int setAccountNumber = GenAccountNumber.generateAccountNumber();
        String bankAccountNumber = Integer.toString(setAccountNumber);
        
        //create account
        accountRepository.createBankAccount(user.getUser_id(),bankAccountNumber,accountName,accountType);
        
        //success message
        redirectAttributes.addFlashAttribute("success", "Account created successfuly");
        return "redirect:/app/dashboard";
    }
    
}
