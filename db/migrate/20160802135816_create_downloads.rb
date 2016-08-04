class CreateDownloads < ActiveRecord::Migration
  def change
    create_table :downloads do |t|
      t.references :data_journal, index: true, foreign_key: true
      t.string :format
      t.string :format_language

      t.timestamps null: false
    end
  end
end
