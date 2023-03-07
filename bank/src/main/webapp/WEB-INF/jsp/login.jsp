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
    <script src="./js/code.js" defer></script>
    <title>Login</title>
</head>
<body>
    <body class="d-flex align-items-center justify-content-center">
        <div class="card login-form-card col-4 bg-transparent border-0">
            <div class="card-body">
                <h1 class="form-header card-title mb-3">
                    <i class="fa fa-user"></i> Login</h1>
                    
                    <c:if test="${requestScope.sucess!= null}">
                        <div class="alert alert-sucess text-center boder border-sucess">
                            <b>${requestScope.sucess}</b>
                        </div>
                    </c:if>
                
                    <c:if test="${requestScope.error!= null}">
                        <div class="alert alert-error text-center boder border-error">
                            <b>${requestScope.error}</b>
                        </div>
                    </c:if>
                
                 <c:if test="${logged_out!= null}">
                        <div class="alert alert-info text-center boder border-info">
                            <b>${logged_out}</b>
                        </div>
                    </c:if>
                
               <form action="/login" method="POST" class="login-form">
                
                <div class="form-group col">
                    <input type="email" name="email" class="form-control form-control-lg" placeholder=" Enter Email"/>

                </div>
                <div class="row">
                    <div class="form-group col">
                        <input type="password" name="password" class="form-control form-control-lg" placeholder=" Enter Password"/>

                    </div>
                    
                    <div class="form-group col">
                        <input type="hidden" name="_token" value="${token}"/>

                    </div>
                    
                </div>
                <div class="form-group col">
                    <button class="btn btn-lg"> Login</button>
                </div>

               </form>
               <p class="card-text text-white my-2">
                Don't have an account? <span class="ms-2"><a href="/register" class="btn bt-sm text-warning">Sign Up</a></span>
            </p>
               </p>
               <small class="text-warning " >
                <i class="fa-regular fa-circle-arrow-left"></i>
                <a href="/" class="btn btn-sm  text-warning">Back</a>
               </small>
            </div>

        </div>
       

</body>
</html>
