class ReportScopeOrgaUsersController < ApplicationController

  def index
    @reports = Report.all
    @report = Report.find(params[:report_id])

    # affichage sous-navbar
    @project_create_3_nav = true

    # affichage side bar
    @sidebar_show = true

    # Fonction de recherche
    PgSearch.multisearch_options = {
      using: { tsearch: { prefix: true } }
    }
    if (params[:query].present?)
      PgSearch::Multisearch.rebuild(User)
      PgSearch::Multisearch.rebuild(Company)
      @results = PgSearch.multisearch(params[:query]).map{|result| result.searchable.model_name.name == 'Company' ? result.searchable.users : result.searchable }.flatten.uniq
    else
      @results=[]
    end
  end

  def new
    # Creation des instances
    @report_scope_orga = ReportScopeOrga.find(params[:report_scope_orga_id])
    @report_scope_orga_user = ReportScopeOrgaUser.new
    @report_scope_orga_users = ReportScopeOrgaUser.all


    # affichage side bar
    @sidebar_show = true

    # affichage sous-navbar
    @project_create_3_nav = true

    # Fonction de recherche
    PgSearch.multisearch_options = {
      using: { tsearch: { prefix: true } }
    }
    if (params[:query].present?)
      PgSearch::Multisearch.rebuild(User)
      PgSearch::Multisearch.rebuild(Company)
      @results = PgSearch.multisearch(params[:query]).map{|result| result.searchable.model_name.name == 'Company' ? result.searchable.users : result.searchable }.flatten.uniq
    else
      @results=[]
    end
  end

  def create
    # Creation des instances
    @report_scope_orga_user = ReportScopeOrgaUser.new(report_scope_orga_user_params)
    @report_scope_orga = ReportScopeOrga.find(params[:report_scope_orga_id])
    @report_scope_orga.status = "To send"
    @report_scope_orga_user.report_scope_orga = @report_scope_orga

    # Sauvegarde
    @report_scope_orga_user.save
    @report_scope_orga.save
    redirect_to report_report_scope_orga_users_path(@report_scope_orga.report_scope.report)
  end

  def destroy
    @report_scope_orga_user = ReportScopeOrgaUser.find(params[:id])
    @report_scope_orga_user.destroy
    redirect_to :back
  end

  private

  def report_scope_orga_user_params
    params.require(:report_scope_orga_user).permit(:user_id, :avatar)
  end

end
