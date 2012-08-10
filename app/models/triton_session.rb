class TritonSession < ActiveRecord::Base
  attr_accessible :dateStart
has_many :points
end
