class UnavailableDates < ActiveRecord::Migration
  def self.up
    add_column :unavailable_dates, :user_id, :integer

    add_index :unavailable_dates, [:user_id]
  end

  def self.down
    remove_column :unavailable_dates, :user_id

    remove_index :unavailable_dates, :name => :index_unavailable_dates_on_user_id rescue ActiveRecord::StatementInvalid
  end
end
