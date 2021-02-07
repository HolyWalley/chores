class CreateHabits < ActiveRecord::Migration[6.1]
  def change
    create_table :habits do |t|
      t.belongs_to :category, null: false, foreign_key: true
      t.string :name, null: false
      t.integer :goal, limit: 4
      t.integer :time_period, limit: 2
      t.date :start_date, null: false
      t.jsonb :reminders, null: false, default: []
      t.boolean :is_bad, null: false
      t.jsonb :repeat, null: false, default: {}

      t.timestamps
    end
  end
end
