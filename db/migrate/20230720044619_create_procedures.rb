class CreateProcedures < ActiveRecord::Migration[6.1]
  def change
    create_table :procedures do |t|
      t.text :procedure_comment
      t.references :recipe, null: false, foreign_key: true

      t.timestamps
    end
  end
end
