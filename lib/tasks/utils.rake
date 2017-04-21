namespace :utils do
  desc "TODO"
  task generate_doctors: :environment do

    puts "Cadastrando Médicos Fake..."

    20.times do
      Doctor.create!(
          name: Faker::Name.name,
          email: Faker::Internet.email,
          crm: Faker::Company.australian_business_number,
          specialization_id: [1,2,3,4,5].sample,
          phone: Faker::PhoneNumber.phone_number,
          salary: Faker::Number.decimal(2, 3), 
          password: "123456",
          password_confirmation: "123456",
          
      )
    end

    puts "Medicos cadastrados com sucesso!"

  end

end
