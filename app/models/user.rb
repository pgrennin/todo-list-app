class User < ActiveRecord::Base
  has_many :todos
  validates :email, uniqueness: true, presence: true
end
