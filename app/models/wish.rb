class Wish < ApplicationRecord
    belongs_to :authorization_form
    belongs_to :expense_type
    
    validates :cost, :authorization_form, :expense_type_id, presence: true
    validates :cost, numericality: {greater_than_or_equal_to: 0.01}
    validate :authform_status
    
    before_destroy :authform_status
    
    private 
    
    def authform_status
       if self.authorization_form.status.name == "Approved"
            errors.add(" ","Form has already been approved")
            throw :abort 
       end
    end

end
