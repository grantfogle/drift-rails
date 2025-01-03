# Streams Controller

class StreamsController < ApplicationController

  def index
    @streams = StreamsService.new.call
    @current_user = Current.user
  end
end