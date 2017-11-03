require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:user) { User.new(username: 'AJ', password: 'password' )}

  describe 'validations' do
    it { should validate_presence_of(:username) }
    it { should validate_presence_of(:password_digest) }
    it { should validate_length_of(:password).is_at_least(6) }
  end

  describe 'associations' do

  end

  describe 'class methods' do
    it { }
  end
end
