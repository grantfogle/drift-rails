class FavoritesController < ApplicationController
    before_action :require_user

    def index
      # TODO do i need this conditional
      if Current.user
          @flows = FavoriteService.new(Current.user).fetch_favorites
          # @flows = Current.user.favorite_flows
          # Rails.logger.debug "Favorite Flows Count: #{Current.user.favorite_flows.count}"
      end
    end

    def create
      result = FavoriteService.new(Current.user).add_favorite(params[:flow_id])
      if result[:status] == :success
        redirect_to favorites_path, notice: result[:message]
      else
        redirect_to flows_path, alert: result[:message]
      end
    end
    
    def destroy
      result = FavoriteService.new(Current.user).remove_favorite(params[:id])
      redirect_to favorites_path, result[:status] == :success ? { notice: result[:message] } : { alert: result[:message] }
    end
  
    private

    def require_user
      redirect_to sign_in_path, alert: 'You must be logged in to perform this action.' unless Current.user
  end
end
