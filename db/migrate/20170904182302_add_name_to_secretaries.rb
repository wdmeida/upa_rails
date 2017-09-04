class AddNameToSecretaries < ActiveRecord::Migration[5.0]
  def change
    add_column :secretaries, :name, :string
  end
end
