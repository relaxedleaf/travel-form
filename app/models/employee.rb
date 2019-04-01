class Employee < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  belongs_to :department
  
  has_many :trips
  has_many :authorization_forms
  has_many :reimbursement_forms
  
  validates :department_id, :fname, :lname, :ssn, :bdate, presence: true
  validates :ssn, uniqueness: true
end
