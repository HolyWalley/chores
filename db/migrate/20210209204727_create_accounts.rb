class CreateAccounts < ActiveRecord::Migration[6.1]
  def change
    enable_extension 'citext'

    create_table :accounts do |t|
      t.citext :email, null: false, index: true
      t.string :password_digest, null: false

      t.timestamps
    end
  end
end
