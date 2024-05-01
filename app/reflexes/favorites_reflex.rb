# frozen_string_literal: true

class FavoritesReflex < ApplicationReflex
    # use favorite service to do maths

    def toggle_favorite
        flow_id = element.dataset[:flow_id]
        service = FavoriteService.new(current_user)
    
        favorite = Favorite.find_by(flow_id: flow_id, user_id: current_user.id)
        if favorite
          result = service.remove_favorite(flow_id)
        else
          result = service.add_favorite(flow_id)
        end
        @message = result[:message]
        morph "#favorites-button-#{flow_id}", render(partial: "components/favorites/favorite", locals: { is_favorited: !favorite.present?, flow_id: flow_id })
      end
end