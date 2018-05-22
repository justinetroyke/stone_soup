class CreateMembers < ActiveRecord::Migration[5.2]
  def change
    create_table :members do |t|
      t.string :name
      t.string :role
      t.string :email

      t.timestamps null: false
    end
  end
end
