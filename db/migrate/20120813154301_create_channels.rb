class CreateChannels < ActiveRecord::Migration
  def change
    create_table :channels do |t|
      t.string :channelIdn
      t.string :chanelName

      t.timestamps
    end
  end
end
