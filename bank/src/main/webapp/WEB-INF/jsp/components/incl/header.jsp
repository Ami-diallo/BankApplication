<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<header class="main-page-header mb-3 bg-dark">
    <div class="container d-flex align-items-center">
    <div class="company-name">
        Modern bank
    </div>
    <nav class="navigation">
        <li><a href="">Dashboard</a></li>
        <li><a href="">Transaction History</a></li>
        <li><a href="">Payment History</a></li>
    </nav>
    <div class="display-name ms-auto text-white">
       <i class="fa fa-circle text-sucess me-2"></i>Welcome: <span>${user.firstname} ${user.lastname}</span>
    </div>
    <a href="/logout" class="btn btn-sm text-white ms-2">
        <i class="fa fa-sign-out me-2" aria-hidden="true"> Sign Out</i>
    </a>
    </div>

</header>

