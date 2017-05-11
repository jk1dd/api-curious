class FollowersController < ApplicationController
  def index
    # github_service = GithubService.new(current_user.token)
    #
    # @followers = github_service.followers
    # binding.pry
    @user = GithubUser.find(current_user.token)
    @followers = @user.followers(current_user.token)
    # binding.pry
  end
end
