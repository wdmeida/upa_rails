class AddSlugToPatient < ActiveRecord::Migration[5.0]
  def change
    add_column :patients, :slug, :string
    add_index :patients, :slug, unique: true
  end
end
