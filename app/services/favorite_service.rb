class FavoriteService
    def initialize(user)
      @user = user
    end

    def fetch_favorites
        return [] unless @user
        @user.favorite_flows
    end

    # implement with flow service or an application service
        # TODO: user service (user info, user preferences, user saved data
        # may need to rework to make favorite service accessible through the user service
        # TODO: flow service (flow info, flow data)
        # TODO: map service
        # TODO: build out admin service to update flow reports
        # TODO: unit tests and e2e tests
        # TODO: alert displays

    def remove_favorite(flow_id)
        favorite = Favorite.find_by(user_id: @user.id, flow_id: flow_id)
        if favorite&.destroy
            { status: :success, message: 'Removed from favorites.' }
        else
            { status: :error, message: 'Unable to remove from favorites.' }
        end
    end

    def add_favorite(flow_id)
        flow = Flow.find_by(id: flow_id)
        return { status: :error, message: 'Flow not found.' } unless flow
        
        existing_favorite = Favorite.find_by(flow_id: flow.id, user_id: @user.id)
        return { status: :error, message: 'Already a favorite.' } if existing_favorite
    
        if @user.favorites.create(flow: flow)
          { status: :success, message: 'Added to favorites.' }
        else
          { status: :error, message: 'Unable to add to favorites.' }
        end
    end
    
  end