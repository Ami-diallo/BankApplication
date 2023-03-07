
package com.bank.helpers;

import java.util.UUID;

/**
 *
 * @author aminatadiallo
 */
public class Token {
    
    public static String generateToken(){
        String token = UUID.randomUUID().toString();
        return token;
    }
    
}
