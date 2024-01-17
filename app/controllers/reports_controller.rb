class ReportsController < ApplicationController
  def create
    @flow = Flow.find(params[:flow_id])
    @report = @flow.reports.create(report_params)
    
    redirect_to flow_path(@flow)
  end

  private
    def report_params
      params.require(:report).permit(:author, :body, :rating, :status)
    end
end
