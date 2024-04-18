class MapsController < ApplicationController
  def show
    if Current.user
      session[:show_pdf] = false
      @flows = nil
    else
    # check if user is logged in,
    # if not redirect to login page
      redirect_to sign_in_path, alert: 'You must be logged in to view this page.' unless Current.user
    end
  end
end
