class Move < ActiveRecord::Base
  belongs_to :pokemon
  validates :name, presence: true
  validates :move_cat, presence: true
end
