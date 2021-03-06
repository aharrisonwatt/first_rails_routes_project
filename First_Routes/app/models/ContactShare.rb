class ContactShare < ActiveRecord::Base
  validates :contact_id, :user_id, presence: true
  validates :contact_id, :presence => true, :uniqueness => {:scope => :user_id}

  belongs_to :contact,
    foreign_key: :contact_id,
    primary_key: :id,
    class_name: :Contact

  belongs_to :user, dependent: :destroy,
    foreign_key: :user_id,
    primary_key: :id,
    class_name: :User
end
