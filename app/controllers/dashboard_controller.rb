class DashboardController < ApplicationController
  def index
    github_service = GithubService.new(current_user.token)
    @github_user = github_service.user
    @user = GithubUser.find(current_user.token)
  end
end
