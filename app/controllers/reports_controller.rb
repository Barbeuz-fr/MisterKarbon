class ReportsController < ApplicationController

  def index
    @reports = Report.all
    @report = Report.new()
  end

  def show
    @report = Report.find(params[:id])

    @module_scopes = EmissionModule.all

    @report_scopes = ReportScope.all

    @report_scope = ReportScope.new()
  end

  def create
    @report = Report.new(report_params)
    @report.user_id = User.last.id
    @report.company_id = Company.first.id
    @report.save!
    redirect_to reports_path
  end




  private

  def report_params
    params.require(:report).permit(:name, :year)
  end
end

