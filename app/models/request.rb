class Request < ActiveRecord::Base
  # == Constants ============================================================
  NATURE_TYPES = %w(Question Complaint Suggestion Other)

  # == Attributes ===========================================================

  # == Extensions ===========================================================

  # == Relationships ========================================================
  belongs_to :data_journal

  # == Validations ==========================================================
  validates :nature, presence: true, inclusion: { in: NATURE_TYPES }
  validates :content, presence: true, length: { minimum: 20,
    too_short: "%{count} characters is the minimum allowed" }

  # == Scopes ===============================================================

  # == Callbacks ============================================================

  # == Class Methods ========================================================

  # == Instance Methods =====================================================

end
