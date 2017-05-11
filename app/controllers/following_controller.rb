class FollowingController < ApplicationController
  def index
    # github_service = GithubService.new(current_user.token)
    # @following = github_service.following
    @user = GithubUser.find(current_user.token)
    @following = @user.following(current_user.token)
  end
end
