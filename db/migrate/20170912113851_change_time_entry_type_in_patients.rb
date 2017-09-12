class ChangeTimeEntryTypeInPatients < ActiveRecord::Migration[5.0]
  def change
    change_column :patients, :time_entry, :datetime
  end
end
