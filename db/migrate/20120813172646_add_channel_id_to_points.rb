class AddChannelIdToPoints < ActiveRecord::Migration
  def change
    add_column :points, :channel_id, :integer
		pt=Point.all
		pt.each do |d|
			d.channel_id=1
			d.save
		end

  end
end
