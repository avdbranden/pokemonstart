class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.integer :stars
      t.references :user, index: true, foreign_key: true
      t.references :pokemon, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
