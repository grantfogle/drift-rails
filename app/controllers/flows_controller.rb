class FlowsController < ApplicationController

  http_basic_authenticate_with name: 'gjf', password: 'secret', except: [:index, :show]
  
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
    @flow = Flow.new(name: params[:flow][:name], location: params[:flow][:location], flow: params[:flow][:flow], status: params[:flow][:status])

    if @flow.save
      redirect_to @flow
    else
      render :new
    end
  end

  def edit
    @flow = Flow.find(params[:id])
  end

  def update
    @flow = Flow.find(params[:id])
    if @flow.update(flows_params)
      redirect_to @flow
    else
      render :edit
    end
  end

  def destroy
    @flow = Flow.find(params[:id])
    @flow.destroy
    
    redirect_to root_path
  end

  private

  def flows_params
    params.require(:flow).permit(:name, :location, :flow, :status)
  end
end
