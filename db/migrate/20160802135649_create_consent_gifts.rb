class CreateConsentGifts < ActiveRecord::Migration
  def change
    create_table :consent_gifts do |t|
      t.references :dp_version, index: true, foreign_key: true
      t.references :data_journal, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
