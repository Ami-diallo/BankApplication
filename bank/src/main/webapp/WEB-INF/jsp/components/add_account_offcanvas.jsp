<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasRight" aria-labelledby="offcanvasRightLabel">
    <div class="offcanvas-header">
      <h5 id="offcanvasRightLabel" class="text-white">Create / Add an Account</h5>
      <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
    </div>
    <div class="offcanvas-body">
      <div class="card">
        <div class="card-body">
        <form action="/account/create_account" method="POST" class="add-account-form">
            <div class="form-group mb-3">
                <label for=""> Enter Account Name</label>
               <input type="text" name="account_name" class="form-control" placeholder="Enter account name">
            </div>
            <div class="form-group mb-3">
                <label for=""> Select Account Type</label>
               <select name="account_type" class="form-control" id="">
                <option value="">-- Select Account Type --</option>
                <option value="check">Check</option>
                <option value="savings">Savings</option>
               </select>
            </div>

            
            <div class="form-group my-2">
                <button id="transaction-btn" class="btn btn-md ">Add Account</button>
             </div>
        </form>
    </div>
      </div>

    </div>
  </div>

