class AddDateTimeEntryAndGenreAndInfoToPatient < ActiveRecord::Migration[5.0]
  def change
    add_column :patients, :datetime_entry, :datetime, :default => DateTime.now
    add_column :patients, :genre, :integer
    add_column :patients, :info, :text
  end
end
