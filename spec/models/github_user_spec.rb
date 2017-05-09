require 'rails_helper'

describe GithubUser do
  it 'returns the user with token' do
    token = ENV['github_user_token']
    github_user = GithubUser.find(token)
# binding.pry
    expect(github_user.nickname).to eq('jk1dd')
    expect(github_user.avatar_url).to eq('https://avatars2.githubusercontent.com/u/20495477?v=3')
    expect(github_user.public_repos).to eq(34)
  end
end
