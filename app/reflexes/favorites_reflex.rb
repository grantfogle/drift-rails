# frozen_string_literal: true

class FavoritesReflex < ApplicationReflex
    def toggle_favorite
        flow_id = element.dataset[:flow_id]
        is_favorited = element.dataset[:is_favorited] == 'true'
        current_user = Current.user

        Rails.logger.debug "Toggle Favorite - Flow ID: #{flow_id}, Is Favorited: #{is_favorited}, Current User: #{current_user.inspect}"

    
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