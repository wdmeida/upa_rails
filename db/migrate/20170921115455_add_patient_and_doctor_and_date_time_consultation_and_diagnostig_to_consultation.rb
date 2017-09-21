class AddPatientAndDoctorAndDateTimeConsultationAndDiagnostigToConsultation < ActiveRecord::Migration[5.0]
  def change
    add_reference :consultations, :patient, foreign_key: true
    add_reference :consultations, :doctor, foreign_key: true
    add_column :consultations, :datetime_consultation, :datetime
    add_column :consultations, :diagnostic, :text
  end
end
