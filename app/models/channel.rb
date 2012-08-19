class Channel < ActiveRecord::Base
  attr_accessible :channelName, :channelIdn, :enabled
	has_many :points
end
