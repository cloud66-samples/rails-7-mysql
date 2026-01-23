class WelcomeController < ApplicationController
  def index
    @users = ::User.paginate(page: params[:page])
  end
end
