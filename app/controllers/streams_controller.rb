# Streams Controller

class StreamsController < ApplicationController

  def index
    @streams = StreamsService.new.call
  end
end