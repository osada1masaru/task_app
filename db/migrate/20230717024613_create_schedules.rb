class CreateSchedules < ActiveRecord::Migration[7.0]
  def change
    create_table :schedules do |t|
      t.string :title
      t.datetime :startdate
      t.datetime :enddate
      t.boolean :allday
      t.timestamp :renewal

      t.timestamps
    end
  end
end
