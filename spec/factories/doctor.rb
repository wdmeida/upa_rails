FactoryGirl.define do
  factory :doctor do
    name { Faker::Name.name }    
    email { Faker::Internet.email }
    crm { Faker::Company.australian_business_number }
    specialization { create(:specialization) }
    phone { Faker::PhoneNumber.phone_number }
    salary { Faker::Number.number(4) }
    password "123456"
    password_confirmation "123456"
  end
end