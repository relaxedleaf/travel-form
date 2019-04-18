class ReceiptsRequest < ApplicationRecord
    belongs_to :department
    belongs_to :status
    belongs_to :reimbursement_forms
    
    
    validates :department_id, :total_amount, :reimbursement_form_id, presence: true
    validates :total_amount, numericality: {greater_than_or_equal_to: 0.01}
    validate :authform_status
    
    before_destroy :authform_status
    
    private 
    
    def authform_status
       if self.trip.authorization_form.status.name == "Approved"
            errors.add(" ","Form has already been approved")
            throw :abort 
       end
    end
end
