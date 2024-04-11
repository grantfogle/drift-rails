# frozen_string_literal: true

class MapReflex < ApplicationReflex
    def toggle_pdf_view
        session[:show_pdf] = !session[:show_pdf]
        morph :nothing
    end
end
