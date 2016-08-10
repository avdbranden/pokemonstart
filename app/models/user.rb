class User < ActiveRecord::Base
  # == Constants ============================================================

  # == Attributes ===========================================================
  attr_accessor :terms # <-- Required to enable simple form checbox
  attr_accessor :dataprivacy # <-- in registration new

  # == Extensions ===========================================================

  # == Relationships ========================================================
  has_many :ratings, dependent: :destroy
  has_one :data_journal, dependent: :nullify

  # == Validations ==========================================================
  validates :email, presence: true, uniqueness: true
  validates :first_name, presence: true
  validates :last_name, presence: true

  # == Scopes ===============================================================

  # == Callbacks ============================================================
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # == Class Methods ========================================================

  # == Instance Methods =====================================================

end
