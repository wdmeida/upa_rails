class Patient < ApplicationRecord

  # Constants
  GENRES = {:male => 0, :female => 1}

  enum :genre => GENRES

  validates :name, presence: true
  validates :birth, presence: true
  validates :phone, presence: true
  validates :genre, presence: true
  validates :datetime_entry, presence: true
  validates :info, presence: true
end
