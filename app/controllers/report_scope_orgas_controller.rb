class ReportScopeOrgasController < ApplicationController
  def index
    @orga = Orga.all
    @report_scope = ReportScope.where(report_id: params[:report_id])

    # affichage sous-navbar
    @project_create_2_nav = true
  end

  def send_report
    # Recuperation des params
    @report_scope_orga = ReportScopeOrga.find(params[:report_scope_orga_id])
    @report_scope_orga.status = "Sent, not yet started"
    @report_scope_orga.save
    redirect_to report_path(@report_scope_orga.report_scope.report)
  end

  def new
    @report = Report.find(params[:report_id])
    # @report_scope = ReportScope.all
    # @emission_module = EmissionModule.all
    @report_scope_orga = ReportScopeOrga.new()

    # affichage sous-navbar
    @project_create_2_nav = true

  end

  def create
    report_scope_ids = report_scope_orga_params[:report_scope_id].reject{ |id| id == "" }
    # iterer sur report scope ids
    report_scope_ids.each do |report_scope_id|
      ReportScopeOrga.create(orga_id: report_scope_orga_params[:orga_id], report_scope_id: report_scope_id)
    end

    redirect_to new_report_report_scope_orga_path

  end

  def destroy
    @report_scope_orga = ReportScopeOrga.find(params[:report_scope_orga_id])
    @report_scope_orga.destroy
    redirect_to report_report_scope_orgas_path
  end

  private

  def report_scope_orga_params
    params.require(:report_scope_orga).permit(:orga_id, report_scope_id: [])
  end
end
