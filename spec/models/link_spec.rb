require 'rails_helper'

RSpec.describe Link, type: :model do
  it { should validate_presence_of(:original_url) }
  it { should validate_uniqueness_of(:original_url) }
end
