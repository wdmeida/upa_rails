class Doctor < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :rememberable, :trackable, :validatable

  belongs_to :specialization
  
  has_many :appointments
  has_many :patients, :through => :appointments

  phone_format = 

  # Gem Money Rails
  monetize :salary_cents, :numericality => { :greater_than => 0 }

  validates :name, presence: true, 
                   length: { minimum: 5 }
  validates :crm, presence: true, 
                  length: { minimum: 5 },
                  format: {
                            with: PatternValidation::CRM,
                            message: I18n.t('messages.field_invalid')
                          }
  validates :phone, presence: true, 
                    format: { 
                              with: PatternValidation::PHONE, 
                              message: I18n.t('messages.field_invalid') 
                            }
end
