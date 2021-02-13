class AddLoggedAtToHabitLogs < ActiveRecord::Migration[6.1]
  def change
    add_column :habit_logs, :logged_at, :timestamp, null: false, index: true
    add_column :habit_logs, :logged_for, :date, null: false, index: true
  end
end
