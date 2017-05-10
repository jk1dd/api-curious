require 'rails_helper'

describe GithubService do
  context '.user_by(token)' do
    it 'returns a raw user with details' do
      token = ENV['github_user_token']
      user = GithubService.user_by(token)

      expect(user).to be_an(Hash)
      expect(user).to have_key(:public_repos)
      expect(user).to have_key(:followers)
      expect(user).to have_key(:following)
    end
  end

  context '.find_repos' do
    it 'returns repos for a given user' do
      token = ENV['github_user_token']
      repos = GithubService.find_repos(token)

      expect(repos).to be_an(Array)
      expect(repos.count).to eq(30) # this is paginated, 34 total

      repo = repos.first

      expect(repo).to be_an(Hash)
      expect(repo).to have_key(:id)
      expect(repo).to have_key(:full_name)
      expect(repo).to have_key(:html_url)
    end
  end
end
