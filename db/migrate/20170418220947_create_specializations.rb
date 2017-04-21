class CreateSpecializations < ActiveRecord::Migration[5.0]
  def change
    create_table :specializations do |t|
      t.string :description

      t.timestamps
    end
  end
end
