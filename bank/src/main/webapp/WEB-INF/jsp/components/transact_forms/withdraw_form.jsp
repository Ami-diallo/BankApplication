<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

 <div class="card withdraw-card">
        <div class="body-card">
             
            <form action="" class="withdraw-form">
            <div class="form-group mb-2">
            <label for="">Withdraw Amount</label>
            <input type="text" name="withdraw_amount" class="form-control" placeholder="Enter Withdraw Amount">
        </div>

            <div class="form-group">
                <label for="">Select Account</label>
            <select name="account_id" class="form-control" id="">
                <option value="">-- Select Account --</option> 
              </select>
            </div>

            <div class="form-group my-2">
               <button id="transaction-btn" class="btn btn-md ">Withdraw</button>
            </div>
        </form>
        </div>
      </div>
