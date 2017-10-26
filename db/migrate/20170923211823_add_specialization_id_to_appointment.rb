class AddSpecializationIdToAppointment < ActiveRecord::Migration[5.0]
  def change
    add_reference :appointments, :specialization, foreign_key: true
  end
end
