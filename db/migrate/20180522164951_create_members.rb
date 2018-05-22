class CreateMembers < ActiveRecord::Migration[5.2]
  def change
    create_table :members do |t|
      t.string :name
      t.integer :role, default: 0
      t.string :email

      t.timestamps null: false
    end
  end
end
