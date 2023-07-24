class AddRoomIdRecipes < ActiveRecord::Migration[6.1]
  def change
     add_column :recipes, :room_id, :bigint
  end
end
