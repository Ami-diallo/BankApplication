<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA_Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="./css/style.css"> 
    <title>Register</title>
</head>
<body>
    <body class="d-flex align-items-center justify-content-center">
        <div class="card registration-form-card col-6 bg-transparent border-0">
            <div class="card-body">
                <h1 class="form-header card-title mb-3">
                    <i class="fa fa-edit"></i> Register</h1>
                    
                    <c:if test="${requestScope.passwordMisMatch != null}">
                        <div class="alert alert-danger text-center boder border-danger">
                            <b>${requestScope.passwordMisMatch}</b>
                        </div>
                    </c:if>
                
                  <c:if test="${requestScope.sucess!= null}">
                        <div class="alert alert-sucess text-center boder border-sucess">
                            <b>${requestScope.sucess}</b>
                        </div>
                    </c:if>
                    
               <form:form action="/register" class="reg-form" modelAttribute="registerUser">
                <div class="row">
                    <div class="form-group col">
                        <form:input type="text" path="firstname" class="form-control form-control-lg" placeholder=" Enter First Name"/>
                            <form:errors path="firstname" class="text_white bg-danger"/>
                    </div>
                    <div class="form-group col">
                        <form:input type="text" path="lastname" class="form-control form-control-lg" placeholder=" Enter Last Name"/>
                         <form:errors path="lastname" class="text_white bg-danger"/>
                    </div>

                </div>
                <div class="form-group col">
                    <form:input type="email" path="email" class="form-control form-control-lg" placeholder=" Enter Email"/>
                     <form:errors path="email" class="text_white bg-danger"/>
                </div>
                <div class="row">
                    <div class="form-group col">
                        <form:input type="password" path="password" class="form-control form-control-lg" placeholder=" Enter Password"/>
                        <form:errors path="password" class="text_white bg-danger"/>
                    </div>
                    <div class="form-group col">
                        <input type="password" name="confirm_password" class="form-control form-control-lg" placeholder=" Confirm Password">
                            <small class="text-white bg-danger">${confirm_pass}</small>
                    </div>
                </div>
                <div class="form-group col">
                    <button class="btn btn-lg"> Register</button>
                </div>

               </form:form>
               <p class="card-text text-white my-2">
                Already have an account? <span class="ms-2"><a href="/login" class="btn bt-sm text-warning">Sign In</a></span>
               </p>
               <small class="text-warning " >
                <i class="fa fa-arrow-alt-circle-left"></i>
                <a href="/" class="btn btn-sm  text-warning">Back</a>
               </small>
            </div>

        </div>
       

</body>
</html>
