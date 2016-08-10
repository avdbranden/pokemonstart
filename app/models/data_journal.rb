class DataJournal < ActiveRecord::Base
  # == Constants ============================================================

  # == Attributes ===========================================================
  attr_accessor :email, :first_name, :last_name, :address, :phone_number,
  :birth_date, :occupation, :file

  # == Extensions ===========================================================

  # == Relationships ========================================================
  belongs_to :user
  has_many :consent_withdrawals
  has_many :consent_gifts
  has_many :downloads
  has_many :uploads
  has_many :requests

  # == Validations ==========================================================
  validates :user_id, presence: true, uniqueness: true

  # == Scopes ===============================================================

  # == Callbacks ============================================================

  # == Class Methods ========================================================

  # == Instance Methods =====================================================

end
