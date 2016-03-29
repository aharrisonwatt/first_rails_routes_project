class Contact < ActiveRecord::Base
  validates :user_id, :email, presence: true
  validates :email, :presence => true, :uniqueness => {:scope => :user_id}

  belongs_to(
    :owner, dependent: :destroy,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: 'User'
  )

  has_many :contact_shares,
    foreign_key: :contact_id,
    primary_key: :id,
    class_name: :ContactShare

  has_many :shared_users,
    through: :contact_shares,
    source: :user
end
