class Patient < ApplicationRecord
  has_many :appointments
  has_many :doctors, :through => :appointments

  # Constants
  GENRES = {:male => 0, :female => 1}

  enum :genre => GENRES

  validates :name, presence: true
  validates :birth, presence: true
  validates :phone, presence: true
  validates :genre, presence: true
end
