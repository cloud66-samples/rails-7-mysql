class UsersController < ApplicationController
  def create
    ::User.create!(email: "#{SecureRandom.hex}@gmail.com")
    redirect_to root_path
  end
end
