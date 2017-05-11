require 'rails_helper'

describe GithubUser do
  it 'returns the user with token' do
    VCR.use_cassette('returns_user') do
      token = ENV['github_user_token']
      github_user = GithubUser.find(token)
      # binding.pry
      expect(github_user.name).to eq('Jonathan Kidd')
      expect(github_user.avatar_url).to eq('https://avatars2.githubusercontent.com/u/20495477?v=3')
      expect(github_user.public_repos).to eq(34)
    end
  end

  it 'returns a users starred' do
    VCR.use_cassette('starred_repos') do
      token = ENV['github_user_token']
      github_user = GithubUser.find(token)
      starred = github_user.starred_repos(token)

      expect(starred).to be_an(Array)
      expect(starred.count).to eq(1)
    end
  end

  it 'returns a users followers' do
    VCR.use_cassette('user_followers') do
      token = ENV['github_user_token']
      github_user = GithubUser.find(token)
      followers = github_user.followers(token)
      # binding.pry
      expect(followers).to be_an(Array)
      expect(followers.count).to eq(5)
    end
  end

  it 'returns a users repos' do
    VCR.use_cassette('user_repos') do
      token = ENV['github_user_token']
      github_user_repos = GithubUser.repos(token)
      # binding.pry
      expect(github_user_repos).to be_an(Array)
      expect(github_user_repos.count).to eq(30)
    end
  end
end
