
package com.bank.mailMessenger;

import com.bank.config.MailConfig;
import jakarta.mail.MessagingException;
import jakarta.mail.internet.MimeMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;

/**
 *
 * @author aminatadiallo
 */
public class MailMessenger {
    
    public static void htmlEmailMessenger(String from, String toMail, String subject, String body) throws MessagingException{
        
        JavaMailSender sender = MailConfig.getmailConfig();
        MimeMessage message = sender.createMimeMessage();
        MimeMessageHelper htmlMessage = new MimeMessageHelper(message,true);
        
        //Set Mail Attributes
        htmlMessage.setTo(toMail);
        htmlMessage.setFrom(from);
        htmlMessage.setSubject(subject);
        htmlMessage.setText(body,true);
        
        sender.send(message);
    }
    
}
