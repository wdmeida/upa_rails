FactoryBot.define do
  factory :doctor do
    name { FFaker::Name.name }    
    email { FFaker::Internet.email }
    crm { "#{Random.rand(1000..9999999999)}/#{FFaker::AddressBR.state_abbr}" }
    specialization { create(:specialization) }
    phone { "(#{Random.rand(10..99)}) #{Random.rand(3111..99999)}-#{Random.rand(1000..9999)}" }    
    salary { rand(50_000) }
    password { '123456' }
    password_confirmation { '123456' }
  end
end