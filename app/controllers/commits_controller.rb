class CommitsController < ApplicationController
  def index
    @user = GithubUser.find(current_user.token)
    @commits = @user.commits(current_user.token, current_user.nickname).flatten
    # binding.pry
  end
end
