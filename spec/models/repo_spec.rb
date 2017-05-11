require 'rails_helper'

describe Repo do
  it 'returns an array of repo objects' do
    VCR.use_cassette('returns_repos') do
      token = ENV['github_user_token']
      github_user = GithubUser.find(token)
      repos = github_user.repos(token)

      expect(repos).to be_an(Array)
      expect(repos.count).to eq(30)
      expect(repos.first).to be_a(Repo)
    end
  end
end
