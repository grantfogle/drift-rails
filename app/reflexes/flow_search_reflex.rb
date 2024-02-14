# frozen_string_literal: true

class FlowSearchReflex < ApplicationReflex
  def search
    flows = Flow.where('name LIKE ?', "%#{params[:query]}%")
    morph '#flows-list', render(partial: 'flows/flows', locals: { flows: flows })
  end
end
