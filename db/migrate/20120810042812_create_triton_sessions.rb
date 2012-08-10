class CreateTritonSessions < ActiveRecord::Migration
  def change
    create_table :triton_sessions do |t|
      t.date :dateStart

      t.timestamps
    end
  end
end
