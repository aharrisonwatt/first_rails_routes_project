class User < ActiveRecord::Base
  validates :email, :name, presence: true
  # validates :email, :name, uniqueness: true


end
