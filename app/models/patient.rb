class Patient < ApplicationRecord
  
  include FriendlyId
  friendly_id :name, use: :slugged

  has_many :appointments
  has_many :doctors, :through => :appointments

  # Constants
  GENRES = {:male => 0, :female => 1}

  enum :genre => GENRES

  validates :name, presence: true
  validates :birth, presence: true
  validates :phone, presence: true, 
                    format: { 
                              with: PatternValidation::PHONE, 
                              message: I18n.t('messages.field_invalid') 
                            }
  validates :cpf, presence: true,
                  format: {
                            with: PatternValidation::CPF,
                            message: I18n.t('messages.field_invalid')
                          }
  validates :genre, presence: true
end
