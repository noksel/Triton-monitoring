class AddEnabledToChannels < ActiveRecord::Migration
  def change
    add_column :channels, :enabled, :boolean, :default => 1
  end
end
