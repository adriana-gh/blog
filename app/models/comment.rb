class Comment < ApplicationRecord
  include Visible
  validates :author, :body, presence: true
  belongs_to :post
end
