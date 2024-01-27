class RegistrationsController < ApplicationController
    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            redirect_to root_path, notice: "Successfully created account!"
        else
            render :new
        end
        # render plain: params[:user]
        # params.require(:user).permit(:email, :password, :password_confirmation)
        # @user = User.create(params.require(:user).permit(:email, :password, :password_confirmation))
    end

    private

    def user_params
        params.require(:user).permit(:email, :password, :password_confirmation)
    end
end