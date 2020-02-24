class AddLastActivityAtToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :last_activity_at, :datetime, default: -> { "current_date::timestamp" }
  end
end
