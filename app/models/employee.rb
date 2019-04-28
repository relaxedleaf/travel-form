class Employee < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  belongs_to :department
  
  has_many :trips, :dependent => :destroy
  has_many :authorization_forms, :dependent => :destroy
  has_many :reimbursement_forms, :dependent => :destroy
  
  validates :department_id, :email, :fname, :lname, :ssn, :bdate, presence: true
  validates :email, :ssn, uniqueness: true
  validates :email, format: {with: URI::MailTo::EMAIL_REGEXP}
  
  
  def hello
    @hello = "hello"
  end
end
