namespace :setup do
  desc "TODO"
  task development: :environment do
       
    puts 'Cadastrando administradores teste...'

    20.times do
      Admin.create!(
        name: Faker::Name.name,
        email: Faker::Internet.email,
        password: '123456',
        password_confirmation: '123456'
      )
    end

    puts 'Cadastrando administradores teste [OK]'
    

    puts '========================================================'


    puts "Cadastrando Médicos Fake..."
    
        100.times do
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
    
    puts "Cadastrando Médicos Fake [Ok]"


    puts '======================================================='
    

    puts 'Cadastrando Secretárias Fake...'
    
    50.times do
      Secretary.create!(
        name: Faker::Name.name,
        email: Faker::Internet.email,
        password: '123456',
        password_confirmation: '123456'        
      )
    end

    puts 'Cadastrando Secretárias Fake [Ok]'


    puts '======================================================='


    puts 'Cadastrando Pacientes Fake...'
    
    100.times do
      Patient.create!(
        name: Faker::Name.name,     
        birth: Faker::Date.birthday(1, 80),
        phone: Faker::PhoneNumber.phone_number     
      )
    end

    puts 'Cadastrando Pacientes Fake [Ok]'

  end

end
