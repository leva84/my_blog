class Article < ApplicationRecord
  MAXIMUM_LENGTH_VALUE = 1000

  validates :title, :summary, :content, length: { maximum: MAXIMUM_LENGTH_VALUE }, presence: true
end
