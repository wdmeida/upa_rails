require 'rails_helper'

RSpec.describe Patient, type: :model do
  it { is_expected.to validate_presence_of :name }

  it { is_expected.to validate_presence_of :birth }
  
  it { is_expected.to validate_presence_of :phone }
  it { is_expected.to allow_value("(32) 3332-3333").for(:phone) }
  it { is_expected.to_not allow_value("3332-3333").for(:phone) }
  
  it { is_expected.to validate_presence_of :genre }  
  it { is_expected.to define_enum_for(:genre) }
  
  it { is_expected.to have_many(:appointments) }
  it { is_expected.to have_many(:doctors).through(:appointments) }
end