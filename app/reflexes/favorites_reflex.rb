# frozen_string_literal: true

class FavoritesReflex < ApplicationReflex
    # use favorite service to do maths
    def remove_favorite
      flow = Flow.find(element.dataset[:flow_id])
      favorite = Favorite.find_by(flow_id: flow.id, user_id: connection.current_user.id)
  
      if favorite
        favorite.destroy
        @message = 'Removed from favorites.'
      else
        connection.current_user.favorites.create(flow: flow)
        @message = 'Added to favorites.'
      end
    end
end