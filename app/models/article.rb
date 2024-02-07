class Article < ApplicationRecord
  MAXIMUM_LENGTH_FOR_TITLE = 124
  MAXIMUM_LENGTH_FOR_SUMMARY = 1024
  MAXIMUM_LENGTH_FOR_CONTENT = 30_000

  validates :title, :summary, :content, presence: true
  validates :title, length: { maximum: MAXIMUM_LENGTH_FOR_TITLE }
  validates :summary, length: { maximum: MAXIMUM_LENGTH_FOR_SUMMARY }
  validates :content, length: { maximum: MAXIMUM_LENGTH_FOR_CONTENT }

  def self.ransackable_attributes(auth_object = nil) # rubocop:disable Lint/UnusedMethodArgument
    %w[content created_at id id_value summary title updated_at]
  end
end
