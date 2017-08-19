FactoryGirl.define do
  factory :specialization do
    description { ['Cardiologia','Obstetria','Neurologia','Pediatria','Ortopedia'].sample }
  end
end