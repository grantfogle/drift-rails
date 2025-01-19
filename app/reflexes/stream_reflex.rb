# frozen_string_literal: true

# StreamReflex
class StreamReflex < ApplicationReflex
    include ActionView::Helpers::TagHelper
    include ActionView::RecordIdentifier

    def search
        query = element.value
        service = StreamsService.new
        @streams = service.search_streams(query)

        # make reusable...?
        morph '#streams-table', render(partial: 'streams/table', locals: { streams: @streams })
        morph '#streams-cards', render(partial: 'streams/cards', locals: { streams: @streams })
    end

    def switch_view
        @view_type = element.dataset.view
        service = StreamsService.new
        
        @streams =
            case @view_type
                when "favorites"
                    Current.user.favorite_streams
                else
                service.search_streams(params[:query])
            end
        morph_stream_views(@streams)
    end

    def toggle_favorite
        return unless Current.user

        stream_id = element.dataset[:stream_id]
        stream = Stream.find(stream_id)

        Rails.logger.info("Current user: #{Current.user.inspect}")

        if element.dataset[:favorited] == "true"
            Current.user.favorite_streams.find_by(stream: stream)&.destroy
        else
            Current.user.favorite_streams.create(stream: stream)
        end

        morph "##{dom_id(stream)}_favorite" do
            is_favorited = Current.user.favorite_streams.include?(stream)
            tag.i class: "#{is_favorited ? 'fa-solid' : 'fa-regular'} fa-star fa-xl text-yellow-500 hover:text-yellow-700 cursor-pointer transition-all",
                data: {
                    reflex: "click->StreamReflex#toggle_favorite",
                    stream_id: stream.id,
                    favorited: is_favorited
                }
        end
    end

    private

    def morph_stream_views(streams)
        morph "#streams-table", render_to_string(partial: "streams/table", locals: { streams: streams })
        morph "#streams-cards", render_to_string(partial: "streams/cards", locals: { streams: streams })
    end
end
