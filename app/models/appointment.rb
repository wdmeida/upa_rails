class Appointment < ApplicationRecord
  belongs_to :patient
  belongs_to :doctor
  belongs_to :specialization, counter_cache: true

  validates :patient, presence: true
  validates :doctor, presence: true
  validates :specialization, presence: true
  validates :datetime_appointment, presence: true
  validates :info, presence: true
end
