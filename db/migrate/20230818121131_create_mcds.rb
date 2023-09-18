class CreateMcds < ActiveRecord::Migration[6.1]
  def change
    create_table :mcds do |t|
      t.string :main_item
      t.date :last_day
      t.string :image
      t.float :height
      t.string :name
      t.text :about
      t.integer :user_id

      t.timestamps
    end
  end
end
