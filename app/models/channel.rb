class Channel < ActiveRecord::Base
  attr_accessible :channelName, :channelIdn
	has_many :points
end
