class CreateMenus < ActiveRecord::Migration[6.0]
  def change
    create_table :menus do |t|
      t.string :discipline
      t.integer :rep
      t.integer :set
      t.integer :weight
      t.integer :calorie

      t.timestamps
    end
  end
end
