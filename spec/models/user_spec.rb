require 'rails_helper'

RSpec.describe User, type: :model do
  it 'returns the user with token' do
    token = ENV['github_user_token']
    user = GithubService.user_by(token)
# binding.pry
    expect(user.nickname).to eq('jk1dd')
    expect(user.avatar_url).to eq('https://avatars2.githubusercontent.com/u/20495477?v=3')
    expect(user.public_repos).to eq(34)
  end
end
