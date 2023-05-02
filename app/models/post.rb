class Post < ApplicationRecord
  validates :title, presence: true
  validates :body, presence: true, length: { minimum: 15 }
  has_many :comments
end