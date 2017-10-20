require 'rails_helper'

RSpec.describe Doctor, type: :model do
  it { is_expected.to validate_presence_of(:name) }

  it { is_expected.to validate_presence_of(:email) }
  it { is_expected.to validate_uniqueness_of(:email).case_insensitive }
  it { is_expected.to allow_value(Faker::Internet.email).for(:email) }  

  it { is_expected.to validate_confirmation_of(:password) }  
  
  it { is_expected.to validate_presence_of(:crm) }
  it { is_expected.to allow_value("123456789/MG").for(:crm) }
  it { is_expected.to_not allow_value("123-93").for(:crm) }
  
  it { is_expected.to validate_presence_of(:phone) }
  it { is_expected.to allow_value("(32) 3332-3333").for(:phone) }
  it { is_expected.to_not allow_value("3332-3333").for(:phone) }
  
  it { is_expected.to monetize(:salary) }  
  it { is_expected.to validate_numericality_of(:salary).is_greater_than(0) }

  it { is_expected.to belong_to(:specialization) }

  it { is_expected.to have_many(:appointments) }
  it { is_expected.to have_many(:patients).through(:appointments) }
end