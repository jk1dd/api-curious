class ReposController < ApplicationController
  def index
    @user = GithubUser.find(current_user.token)
    @repos = @user.repos(current_user.token)
  end
end
