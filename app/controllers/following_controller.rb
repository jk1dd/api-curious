class FollowingController < ApplicationController
  def index
    @user = GithubUser.find(current_user.token)
    @following = @user.following(current_user.token)
  end
end
