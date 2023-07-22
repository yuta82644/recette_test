class AddPublicToRecipes < ActiveRecord::Migration[6.1]
  def change
    add_column :recipes, :public, :boolean, default: true
  end
end
