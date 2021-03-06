class Move < ActiveRecord::Base
  # == Constants ============================================================

  # == Attributes ===========================================================

  # == Extensions ===========================================================

  # == Relationships ========================================================
  belongs_to :pokemon

  # == Validations ==========================================================
  validates :name, presence: true
  validates :move_cat, presence: true
  # Do not name a colum 'type', as this will create problems in Rails

  # == Scopes ===============================================================

  # == Callbacks ============================================================

  # == Class Methods ========================================================

  # == Instance Methods =====================================================

end
