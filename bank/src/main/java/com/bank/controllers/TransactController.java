
package com.bank.controllers;

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
@RequestMapping("/transact")
public class TransactController {
    
    @Autowired
    private AccountRepository accountRepository;
    
    @PostMapping("/deposit")
    public String deposit(@RequestParam("depositt_amount")String depositAmount,
                           @RequestParam("account_id")String accountID,
                            HttpSession session,
                            RedirectAttributes redirectAttributes){
        
        if(depositAmount.isEmpty()|| accountID.isEmpty()){
            redirectAttributes.addFlashAttribute("error", "Deposit Amount cannot be empty");
            
            return "redirect:/app/dashboard";
        }
        User user = (User)session.getAttribute("user");
        
        int acc_id = Integer.parseInt(accountID);
        
        double depositAmountValue = Double.parseDouble(depositAmount);
        
        if(depositAmountValue==0){
           redirectAttributes.addFlashAttribute("error", "Deposit Amount cannot be empty");
             return "redirect:/app/dashboard";
        }
        double currentBalance = accountRepository.getAccountbalance(user.getUser_id(), acc_id);
       
        
        double newBalance = currentBalance + depositAmountValue;
        
        accountRepository.changeAccountBalanceById(newBalance, acc_id);
       redirectAttributes.addFlashAttribute("success", " Amount Deposited successfuly");
             return "redirect:/app/dashboard";
        
    }
}
