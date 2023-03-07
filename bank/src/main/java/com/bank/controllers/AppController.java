
package com.bank.controllers;

import com.bank.models.Account;
import com.bank.models.User;
import com.bank.repository.AccountRepository;
import jakarta.servlet.http.HttpSession;
import java.math.BigDecimal;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author aminatadiallo
 */
@Controller
@RequestMapping("/app")
public class AppController {
    
    @Autowired
    private AccountRepository accountRepository;
    
    @GetMapping("/dashboard")
    public ModelAndView getDashboard(HttpSession session){
    ModelAndView getDashboardPage = new ModelAndView("dashboard");  
    
    User user = (User)session.getAttribute("user");
    
    List<Account> getUserAccounts = accountRepository.getUserAccountById(user.getUser_id());
   
    BigDecimal totalAccountsBalance = accountRepository.getTotalBalance(user.getUser_id());
    
    getDashboardPage.addObject("userAccounts", getUserAccounts);
    getDashboardPage.addObject("totalBalance", totalAccountsBalance);
    
    return getDashboardPage;
    }
}
