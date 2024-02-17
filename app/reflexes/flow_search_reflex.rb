class FlowSearchReflex < ApplicationReflex
  def search
    flows = Flow.where('name LIKE ?', "%#{params[:query]}%")
    puts "Flows found: #{flows.count}" # Debugging
    morph '#flows-list', render(partial: 'flows/flows', locals: { flows: })
  end
end
