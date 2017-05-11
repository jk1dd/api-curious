class FollowersController < ApplicationController
  def index
    @user = GithubUser.find(current_user.token)
    @followers = @user.followers(current_user.token)
  end
end
