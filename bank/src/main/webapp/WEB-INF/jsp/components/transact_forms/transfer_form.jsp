<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<div class="card transfer-card">
        <div class="body-card">
            
            <div class="form-group">
                <label for="">Select Account</label>
            <select name="account_id" class="form-control" id="">
                <option value="">-- Select Account --</option> 
              </select>
            </div>

            <div class="form-group">
                <label for="">Select Account</label>
            <select name="account_id" class="form-control" id="">
                <option value="">-- Select Account --</option> 
              </select>
            </div>
       
            
            <div class="form-group mb-2">
                <label for="">Transfer Amount</label>
                <input type="text" name="transfer_amount" class="form-control" placeholder="Enter Transfer Amount">
            </div>

            <div class="form-group my-2">
               <button id="transaction-btn" class="btn btn-md transaction-btn">Transfer</button>
            </div>

        </div>
      </div>
