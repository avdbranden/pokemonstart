class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.references :data_journal, index: true, foreign_key: true
      t.string :nature
      t.text :content

      t.timestamps null: false
    end
  end
end
