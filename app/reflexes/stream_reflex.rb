# frozen_string_literal: true

# StreamReflex
class StreamReflex < ApplicationReflex
    def search
        service = StreamsService.new(params[:query])
        @streams = service.search_streams(params[:query])

        # streams-table
        # streams-cards
        morph '#streams-table', render(partial: 'streams/table', locals: { streams: @streams })
        morph '#streams-cards', render(partial: 'streams/cards', locals: { streams: @streams })
    end
end