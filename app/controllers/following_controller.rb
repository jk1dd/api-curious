class FollowingController < ApplicationController
  def index
    github_service = GithubService.new(current_user.token)
    @following = github_service.following
  end
end
