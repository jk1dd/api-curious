class OrganizationsController < ApplicationController
  def index
    @user = GithubUser.find(current_user.token)
    @organizations = @user.organizations(current_user.token)
  end
end
