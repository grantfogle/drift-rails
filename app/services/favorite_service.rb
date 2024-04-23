class FavoriteService
    def initialize(user)
      @user = user
    end
  
    def fetch_favorites
      return [] unless @user
  
      flows = @user.favorite_flows
      Rails.logger.debug "Favorite Flows Count: #{flows.count}"
      flows
    end

    def add_favorite(flow_id)
        flow = Flow.find(flow_id)
        existing_favorite = Favorite.find_by(flow_id: flow.id, user_id: @user.id)
    
        return { status: :error, message: 'Already a favorite.' } if existing_favorite
    
        favorite = @user.favorites.build(flow: flow)
        if favorite.save
          { status: :success, message: 'Added to favorites.' }
        else
          { status: :error, message: 'Unable to add to favorites.' }
        end
      end
  end