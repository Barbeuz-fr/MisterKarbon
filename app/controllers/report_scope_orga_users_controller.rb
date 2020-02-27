class ReportScopeOrgaUsersController < ApplicationController

  def index
    @report = Report.find(params[:report_id])
    # @report_scope_orga_users = ReportScopeOrgaUser. do |report_scope_orga_user|
    #   report_scope_orga_user.report_scope_orga.report_scope.report.id == params[:report_id]
      # raise
    # end
    # @report_scope_orga_user =ReportScopeOrgaUser.find(params[:report_id])

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
      @report = Report.find(params[:report_id])
      @report_scope_orga_user = ReportScopeOrgaUser.new()
      # TO DO : définir @report_scope_orga

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
    @report_scope_orga_user = ReportScopeOrgaUser.new(report_scope_orga_user_params)

    # TO DO : définir @report_scope_orga et l'assigner à @report_scope_orga_user
    @report = Report.find(params[:report_id])
    @report_scope_orga_user.report = @report
    @report_scope_orga_user.save
    redirect_to report_report_scope_orga_users_path(@report.id)
  end

  private

  def report_scope_orga_user_params
    params.require(:report_scope_orga_user).permit(:email, :id, :first_name, :last_name)
  end

end
