class RemoveSalaryToDoctors < ActiveRecord::Migration[5.0]
  def change
    remove_column :doctors, :salary, :decimal
  end
end
