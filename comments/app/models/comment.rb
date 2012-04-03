class Comment < ActiveRecord::Base
  belongs_to :tag
  belongs_to :type
  belongs_to :user
end
