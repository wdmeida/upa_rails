class Doctor < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :rememberable, :trackable, :validatable

  belongs_to :specialization
  
  has_many :appointments
  has_many :patients, :through => :appointments

  # Gem Money Rails
  monetize :salary_cents

  validates :name, presence: true, length: { minimum: 5 }
  validates :crm, presence: true, length: { minimum: 5 }
  validates :phone, presence: true
end
