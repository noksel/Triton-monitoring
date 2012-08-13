class Point < ActiveRecord::Base
  attr_accessor :channel_name
	attr_accessible :x, :y,:triton_session_id, :channel_id, :channel_name
  belongs_to :triton_session
	belongs_to :channel

before_save :setChannelId

private 

def setChannelId
	self.channel_id=Channel.find_by_channelIdn(channel_name).id
end

end
