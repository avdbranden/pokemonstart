class Pokemon < ActiveRecord::Base
  has_many :moves, dependent: :destroy
  has_many :ratings, dependent: :destroy
  validates :name, presence: true, uniqueness: true
  validates :number, presence: true, uniqueness: true
end
