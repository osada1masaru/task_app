class ChangeDatatypeStartdateOfSchedules < ActiveRecord::Migration[7.0]
  def up
    change_column :schedules, :startdate, :date
    change_column :schedules, :enddate, :date
    change_column :schedules, :renewal, :datetime
  end
end
