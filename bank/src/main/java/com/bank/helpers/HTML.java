
package com.bank.helpers;

/**
 *
 * @author aminatadiallo
 */
public class HTML {
    
    public static String htmlEmailTemplate( String token, int code){
    
        String url = "http://127.0.0.1:8070/verify?token" + token +"&code" + code;
        
        String emailTemplate = "<!DOCTYPE html>\n" +
"<html lang='en'>\n" +
"<head>\n" +
"    <meta charset='UTF-8'>\n" +
"    <meta http-equiv='X-UA_Compatible\" content=\"IE=edge'>\n" +
"    <meta name='viewport' content='width=device-width, initial-scale=1.0'>\n" +
"    <link href='https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css\" rel=\"stylesheet\" integrity=\"sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD\" crossorigin=\"anonymous'>\n" +
"    <script src='https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js\" integrity=\"sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN\" crossorigin=\"anonymous'></script>\n" +
"   <!-- <link rel='stylesheet' href='./css/email.css'> -->\n" +
"   <!-- <script src='./js/code.js' defer></script>-->\n" +
"   <style>\n" +
"    *{\n" +
"    box-sizing: border-box;\n" +
"    font-family: comfortaa;\n" +
"}\n" +
"\n" +
"body{\n" +
"    height: 100vh;\n" +
"    background-color: rgb(212,222,230);\n" +
"    display: flex;\n" +
"    align-items: center;\n" +
"    justify-content: center;\n" +
"}\n" +
"\n" +
".wrapper{\n" +
"    width: 550px;\n" +
"    height: auto;\n" +
"    padding: 15px;\n" +
"    background-color: white;\n" +
"    border-radius: 7px;\n" +
"}\n" +
"\n" +
".email-msg-header{\n" +
"    text-align: center;\n" +
"}\n" +
"\n" +
".company-name{\n" +
"    width: 100%;\n" +
"    color: gray;\n" +
"    font-size: 35px;\n" +
"    text-align: center;\n" +
"}\n" +
"\n" +
".welcome-text{\n" +
"    text-align: center;\n" +
"}\n" +
".verify-account-btn{\n" +
"    padding: 15px;\n" +
"    background-color: rgb(0,100,252);\n" +
"    text-decoration: none;\n" +
"    color: white;\n" +
"    border-radius: 5px;\n" +
"}\n" +
".copy-right{\n" +
"    padding: 15px;\n" +
"    color: gray;\n" +
"    font-size: 14px;\n" +
"    margin: 20px 0px;\n" +
"    display: flex;\n" +
"    align-items: center;\n" +
"    justify-content: center;\n" +
"}\n" +
"   </style>\n" +
"    <title>Email</title>\n" +
"</head>\n" +
"<body>\n" +
"    <div class='wrapper'>\n" +
"        <h2 class='email-msg-header'>\n" +
"            Welcome and Thank You for choosing\n" +
"        </h2>\n" +
"        <div class='company-name'>Modern Bank</div> \n" +
"        <hr>\n" +
"       <p class='welcome-text'>\n" +
"       Your Account has been successfuly registered, please click below to verify your account\n" +
"       </p>\n" +
"       <br>\n" +
"       <br>\n" +
"\n" +
"       <center><a href='"+url+"' class='verify-account-btn' role='button'>verify Account</a></center>\n" +
"\n" +
"       <div class='copy-right'>\n" +
"        &copy; copy Right 2023. All Rights Reserved\n" +
"       </div>\n" +
"    </div>\n" +
"\n" +
"</body>\n" +
"</html>";
        
        return emailTemplate;
        
    }
    
}
