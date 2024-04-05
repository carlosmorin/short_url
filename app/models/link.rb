class Link < ApplicationRecord
  validates :original_url, presence: true
  validates :original_url, uniqueness: true
  before_create :shorten_link
  SHORT_DOMAIN = "https://me.li/"

  private

  def shorten_link
    self.code = unique_code
    self.short_url = SHORT_DOMAIN + self.code
  end

  def unique_code
    loop do
      code = generate_code
      occurrences = Link.where(code: code)
      break unless occurrences.any?
    end

  end

  def generate_code
    SecureRandom.hex(3).upcase
  end
end
