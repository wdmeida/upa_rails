class AddDateTimeEntryAndGenreAndInfoToPatient < ActiveRecord::Migration[5.0]
  def change
    add_column :patients, :datetime_entry, :datetime
    add_column :patients, :genre, :integer
  end
end
