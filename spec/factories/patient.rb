FactoryGirl.define do
  factory :patient do
    name { Faker::Name.name }    
    birth { Faker::Date.birthday(1, 100) }
    phone { Faker::PhoneNumber.phone_number }
    genre { [:male, :female].sample }
  end
end