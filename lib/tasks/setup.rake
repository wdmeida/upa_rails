namespace :setup do
  desc "TODO"
  task development: :environment do
    puts 'Cadastrando administrador padrão...'

      Admin.create!(
        :name => 'Administrador',
        :email => 'admin@admin.com',
        :password => '12345678',
        :password_confirmation => '12345678'
      )

    puts 'Cadastrando administrador padrão [Ok]'
    
    
    puts '========================================================'

    
    puts 'Cadastrando especializações...'

      specializations = [
        'Ortopedia',
        'Neurologia',
        'Cardiologia',
        'Piscicologia',
        'Obstetria'
      ]

      specializations.each do |specialization|  
        Specialization.create!(:description => specialization)
      end

    puts 'Cadastrando especializações [Ok]'

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
    
    puts "Cadastrando Médicos Fake [Ok]"
  end

end
