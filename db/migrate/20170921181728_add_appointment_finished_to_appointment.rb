class AddAppointmentFinishedToAppointment < ActiveRecord::Migration[5.0]
  def change
    add_column :appointments, :appointment_finished, :boolean, :default => nil
  end
end
