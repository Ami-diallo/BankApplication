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
    <link rel="stylesheet" href="../css/main.css"> 
    <script src="../js/bootstrap.bundle.js" ></script>
   
    <title>Dashboard</title>
</head>
<body>
    
 <c:import url="components/transact_offcanvas.jsp"/>
 
 
 
  <c:import url="components/add_account_offcanvas.jsp"/>
  
  <div class="container">
       <c:if test="${success!= null}">
                        <div class="alert alert-info text-center boder border-info">
                            <b>${success}</b>
                        </div>
                    </c:if>
  
  <c:if test="${error!= null}">
              <div class="alert alert-error text-center boder border-error">
                    <b>${error}</b>
                        </div>
                    </c:if>
      
  </div>
  
  <c:choose>
      <c:when test="${fn:length(userAccounts) >0}">
          <c:import url="components/account_display.jsp"/>
      </c:when>
      <c:otherwise>
          <c:import url="components/no_accounts_display.jsp"/>
          </c:otherwise>
    </c:choose>
  
   <c:import url="components/incl/footer.jsp"/>

</body>
</html>
