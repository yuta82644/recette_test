class CreateRoomAssigns < ActiveRecord::Migration[6.1]
  def change
    create_table :room_assigns do |t|

       t.references :user, foreign_key: true
      t.references :room, foreign_key: true
      t.timestamps
    end
  end
end
