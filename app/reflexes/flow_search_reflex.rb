# frozen_string_literal: true

class FlowSearchReflex < ApplicationReflex
    def search
        @flows = Flow.where("name LIKE ?", "%#{params[:query]}%")
        # morph "#flows-table", render(partial: "flows/flows", locals: { flows: @flows })
    end
end
