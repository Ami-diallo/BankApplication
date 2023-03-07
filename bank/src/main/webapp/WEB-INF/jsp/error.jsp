<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA_Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
    <link rel="stylesheet" href=""> 
    <style>
        *{
            box-sizing: border-box;
            font-family: comfortaa;
        }
        body{
            height: 100vh;
            background-size: cover;
            background-image: url("./images/background.jpeg");
            background-position: center center;
            background-repeat: no-repeat;
        }
        .card .card-text{
            font-size: 16px;
        }
        .card{
            box-shadow: 0px 3px 6px rgb(0,14,53);
        }
    </style>
    <title>Error</title>
</head>
<body>
    <body class="d-flex align-items-center justify-content-center">
        <div class="card col-4 alert alert-danger border border-danger text-danger">
            <h3 class="card-title">
                <i class="fa fa-window-close"></i>Errors:
            </h3>
                <hr>
                <div class="card-body">
                    <p class="card-text">
                        
                        <c:if test="${requestScope.error != null}">
                        <div class="alert alert-danger text-center boder border-danger">
                            <b>${requestScope.error}</b>
                        </div>
                    </c:if>
                    </p>
                    <hr>
                    <a href="/login" class="btn btn-sm btn-danger">
                      <i class="fa fa-arrow-alt-circle-left me-1"></i>Back
                    </a>
                </div>
            
        </div>
    </body>  
        

</body>
</html>
