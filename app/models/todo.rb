class Todo < ActiveRecord::Base
  belongs_to :user
  acts_as_list scope: [:user_id]
end
