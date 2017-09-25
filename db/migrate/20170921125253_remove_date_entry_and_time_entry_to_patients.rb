class RemoveDateEntryAndTimeEntryToPatients < ActiveRecord::Migration[5.0]
  def change
    remove_column :patients, :date_entry, :datetime
    remove_column :patients, :time_entry, :datetime
  end
end
