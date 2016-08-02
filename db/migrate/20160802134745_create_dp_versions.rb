class CreateDpVersions < ActiveRecord::Migration
  def change
    create_table :dp_versions do |t|
      t.string :internal_ref
      t.text :content
      t.datetime :date

      t.timestamps null: false
    end
  end
end
