FactoryGirl.define do
  factory :admin do
    name 'Administrador'
    email 'admin@admin.com'
    password '12345678'
    password_confirmation '12345678'
  end
end