class CreateHabitLogs < ActiveRecord::Migration[6.1]
  def change
    create_table :habit_logs do |t|
      t.belongs_to :habit, null: false, foreign_key: true

      t.timestamps
    end
  end
end
