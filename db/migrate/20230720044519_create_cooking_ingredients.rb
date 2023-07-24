class CreateCookingIngredients < ActiveRecord::Migration[6.1]
  def change
    create_table :cooking_ingredients do |t|
      t.text :ingredient_name
      t.text :unit
      t.integer :quantity

       t.references :recipe, null: false, foreign_key: true
      

      t.timestamps
    end
  end
end
