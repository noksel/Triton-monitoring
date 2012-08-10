class AddTrtnSessIdToPoints < ActiveRecord::Migration
  def change
		add_column :points, :triton_session_id, :integer
  end
end
