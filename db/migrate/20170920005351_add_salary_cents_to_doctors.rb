class AddSalaryCentsToDoctors < ActiveRecord::Migration[5.0]
  def change
    add_column :doctors, :salary_cents, :integer, default: 0
  end
end
