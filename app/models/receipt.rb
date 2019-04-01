class Receipt < ApplicationRecord
    mount_uploader :image, ImageUploader
    belongs_to :reimbursement_form
    belongs_to :expense_type
    
    validates :reimbursement_form_id, :location, :receipt_date, :expense_type_id, presence: true
    
    validates :image_url, allow_blank: true, format: {
        with: %r{\.(gif|jpg|png|jpeg)\Z}i,
        message: 'must be a URL for GIF, JPG, jpeg or PNG image'
    }
    
    validates :cost, numericality: {greater_than_or_equal_to: 0.01}

    accepts_nested_attributes_for :expense_type
end
