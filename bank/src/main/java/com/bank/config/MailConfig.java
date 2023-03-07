
package com.bank.config;

import java.util.Properties;
import org.springframework.context.annotation.Bean;
import org.springframework.mail.javamail.JavaMailSenderImpl;

/**
 *
 * @author aminatadiallo
 */
public class MailConfig {
    
    @Bean
    public static JavaMailSenderImpl getmailConfig(){
        JavaMailSenderImpl emailConfig = new JavaMailSenderImpl();
        
        //Set properties
        Properties props = emailConfig.getJavaMailProperties();
        props.put("mail.transport.protocol", "smtp");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.debug", "true");
        
        //set email
        emailConfig.setHost("smtp.gmail.com");
        emailConfig.setPort(25);
        emailConfig.setUsername("bankapptesting@gmail.com");
        emailConfig.setPassword("password123.");
        
        return emailConfig;
    }
    
}
