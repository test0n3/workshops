class Article < ApplicationRecord
  validate :title, presence: true
end
