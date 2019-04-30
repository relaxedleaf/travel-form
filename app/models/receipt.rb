class Receipt < ApplicationRecord
    mount_uploader :image, ImageUploader
    belongs_to :expense_type
    belongs_to :receipts_request
    belongs_to :reimbursement_form

    validates :location, :receipt_date, :expense_type_id, presence: true
    
    validates :image_url, allow_blank: true, format: {
        with: %r{\.(gif|jpg|png|jpeg)\Z}i,
        message: 'must be a URL for GIF, JPG, jpeg or PNG image'
    }
    
    validates :cost, numericality: {greater_than_or_equal_to: 0.01}
    
    after_update :change_status
    
    def change_status
        @reimbursement_forms = ReimbursementForm.find(self.reimbursement_form_id)
        #Rails.logger.debug "sadasdasd" + @reimbursement_forms.status_id.to_s
        @reimbursement_forms.update_attribute(:status_id, 1)
    end

end
