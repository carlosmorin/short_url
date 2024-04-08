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
      return code unless Link.exists?(code: code)
    end
  end

  def generate_code
    SecureRandom.hex(3).upcase
  end
end
