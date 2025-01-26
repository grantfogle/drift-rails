# frozen_string_literal: true

# StreamReflex
class StreamReflex < ApplicationReflex
    before_reflex :set_service

    def search
        query = element.value
        @streams = @streams_service.search_streams(query)

        morph_stream_views(@streams)
    end

    def switch_view
        @view_type = element.dataset.view
        @streams =
            case @view_type
            when "favorites"
                @streams_service.fetch_favorited_streams
            else
                @streams_service.call
            end
        
        morph '#stream-nav', render(partial: 'streams/filters/view_nav', locals: { view_type: @view_type })
        morph_stream_views(@streams)
    end

    def toggle_favorite
        return unless Current.user

        stream_id = element.dataset[:stream_id]
        stream = Stream.find(stream_id)
        
        # Use a transaction to ensure data consistency
        # pull this to a private method
        ActiveRecord::Base.transaction do
            favorite = Current.user.favorite_streams.find_by(stream: stream)
            
            if favorite
                favorite.destroy
            else
                Current.user.favorite_streams.create!(stream: stream)
            end
            
            Current.user.reload
        end

        # Ensure we're using the same state check everywhere
        is_favorited = Current.user.favorited_streams.include?(stream)
        
        morph "[data-id='favorite_stream_#{stream.id}_row']", render(partial: 'components/buttons/favorite', locals: {
            stream: stream,
            current_user: Current.user,
            is_favorited: is_favorited
        })

        morph "[data-id='favorite_stream_#{stream.id}_card']", render(partial: 'components/buttons/favorite', locals: {
            stream: stream,
            current_user: Current.user,
            is_favorited: is_favorited
        })
    end

    private

    def set_service
        @streams_service = StreamsService.new
    end

    def morph_stream_views(streams)
        morph '#streams-table', render(partial: 'streams/table', locals: { streams: streams, current_user: Current.user })
        morph '#streams-cards', render(partial: 'streams/cards', locals: { streams: streams, current_user: Current.user })
    end

    # def toggle_user_favorite(stream)
end
