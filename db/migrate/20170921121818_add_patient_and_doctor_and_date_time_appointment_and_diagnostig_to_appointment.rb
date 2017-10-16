class AddPatientAndDoctorAndDateTimeAppointmentAndDiagnostigToAppointment < ActiveRecord::Migration[5.0]
  def change
    add_reference :appointments, :patient, foreign_key: true
    add_reference :appointments, :doctor, foreign_key: true
    add_column :appointments, :datetime_appointment, :datetime
    add_column :appointments, :info, :text
  end
end
