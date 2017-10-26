FactoryGirl.define do
  factory :appointment do
    patient { create(:patient) }
    specialization { create(:specialization) }
    doctor { create(:doctor) }
    appointment_finished { false }
    datetime_appointment { DateTime.current }
    info { Faker::Lorem.sentence([3, 4, 5].sample) }
  end
end