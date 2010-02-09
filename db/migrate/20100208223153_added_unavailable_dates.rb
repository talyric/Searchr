class AddedUnavailableDates < ActiveRecord::Migration
  def self.up
    create_table :unavailable_dates do |t|
      t.date     :start_date
      t.date     :end_date
      t.datetime :created_at
      t.datetime :updated_at
    end
  end

  def self.down
    drop_table :unavailable_dates
  end
end
