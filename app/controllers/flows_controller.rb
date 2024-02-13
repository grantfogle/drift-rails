class FlowsController < ApplicationController

  http_basic_authenticate_with name: 'gjf', password: 'secret', except: [:index, :show]
  
  def index
    @flows = Flow.all

    if session[:user_id]
      @user = User.find_by(id: session[:user_id])
    end
  end

  def show
    @flow = Flow.find(params[:id])
  end

  def new
    @flow = Flow.new
  end

  def create
    # @flow = Flow.new(name: params[:flow][:name], location: params[:flow][:location], state: params[:flow][:state], flow: params[:flow][:flow], status: params[:flow][:status], usgs_id: params[:flow][:usgs_id])
    @flow = Flow.new(flows_params)

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
    params.require(:flow).permit(:name, :stream, :location, :flow, :status, :state, :usgs_id)
  end
end
