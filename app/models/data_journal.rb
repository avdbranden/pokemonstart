class DataJournal < ActiveRecord::Base
  belongs_to :user
  has_many :consent_withdrawals, :consent_gifts, :downloads, :uploads
end
