# frozen_string_literal: true

class FlowSearchReflex < ApplicationReflex
    def search
        @flows = Flow.where("name LIKE ?", "%#{params[:query]}%").limit(20)
        ## i have commented out the selector morph
        ## because i want to ensure that the logic for favorited/unfavoriting a flow
        ## still works on the page
        # morph "#flows-table", render(partial: "flows/flows", locals: { flows: @flows })
    end

    def map_search
        if params[:query].length < 1
            # Optionally, clear the current search results or handle as needed
            morph "#map-search-results-table", ""
        else
            @flows = Flow.where("name LIKE ?", "%#{params[:query]}%").limit(5)
            morph "#map-search-results-table", render(partial: "maps/components/results", locals: { flows: @flows })
        end
    end

    def display_search_popup
        flow_id = element.dataset[:id]
        @selected_flow = Flow.find(flow_id)
        morph "#popup-overlay", render(partial: "maps/components/popup", locals: { flow: @selected_flow })
    end
end
