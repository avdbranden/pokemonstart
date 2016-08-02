class Upload < ActiveRecord::Base
  belongs_to :data_journal
  validates :data_journal_id, presence: true
end
