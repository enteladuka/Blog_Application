class Post < ApplicationRecord
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  has_many :comments, dependent: :destroy
  validates :user_id, presence: true
  validates :title, presence: true,
                      length: {minimum: 5}
  validates :body, presence: true,
                      length: {minimum: 5}
end
