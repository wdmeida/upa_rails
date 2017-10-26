class RemoveDatetimeEntryFromPatients < ActiveRecord::Migration[5.0]
  def change
    remove_column :patients, :datetime_entry, :datetime
  end
end
