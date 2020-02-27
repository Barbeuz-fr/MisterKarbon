class ReportScopeOrgasController < ApplicationController
  def index
    @report_scope_orga = ReportScopeOrga.all
    @orga = Orga.all
    @report_scope = ReportScope.all
    @emission_module = EmissionModule.all

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
    @report = Report.find(params[:report_id])
    @report_scope = ReportScope.all
    @emission_module = EmissionModule.all
    @report_scope_orga = ReportScopeOrga.new()
    # A decommenter quand les routes sont actives pour l'orga
    # @orga = Orga.find(params[:orga_id])
    # @report_scope = Orga.find(params[:report_scope_id])

    # @user = current_user

    # affichage sous-navbar
    @project_create_2_nav = true

  end

  def create
    report_scope_ids = report_scope_orga_params[:report_scope_id].reject{ |id| id == "" }
    # iterer sur report scope ids
    report_scope_ids.each do |report_scope_id|
      ReportScopeOrga.create(orga_id: report_scope_orga_params[:orga_id], report_scope_id: report_scope_id)
    end

    redirect_to report_report_scope_orgas_path

    #@report_scope_orga = ReportScopeOrga.new(report_scope_orga_params)
    # @orga = Orga.find(params[:orga_id])
    # @report_scope = Orga.find(params[:report_scope_id])
    # @user = current_user
    #if @report_scope_orga.save
    # authorize @report_scope_orgas
    # redirect_to user_path(current_user) To be defined
    #else
     # render :new
    #end
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
