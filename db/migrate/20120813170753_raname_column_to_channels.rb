class RanameColumnToChannels < ActiveRecord::Migration
  def up
		add_column :channels, :channelName, :string
	ch=Channel.all
	ch.each do |c|
		c.channelName=c.chanelName
	end
		remove_column :channels, :chanelName
  end

  def down
  end
end
