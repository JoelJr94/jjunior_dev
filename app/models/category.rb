class Category < ApplicationRecord
  has_many :posts, dependent: :restrict_with_error

  validates :name, presence: true

  scope :sorted, -> {order(:name)}
end
