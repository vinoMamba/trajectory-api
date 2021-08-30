class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :full_name, limit: 50, null: false, default: ''
      t.index :full_name, unique: true
      t.string :password_digest, limit: 256, null: false, default: ''

      t.timestamps
    end
  end
end
