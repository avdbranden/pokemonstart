class ConsentGift < ActiveRecord::Base
  belongs_to :dp_version
  belongs_to :data_journal
end
