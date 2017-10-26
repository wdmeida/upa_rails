class AddSpecializationToDoctors < ActiveRecord::Migration[5.0]
  def change
    add_reference :doctors, :specialization, foreign_key: true
  end
end
