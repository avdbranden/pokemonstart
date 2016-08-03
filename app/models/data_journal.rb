class DataJournal < ActiveRecord::Base
  # == Constants ============================================================

  # == Attributes ===========================================================

  # == Extensions ===========================================================

  # == Relationships ========================================================
  belongs_to :user
  has_many :consent_withdrawals
  has_many :consent_gifts
  has_many :downloads
  has_many :uploads

  # == Validations ==========================================================
  validates :user_id, presence: true, uniqueness: true

  # == Scopes ===============================================================

  # == Callbacks ============================================================

  # == Class Methods ========================================================

  # == Instance Methods =====================================================

end
