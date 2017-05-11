require 'rails_helper'

RSpec.describe User, type: :model do
  it 'has attributes' do
      user = User.new

      expect(user).to respond_to(:provider)
      expect(user).to respond_to(:uid)
      expect(user).to respond_to(:nickname)
      expect(user).to respond_to(:email)
      expect(user).to respond_to(:name)
      expect(user).to respond_to(:image)
      expect(user).to respond_to(:token)
  end
end
