# frozen_string_literal: true

class MapReflex < ApplicationReflex
    before_reflex :set_service

    def search
        if params[:query].length < 1
            # Optionally, clear the current search results or handle as needed
            morph "#map-search-results-table", ""
        else
            @streams = @streams_service.search_streams(params[:query]).limit(5)
            # @streams = Flow.where("name LIKE ?", "%#{params[:query]}%").limit(5)
            morph "#map-search-results-table", render(partial: "maps/components/results", locals: { streams: @streams })
        end
    end

    def display_search_popup
        # get favorite status
        stream_id = element.dataset[:id]
        @current_user = User.find_by(id: session[:user_id])
        @stream = Stream.find(stream_id)
        morph "#popup-overlay", render(partial: "maps/components/popup", locals: { stream: @stream, current_user: @current_user})
    end

    def hide_search_popup
        morph "#popup-overlay", ""
    end

    private

    def set_service
        @streams_service = StreamsService.new
    end
end
