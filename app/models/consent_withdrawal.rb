class ConsentWithdrawal < ActiveRecord::Base
  belongs_to :dp_version
  belongs_to :data_journal
  validates :dp_version_id, presence: true
  validates :data_journal_id, presence: true
end
