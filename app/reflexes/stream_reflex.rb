# frozen_string_literal: true

# StreamReflex
class StreamReflex < ApplicationReflex
    def search
        query = element.value
        service = StreamsService.new
        @streams = service.search_streams(query)

        # morph_stream_views(@streams)
        morph '#streams-table', render(partial: 'streams/table', locals: { streams: @streams })
        morph '#streams-cards', render(partial: 'streams/cards', locals: { streams: @streams })
    end

    def switch_view
        @view_type = element.dataset.view
        service = StreamsService.new
        
        @streams = case @view_type
        when "favorites"
            Current.user.favorite_streams
        else
            service.search_streams(params[:query])
        end
        
        # morph_stream_views(@streams)
    end

    private

    def morph_stream_views(streams)
        morph "#streams-table", render_to_string(partial: "streams/table", locals: { streams: streams })
        morph "#streams-cards", render_to_string(partial: "streams/cards", locals: { streams: streams })
    end
end
