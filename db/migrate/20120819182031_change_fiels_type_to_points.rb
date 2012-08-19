class ChangeFielsTypeToPoints < ActiveRecord::Migration
  def up
		change_column :points, :x, :float
		change_column :points, :y, :float
  end

  def down
  end
end
