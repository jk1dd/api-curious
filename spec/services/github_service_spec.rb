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

end
