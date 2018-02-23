FactoryBot.define do
  factory :patient do
    name { Faker::Name.name }
    birth { Faker::Date.birthday(1, 100) }
    cpf { Faker::CPF.cpf }
    phone { "(#{Random.rand(10..99)}) #{Random.rand(3111..99999)}-#{Random.rand(1000..9999)}" }        
    genre { [:male, :female].sample }
  end
end