class Goal < ActiveRecord::Base
  attr_accessible :description, :is_private, :status, :title, :user_id

  has_many :cheers

  has_many :cheersers, through: :cheers, source: :user
end
