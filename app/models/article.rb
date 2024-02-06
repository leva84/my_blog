class Article < ApplicationRecord
  MAXIMUM_LENGTH_VALUE = 1000

  validates :title, :summary, :content, length: { maximum: MAXIMUM_LENGTH_VALUE }, presence: true

  def self.ransackable_attributes(auth_object = nil) # rubocop:disable Lint/UnusedMethodArgument
    %w[content created_at id id_value summary title updated_at]
  end
end
