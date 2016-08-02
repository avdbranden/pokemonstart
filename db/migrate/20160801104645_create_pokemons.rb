class CreatePokemons < ActiveRecord::Migration
  def change
    create_table :pokemons do |t|
      t.string :name
      t.integer :number
      t.string :category
      t.float :weight
      t.float :height

      t.timestamps null: false
    end
  end
end
