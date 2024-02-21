class FavoritesController < ApplicationController
    before_action :require_user

    def index
        #def index
        if Current.user
            @flows = Current.user.favorite_flows # This retrieves all flows associated with the user through favorites.
            Rails.logger.debug "Favorite Flows Count: #{Current.user.favorite_flows.count}"
        end
    end

    def create
        flow = Flow.find(params[:flow_id])
        favorite = Current.user.favorites.build(flow: flow)
        # check if the flow is already a favorite
    
        if favorite.save
          redirect_to flow, notice: 'Added to favorites.'
        else
          redirect_to flow, alert: 'Unable to add to favorites.'
        end
      end
    
      def destroy
        flow = Flow.find(params[:flow_id])
        favorite = Current.user.favorites.find_by(flow_id: flow.id, user_id: Current.user.id)
        
        if favorite&.destroy
          redirect_to flow, notice: 'Removed from favorites.'
        else
          redirect_to flow, alert: 'Unable to remove from favorites.'
        end
      end

    private

    def require_user
        redirect_to sign_in_path, alert: 'You must be logged in to perform this action.' unless Current.user
    end
end
