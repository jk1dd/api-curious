require 'rails_helper'

describe GithubUser do
  it 'returns the user with token' do
    token = ENV['github_user_token']
    github_user = GithubUser.find(token)
# binding.pry
    expect(github_user.name).to eq('Jonathan Kidd')
    expect(github_user.avatar_url).to eq('https://avatars2.githubusercontent.com/u/20495477?v=3')
    expect(github_user.public_repos).to eq(34)
  end

  it 'returns a users starred' do
    token = ENV['github_user_token']
    # github_user = GithubUser.find(token)
    github_user_starred = GithubUser.starred(token)
# binding.pry
    expect(github_user_starred).to be_an(Array)
    expect(github_user_starred.count).to eq(1)
  end

  it 'returns a users followers' do
    token = ENV['github_user_token']
    github_user_followers = GithubUser.followers(token)
# binding.pry
    expect(github_user_followers).to be_an(Array)
    expect(github_user_followers.count).to eq(5)
  end
end
