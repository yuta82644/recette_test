class CreateRecipes < ActiveRecord::Migration[6.1]
  def change
    create_table :recipes do |t|
      t.string :title
      t.text :short_comment
      t.text :image
      t.text :tortal_quantity
      t.timestamps
    end
  end
end
