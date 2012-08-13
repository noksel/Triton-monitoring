class AddChannelIdToPoints < ActiveRecord::Migration
  def change
    add_column :points, :channel_id, :integer
		pt=Point.all
		pt.each do |d|
			d.channel_id=1
			d.save
		end
	
f=Channel.new channelIdn: 'channel 11', channelName: 'chan[10]'
f.save
f=Channel.new channelIdn: 'channel 12', channelName: 'chan[11]'
f.save 
f=Channel.new channelIdn: 'channel 13', channelName: 'chan[12]'
f.save
f=Channel.new channelIdn: 'channel 14', channelName: 'chan[13]'
f.save
f=Channel.new channelIdn: 'channel 15', channelName: 'chan[14]'
f.save
f=Channel.new channelIdn: 'channel 16', channelName: 'chan[15]'
f.save

  end
end
