class CreateProfiles < ActiveRecord::Migration[6.1]
  def change
    create_table :profiles do |t|
      t.references :account, foreign_key: true, index: true
      t.string :username, null: false

      t.timestamps
    end
  end
end
