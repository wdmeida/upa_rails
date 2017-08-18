require 'rails_helper'

RSpec.describe Doctor, type: :model do
  it { is_expected.to validate_presence_of :name }
  it { is_expected.to validate_presence_of :email }
  it { is_expected.to validate_uniqueness_of(:email).case_insensitive }
  it { is_expected.to validate_confirmation_of(:password) }
  it { is_expected.to allow_value(Faker::Internet.email).for(:email) }  
  it { is_expected.to validate_presence_of :salary }
  it { is_expected.to validate_presence_of :crm }
  it { is_expected.to validate_presence_of :phone }
  it { is_expected.to validate_presence_of :name }

  it { should belong_to(:specialization) }
end