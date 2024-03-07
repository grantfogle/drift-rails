# frozen_string_literal: true

class FlowSearchReflex < ApplicationReflex
    def search
        @flows = Flow.where("name LIKE ?", "%#{params[:query]}%").limit(20)
        ## i have commented out the selector morph
        ## because i want to ensure that the logic for favorited/unfavoriting a flow
        ## still works on the page
        # morph "#flows-table", render(partial: "flows/flows", locals: { flows: @flows })
    end
end
