class ReportScopesController < ApplicationController

  def index
    @module_scopes = EmissionModule.all
    @report_scopes = ReportScope.all
    @report_scope = ReportScope.new()
  end

  def create
    @report_scope = ReportScope.new(report_scope_params)
    @report_scope.save!
    redirect_to report_report_scopes_path(@report_scope.id)
  end

  def destroy
    @report = Report.find(params[:report_id])
    @report_scope = ReportScope.find(params[:id])

    redirect_to report_report_scopes_path(@report_scope.id)
  end

  private

  def report_scope_params
     params.require(:report_scope).permit(
                          :emission_module_id,
                          :report_id
                          )
  end
end
