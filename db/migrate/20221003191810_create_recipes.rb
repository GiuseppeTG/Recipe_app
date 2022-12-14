class CreateRecipes < ActiveRecord::Migration[7.0]
  def change
    create_table :recipes do |t|
      t.string :name, null: false
      t.integer :preparation_time, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
      t.integer :cooking_time, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
      t.string :description, null: false
      t.boolean :public, default: true
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
