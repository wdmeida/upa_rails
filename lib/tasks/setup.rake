namespace :setup do
  desc "TODO"
  task development: :environment do
       
    puts 'Cadastrando administradores teste...'

    10.times do
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
    
        30.times do
          Doctor.create!(
              name: Faker::Name.name,
              email: Faker::Internet.email,
              crm: "#{Random.rand(1000..99999999999)}/#{Faker::Address.state_abbr}",
              specialization_id: [1,2,3,4,5].sample,
              phone: "(#{Random.rand(10..99)}) #{Random.rand(3111..99999)}-#{Random.rand(1000..9999)}",
              salary: Faker::Number.number(4), 
              password: "123456",
              password_confirmation: "123456",
              
          )
        end
    
    puts "Cadastrando Médicos Fake [Ok]"


    puts '======================================================='
    

    puts 'Cadastrando Secretárias Fake...'
    
    ActiveRecord::Base.transaction do
      10.times do
        Secretary.create!(
          name: Faker::Name.name,
          email: Faker::Internet.email,
          password: '123456',
          password_confirmation: '123456'        
        )
      end
    end

    puts 'Cadastrando Secretárias Fake [Ok]'


    puts '======================================================='


    puts 'Cadastrando Pacientes Fake...'
    
    ActiveRecord::Base.transaction do
      50.times do
        Patient.create!(
          name: Faker::Name.name,     
          birth: Faker::Date.birthday(1, 80),
          phone: "(#{Random.rand(10..99)}) #{Random.rand(3111..99999)}-#{Random.rand(1000..9999)}",
          genre: [:male, :female].sample
        )
      end
    end

    puts 'Cadastrando Pacientes Fake [Ok]'

  end

end
