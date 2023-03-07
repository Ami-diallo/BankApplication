<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<div class="container">
    <div class="card no-accounts-card">
        <div class="card-body">
            <h1 class="card-title">
                <i class="fa fa-ban text-danger">NO Registered Accounts</i>
            </h1>
            <div class="card-text">
             You currently don't have any registered accounts.<br>
             Please click below to register/add new account
            </div><br>
            <button id="" class="btn btn-primary btn-lg shadow" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasRight" aria-controls="offcanvasRight">
                <i class="fa fa-credit-card"></i> Add New account
               </button>
        </div>
    </div>
</div>
