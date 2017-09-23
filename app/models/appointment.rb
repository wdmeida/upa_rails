class Appointment < ApplicationRecord
  belongs_to :patient
  belongs_to :doctor
  belongs_to :specialization

  validates :patient, presence: true
  validates :doctor, presence: true
  validates :datetime_appointment, presence: true
  validates :diagnostic, presence: true
end
