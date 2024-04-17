# frozen_string_literal: true

class FlowSearchReflex < ApplicationReflex
    def search
        @flows = Flow.where("name LIKE ?", "%#{params[:query]}%").limit(10)
        ## i have commented out the selector morph
        ## because i want to ensure that the logic for favorited/unfavoriting a flow
        ## still works on the page
        # how do i morph ther table of flows?
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
        # get favorite status
        flow_id = element.dataset[:id]
        @current_user = User.find_by(id: session[:user_id])
        @selected_flow = Flow.find(flow_id)
        morph "#popup-overlay", render(partial: "maps/components/popup", locals: { flow: @selected_flow, current_user: @current_user})
    end

    def hide_search_popup
        morph "#popup-overlay", ""
    end
end
