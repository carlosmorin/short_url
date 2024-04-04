class Link < ApplicationRecord
  validates :original_url, presence: true
  validates :original_url, uniqueness: true
end
