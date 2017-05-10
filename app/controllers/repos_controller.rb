class ReposController < ApplicationController
  def index
    # github_service = GithubService.new(current_user.token)
    # @repos = github_service.find_repos
    @user = GithubUser.find(current_user.token)
    @repos = @user.repos(current_user.token)
# binding.pry
  end
end
