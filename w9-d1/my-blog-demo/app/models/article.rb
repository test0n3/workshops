class Article < ApplicationRecord
  validates :title, presence: true

  has_many :comments
  has_one_attached :cover
end
