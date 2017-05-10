class FollowersController < ApplicationController
  def index
    github_service = GithubService.new(current_user.token)

    @followers = github_service.followers
    # binding.pry
  end
end
