# Streams Controller

class StreamsController < ApplicationController

  def index
    @view_type = "all"
    @streams = StreamsService.new.call
    @current_user = Current.user
  end
end