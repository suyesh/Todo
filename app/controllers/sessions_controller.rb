class SessionsController < ApplicationController
    def login
        @user = User.find(params[:id])
        session[:guest_user_id] = @user.id
        redirect_to root_path
    end
end
