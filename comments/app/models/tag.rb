class Tag < ActiveRecord::Base
  has_many :comments
end
