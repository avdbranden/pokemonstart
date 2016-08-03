class CreateDataJournals < ActiveRecord::Migration
  def change
    create_table :data_journals do |t|
      t.references :user, index: true, foreign_key: true
      t.boolean :consent_active, null: false, default: true
      t.integer :consent_given_count, null: false, default: 1
      t.datetime :current_consent_given_at
      t.integer :consent_withdrawn_count, null: false, default: 0
      t.datetime :current_consent_withdrawn_at
      t.integer :latest_dp_version_id_consent_given_to
      t.integer :data_actions_count, null: false, default: 0
      t.datetime :latest_data_action_at

      t.timestamps null: false
    end
  end
end
