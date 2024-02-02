class SessionsController < ApplicationController
    def new
        render :index
    end

    def create
        user = User.find_by(email: params[:email])
        if user.present? && user.authenticate(params[:password])
            session[:user_id] = user.id
            redirect_to root_path, notice: "Log in successful!"
        else
            flash[:alert] = "Invalid email or password";
            render :index
        end
    end

    def destroy
        session[:user_id] = nil
        redirect_to root_path, notice: "Logged out!"
    end
end
