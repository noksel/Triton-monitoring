class AddEnabledToChannels < ActiveRecord::Migration
  def change
    add_column :channels, :enabled, :boolean, :default => true

	f=Channel.new channelIdn: 'channel 1', channelName: 'PT2 Head'
f.save
f=Channel.new channelIdn: 'channel 2', channelName: 'PT2 Plate'
f.save 
f=Channel.new channelIdn: 'channel 3', channelName: 'Still'
f.save
f=Channel.new channelIdn: 'channel 4', channelName: '100mK Plate'
f.save
f=Channel.new channelIdn: 'channel 5', channelName: 'MC cernox'
f.save
f=Channel.new channelIdn: 'channel 6', channelName: 'MC RuO2'
f.save	
f=Channel.new channelIdn: 'channel 7', channelName: 'Russia Sensor', enabled: false
f.save
f=Channel.new channelIdn: 'channel 8', channelName: 'chan[7]', enabled: false
f.save
f=Channel.new channelIdn: 'channel 9', channelName: 'PT1 Head'
f.save	
f=Channel.new channelIdn: 'channel 10', channelName: 'PT1 Plate'
f.save	
f=Channel.new channelIdn: 'channel 11', channelName: 'chan[10]', enabled: false
f.save
f=Channel.new channelIdn: 'channel 12', channelName: 'chan[11]', enabled: false
f.save 
f=Channel.new channelIdn: 'channel 13', channelName: 'chan[12]', enabled: false
f.save
f=Channel.new channelIdn: 'channel 14', channelName: 'chan[13]', enabled: false
f.save
f=Channel.new channelIdn: 'channel 15', channelName: 'chan[14]', enabled: false
f.save
f=Channel.new channelIdn: 'channel 16', channelName: 'chan[15]', enabled: false
f.save
  end
end
