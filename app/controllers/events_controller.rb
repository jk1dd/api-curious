class EventsController < ApplicationController
  def index
    @user = GithubUser.find(current_user.token)
    @events = @user.events(current_user.token, current_user.nickname)
  end
end
