class FlowsController < ApplicationController
  def index
    @flows = Flow.all
  end

  def show
    @flow = Flow.find(params[:id])
  end

  def new
    @flow = Flow.new
  end

  def create
    @flow = Flow.new(name: params[:flow][:name], location: params[:flow][:location], flow: params[:flow][:flow])

    if @flow.save
      redirect_to @flow
    else
      render :new
    end
  end
end
