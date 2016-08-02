class CreateMoves < ActiveRecord::Migration
  def change
    create_table :moves do |t|
      t.string :name
      t.string :move_cat
      t.references :pokemon, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
