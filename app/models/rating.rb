class Rating < ActiveRecord::Base
  belongs_to :user
  belongs_to :pokemon
  validates :stars, presence: true
end
