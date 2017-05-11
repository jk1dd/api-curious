class CommitsController < ApplicationController
  def index
    @user = GithubUser.find(current_user.token)
    @my_commits = @user.commits_performed(current_user.token, current_user.nickname)
    binding.pry
  end

end
