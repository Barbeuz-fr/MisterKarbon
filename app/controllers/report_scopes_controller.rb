class ReportScopesController < ApplicationController

  def index
    @reports = Report.all
    @report = Report.find(params[:report_id])

    @module_scopes = EmissionModule.all
    @report_scopes = ReportScope.all
    @report_scope = ReportScope.new()

    @project_create_1_nav = true
  end

  def create
    @report_scope = ReportScope.new(report_scope_params)
    @report_scope.save
    redirect_to report_report_scopes_path(@report_scope.report_id, tab_name: params[:tab_name])
  end

  def destroy
    @report_scope = ReportScope.find(params[:id])
    @report_scope.destroy
    redirect_to report_report_scopes_path(@report_scope.report_id)
  end

  private

  def report_scope_params
     params.require(:report_scope).permit(
                          :emission_module_id,
                          :report_id
                          )
  end
end
