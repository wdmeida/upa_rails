require 'rails_helper'

RSpec.describe Patient, type: :model do
  it { is_expected.to validate_presence_of :name }
  it { is_expected.to validate_presence_of :birth }
  it { is_expected.to validate_presence_of :phone }
end