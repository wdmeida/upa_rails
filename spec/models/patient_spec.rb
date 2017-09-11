require 'rails_helper'

RSpec.describe Patient, type: :model do
  it { is_expected.to validate_presence_of :name }
  # it { is_expected.to validate_presence_of :birth }
  # it { is_expected.to validate_presence_of :phone }
  it { is_expected.to validate_presence_of :info }
  it { is_expected.to validate_presence_of :datetime_entry }
  it { is_expected.to validate_presence_of :genre }  
  it { is_expected.to define_enum_for(:genre) }
end