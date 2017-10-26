# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'Cadastrando administrador padrão...'

  Admin.create!(
    :name => 'Administrador',
    :email => 'admin@admin.com',
    :password => '123456',
    :password_confirmation => '123456'
  )

puts 'Cadastrando administrador padrão [Ok]'


puts 'Cadastrando especializações padrão...'

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

puts 'Cadastrando especializações padrão [Ok]'


puts 'Cadastrando secretária padrão...'

Secretary.create!(
  name: 'Usuário',
  email: 'user@user.com',
  password: '123456',
  password_confirmation: '123456'
)

puts 'Cadastrando secretária padrão [Ok]'