class Post < ApplicationRecord
  include Visible
  validates :title, presence: true
  validates :body, presence: true, length: { minimum: 15 }
  has_many :comments, dependent: :destroy
end