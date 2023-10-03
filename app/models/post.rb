class Post < ApplicationRecord
  belongs_to :user
  belongs_to :category

  paginates_per 5

  validates :title, presence: true, length: {minimum: 3}
  validates :body, presence: true, length: {minimum: 10}

  scope :desc_order, -> {order(created_at: :desc)}
  scope :without_highlights, -> (ids) {where.not(id: ids)}
  scope :filter_by_category, -> (category) {where category_id: category.id if category.present?}
end
