class UsersController < ApplicationController
  def show
    @user = User.find(params["id"])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params["user"])
    @user.password = BCrypt::Password.create(params["user"]["password"]) #save user password as encrypted version
    @user.save
    redirect_to "/users/#{@user.id}"
  end
end
