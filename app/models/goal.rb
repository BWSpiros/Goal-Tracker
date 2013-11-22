class Goal < ActiveRecord::Base
  attr_accessible :description, :is_private, :status, :title, :user_id
end
