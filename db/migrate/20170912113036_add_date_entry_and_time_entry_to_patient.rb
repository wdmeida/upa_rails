class AddDateEntryAndTimeEntryToPatient < ActiveRecord::Migration[5.0]
  def change
    add_column :patients, :date_entry, :date
    add_column :patients, :time_entry, :time
  end
end
