class CreateMoves < ActiveRecord::Migration
  def change
    create_table :moves do |t|
      t.string :name
      t.string :type
      t.references :pokemon, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
