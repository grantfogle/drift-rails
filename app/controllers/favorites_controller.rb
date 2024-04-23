class FavoritesController < ApplicationController
    before_action :require_user

    def index
      if Current.user
          @flows = FavoriteService.new(Current.user).fetch_favorites
          # @flows = Current.user.favorite_flows
          # Rails.logger.debug "Favorite Flows Count: #{Current.user.favorite_flows.count}"
      end
    end

    def create
      service = FavoriteService.new(Current.user)
      result = service.add_favorite(params[:flow_id])
  
      if result[:status] == :success
        notice: result[:message]
      else
        alert: result[:message]
      end
    end
    
    def destroy
      favorite = Favorite.find_by(user_id: Current.user.id, flow_id: params[:id])

      if favorite&.delete
        redirect_to favorites_path, notice: 'Removed from favorites.'
      else
        redirect_to favorites_path, alert: 'Unable to remove from favorites.'
      end
    end

    private

    def require_user
        redirect_to sign_in_path, alert: 'You must be logged in to perform this action.' unless Current.user
    end
end
