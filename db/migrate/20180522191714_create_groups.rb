class CreateGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :groups do |t|
      t.string :title
      t.date :start
      t.references :recipe, foreign_key: true

      t.timestamps null: false
    end
  end
end
