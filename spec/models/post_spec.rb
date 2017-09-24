require 'rails_helper'

RSpec.describe Post, type: :model do
  context 'validations' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:content) }
  end

  context 'associations' do
    it { should belong_to(:user) }
    it { should have_many(:comments).dependent(:destroy)}
  end
end
