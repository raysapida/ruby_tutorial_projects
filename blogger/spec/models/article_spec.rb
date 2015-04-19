require 'rails_helper'

RSpec.describe Article, type: :model do
  it { should have_many(:comments) }
  it { should have_many(:taggings) }
  it { should have_many(:tags).through(:taggings) }
end
