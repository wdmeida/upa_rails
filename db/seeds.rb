# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'Cadastrando Especializações...'

specializations = [
    'Cardiologista',
    'Angiologista',
    'Neurologista',
    'Dermatologista',
    'Clínico Geral',
    'Ortopedista',
    'Pediatria'
]

specializations.each do |specialization|
    Specialization.find_or_create_by!(:description => specialization) 
end

puts 'Especializações cadastradas com sucesso!'

###############################################################################3

puts 'Cadastrando Administrador padrão...'

Admin.create!(
    :name => "Adminstrador",
    :email => "admin@admin.com",
    :password => "123456",
    :password_confirmation => "123456"
)

puts 'Administrador padrão cadastrado com sucesso!'