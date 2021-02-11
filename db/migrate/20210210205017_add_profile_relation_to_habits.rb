class AddProfileRelationToHabits < ActiveRecord::Migration[6.1]
  def change
    add_reference :habits, :profile, foreign_key: true, index: true
  end
end
