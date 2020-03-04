class ReportScopeOrgasController < ApplicationController
  def index
    @orgas = Orga.all
    @report_scope = ReportScope.where(report_id: params[:report_id])

    # affichage side bar
    @sidebar_show = true

    # affichage sous-navbar
    @project_create_2_nav = true
  end

  def show
    @report_scope_orga = ReportScopeOrga.find(params[:id])
    @report_scope_orga.destroy
    redirect_to  new_report_report_scope_orga_path
  end

  def send_report
    # Recuperation des params
    @report_scope_orga = ReportScopeOrga.find(params[:report_scope_orga_id])
    @report_scope_orga.status = "Sent, not yet started"
    @report_scope_orga.save
    redirect_to report_path(@report_scope_orga.report_scope.report)
  end

  def new
    @reports = Report.all
    @orgas = Orga.all
    @report = Report.find(params[:report_id])
    # @emission_module = EmissionModule.all
    @report_scope_orga = ReportScopeOrga.new()

    @report_scope_orgas = @report.report_scope_orgas

    # affichage side bar
    @sidebar_show = true

    # affichage sous-navbar
    @project_create_2_nav = true

    # Fonction de recherche
    PgSearch.multisearch_options = {
      using: { tsearch: { prefix: true } }
    }
    if (params[:query].present?)
      @results = Orga.search_orga(params[:query])
    else
      @results=[]
    end

  end

  def create
    orga_ids = report_scope_orga_params[:orga_id].reject{ |id| id == "" }
    # iterer sur report scope ids
    orga_ids.each do |orga_id|
      ReportScopeOrga.create(orga_id: orga_id, report_scope_id: report_scope_orga_params[:report_scope_id])
    end

    redirect_to new_report_report_scope_orga_path
  end

  def destroy
    @report_scope_orga = ReportScopeOrga.find(params[:id])
    @report_scope_orga.destroy

    redirect_to  new_report_report_scope_orga_path
  end

  private

  def report_scope_orga_params
    params.require(:report_scope_orga).permit(:report_scope_id, orga_id: [])
  end
end
