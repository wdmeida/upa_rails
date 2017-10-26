class AddDoctorsCountToSpecialization < ActiveRecord::Migration[5.0]
  def change
    add_column :specializations, :doctors_count, :integer
  end
end
