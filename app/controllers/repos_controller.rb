class ReposController < ApplicationController
  def index
    github_service = GithubService.new(current_user.token)
    @repos = github_service.find_repos
# binding.pry
  end
end
