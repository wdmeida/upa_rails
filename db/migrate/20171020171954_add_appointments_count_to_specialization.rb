class AddAppointmentsCountToSpecialization < ActiveRecord::Migration[5.0]
  def change
    add_column :specializations, :appointments_count, :integer
  end
end
