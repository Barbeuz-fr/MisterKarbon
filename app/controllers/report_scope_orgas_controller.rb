class ReportScopeOrgasController < ApplicationController

  def send_report
    # Recuperation des params
    @report_scope_orga = ReportScopeOrga.find(params[:report_scope_orga_id])
    @report_scope_orga.status = "Sent, not yet stated"
    @report_scope_orga.save
    redirect_to report_path(@report_scope_orga.report_scope.report)
  end

end
