class Receipt < ApplicationRecord
    mount_uploader :image, ImageUploader
    belongs_to :reimbursement_form
    belongs_to :expense_type
    
    validates :image_url, allow_blank: true, format: {
        with: %r{\.(gif|jpg|png|jpeg)\Z}i,
        message: 'must be a URL for GIF, JPG, jpeg or PNG image'
    }
end
