class Post < ApplicationRecord
  belongs_to :user
  belongs_to :category

  has_many :comments, dependent: :destroy

  paginates_per 5

  validates :title, presence: true, length: {minimum: 3}
  validates :body, presence: true, length: {minimum: 10}

  scope :desc_order, -> {order(created_at: :desc)}
  scope :without_highlights, -> (ids) {where.not(id: ids)}
  scope :filter_by_category, -> (category) {where category_id: category.id if category.present?}
  scope :filter_by_archives, lambda { |month_year|
    if month_year
      date = Date.strptime(month_year, "%B %Y")
      where created_at: date.beginning_of_month..date.end_of_month.next_day
    end
  }
end
