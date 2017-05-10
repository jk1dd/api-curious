class DashboardController < ApplicationController
  def index
    # github_service = GithubService.new(current_user.token)
    # @github_user = github_service.user
    # @repos = github_service.repos
    github_service = GithubService.new(current_user.token)
    @github_user = github_service.user
    # binding.pry
  end
end
