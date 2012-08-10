class Point < ActiveRecord::Base
  attr_accessible :x, :y,:triton_session_id
  belongs_to :triton_session
end
