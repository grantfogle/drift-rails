# frozen_string_literal: true

# StreamReflex
class StreamReflex < ApplicationReflex
    def search
        query = element.value
        service = StreamsService.new
        @streams = service.search_streams(query)

        # Rails.logger.error "Query param: #{query}"


        morph '#streams-table', render(partial: 'streams/table', locals: { streams: @streams })
        morph '#streams-cards', render(partial: 'streams/cards', locals: { streams: @streams })
    end
end
