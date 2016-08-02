class Pokemon < ActiveRecord::Base
  # == Constants ============================================================

  # == Attributes ===========================================================

  # == Extensions ===========================================================

  # == Relationships ========================================================
  has_many :moves, dependent: :destroy
  has_many :ratings, dependent: :destroy

  # == Validations ==========================================================
  validates :name, presence: true, uniqueness: true
  validates :number, presence: true, uniqueness: true

  # == Scopes ===============================================================

  # == Callbacks ============================================================

  # == Class Methods ========================================================

  # == Instance Methods =====================================================
end
