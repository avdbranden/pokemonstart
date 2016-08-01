class Pokemon < ActiveRecord::Base
  has_many :moves
  has_many :ratings
end
