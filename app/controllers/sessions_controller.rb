class SessionsController < ApplicationController
  def login
    @user = User.find(params[:id])
    session[:guest_user_id] = @user.id
    @todos = @user.todos.all
    @todo = @user.todos.new
  end
end
