class ReportsController < ApplicationController

    http_basic_authenticate_with name: 'gjf', password: 'secret', only: :destroy
    
  def create
    @flow = Flow.find(params[:flow_id])
    @report = @flow.reports.create(report_params)
    
    redirect_to flow_path(@flow)
  end

  def destroy
    @flow = Flow.find(params[:flow_id])
    @report = @flow.reports.find(params[:id])
    @report.destroy

    redirect_to flow_path(@flow)
  end

  private
    def report_params
      params.require(:report).permit(:author, :body, :rating, :status)
    end
end
