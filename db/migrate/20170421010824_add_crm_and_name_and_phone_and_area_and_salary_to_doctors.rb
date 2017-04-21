class AddCrmAndNameAndPhoneAndAreaAndSalaryToDoctors < ActiveRecord::Migration[5.0]
  def change
    add_column :doctors, :crm, :string
    add_column :doctors, :name, :string
    add_column :doctors, :phone, :string
    add_column :doctors, :salary, :decimal, :precision => 8, :scale => 2
  end
end
