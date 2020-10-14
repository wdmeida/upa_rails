FactoryBot.define do
  factory :patient do
    name { FFaker::Name.name }
    birth { [*10..50].sample.years.ago.to_date }
    cpf { FFaker::IdentificationBR.cpf }
    phone { "(#{Random.rand(10..99)}) #{Random.rand(3111..99999)}-#{Random.rand(1000..9999)}" }        
    genre { [:male, :female].sample }
  end
end