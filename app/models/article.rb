class Article < ApplicationRecord
  validates :title, :summary, :content, length: { maximum: 1000 }, presence: true
end
