class Request < ApplicationRecord
    belongs_to :trip
    belongs_to :department
    belongs_to :status
    
    validates :department_id, :amount, presence: true
    validates :amount, numericality: {greater_than_or_equal_to: 0.01}
    validate :authform_status

    before_destroy :authform_status
    before_destroy :reim_form_status
    
    private 
    
    def authform_status
       if self.trip.authorization_form.status.name == "Approved"
            errors.add(" ","Form has already been approved")
            throw :abort 
       end
    end

    def reim_form_status
       if self.trip.reimbursement_form.status.name == "Approved"
            errors.add(" ","You cannot delete a form has already been approved")
            throw :abort 
       end
    end
    
end
