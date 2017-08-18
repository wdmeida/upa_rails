class Doctor < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :rememberable, :trackable, :validatable

  belongs_to :specialization

  validates :name, presence: true, length: { minimum: 5 }
  validates :salary, presence: true
  validates :crm, presence: true, length: { minimum: 5 }
  
end
