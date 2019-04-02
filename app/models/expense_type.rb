class ExpenseType < ApplicationRecord
    before_destroy :ensure_not_referenced_by_any_wishes_receipts
    has_many :wishes
    has_many :receipts
    
    validates :name, presence: true
    
    private
    def ensure_not_referenced_by_any_wishes_receipts
        unless wishes.empty?
            errors.add(:base, 'There are wishes associated with this type')
            throw :abort
        end
        
        unless receipts.empty?
            errors.add(:base, 'There are receipts associated with this type')
            throw :abort
        end
    end
end
