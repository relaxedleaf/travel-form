module ApplicationHelper
  def current_class?(test_path)
    return 'active' if request.path == test_path
  end
  
  def check_manager
    if PaymentManager.where(:employee_ssn => current_employee.ssn).present? || Department.where(:manager_ssn => current_employee.ssn).present?
      return true
    else
      return false
    end
  end
  
  def check_paymentmanager
    if PaymentManager.where(:employee_ssn => current_employee.ssn).present?
      return true
    else
      return false
    end
  end
  
  def trip_destination(destination)
    return destination.country + " " + destination.state + " " + destination.city
  end
end
