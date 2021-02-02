json.extract! habit, :id, :category_id, :name, :goal, :time_period, :start_date, :reminders, :is_bad, :repeat, :created_at, :updated_at
json.url habit_url(habit, format: :json)
