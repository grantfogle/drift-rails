# frozen_string_literal: true

class FavoritesReflex < ApplicationReflex
    def toggle_favorite
        flow_id = element.dataset[:flow_id]
        is_favorited = element.dataset[:is_favorited] == 'true'
        current_user = Current.user
    
        raise "User must be logged in to toggle favorites" if current_user.nil?
    
        service = FavoriteService.new(current_user)
    
        result = if is_favorited
                    service.remove_favorite(flow_id)
                else
                    service.add_favorite(flow_id)
                end
    
        @message = result[:message]
        morph "#favorites-button-#{flow_id}", render(partial: "components/favorites/favorite", locals: { is_favorited: !is_favorited, flow_id: flow_id })
    end
end