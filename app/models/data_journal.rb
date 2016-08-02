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

  # == Scopes ===============================================================

  # == Callbacks ============================================================

  # == Class Methods ========================================================

  # == Instance Methods =====================================================

end
