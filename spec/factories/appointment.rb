FactoryGirl.define do
  factory :appointment do
    patient { create(:patient) }
    doctor { create(:doctor) }
    appointment_finished { false }
    datetime_appointment { DateTime.current }
    diagnostic { Faker::Lorem.sentence([3, 4, 5].sample) }
  end
end