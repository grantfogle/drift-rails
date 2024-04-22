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
  end