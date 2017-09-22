require 'rails_helper'

RSpec.describe Appointment, type: :model do
  it { is_expected.to belong_to(:patient) }
  it { is_expected.to belong_to(:doctor) }
  it { is_expected.to validate_presence_of(:patient) }
  it { is_expected.to validate_presence_of(:doctor) }
  it { is_expected.to validate_presence_of(:datetime_appointment) }
  it { is_expected.to validate_presence_of(:diagnostic) }
end
