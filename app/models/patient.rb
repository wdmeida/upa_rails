class Patient < ApplicationRecord
  validates :name, presence: true
  validates :birth, presence: true
  validates :phone, presence: true
end
