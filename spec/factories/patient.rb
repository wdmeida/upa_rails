FactoryBot.define do
  factory :patient do
    name { FFaker::Name.name }
    birth { FFaker::Date.birthday(1, 100) }
    cpf { FFaker::CPF.cpf }
    phone { "(#{Random.rand(10..99)}) #{Random.rand(3111..99999)}-#{Random.rand(1000..9999)}" }        
    genre { [:male, :female].sample }
  end
end