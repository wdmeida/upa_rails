FactoryBot.define do
  factory :specialization do
    description { [*('a'..'z'),*('0'..'9')].shuffle[0,8].join }
  end
end