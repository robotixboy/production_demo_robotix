class SController < ApplicationController
    def new
    end
  
    def create
        user = Student.find_by(username: params[:username])
        if user.present?
          session[:user_id] = user.id
          redirect_to root_url, notice: "Welcome back, #{user.username}!"
        else
        #   flash[:alert] = "Invalid login credentials."
        #   render :new
        redirect_to s_path, alert: "Credentials not known."
        end
      end
  
  end