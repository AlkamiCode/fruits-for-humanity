class User::BaseController < ApplicationController
  before_action :require_authenticated_user

  def require_authenticated_user
    render file: "/public/404" unless current_user
  end
end