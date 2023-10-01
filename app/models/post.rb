class Post < ApplicationRecord
  belongs_to :user
  belongs_to :category

  validates :title, presence: true, length: {minimum: 3}
  validates :body, presence: true, length: {minimum: 10}

  scope :desc_order, -> {order(created_at: :desc)}
  scope :without_highlights, -> (ids) {where.not(id: ids)}
end
