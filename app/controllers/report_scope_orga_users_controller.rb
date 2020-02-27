class ReportScopeOrgaUsersController < ApplicationController

  def index
    @report = Report.find(params[:report_id])

    # PgSearch.multisearch_options = {
    #   using: { tsearch: { prefix: true } }
    # }

    # if (params[:query].present?)
    #   PgSearch::Multisearch.rebuild(User)
    #   PgSearch::Multisearch.rebuild(Company)

    #   @results = PgSearch.multisearch(params[:query]).map{|result| result.searchable.model_name.name == 'Company' ? result.searchable.users : result.searchable }.flatten.uniq
    # else
    #   @results=[]
    # end
  end

  def new
      @report_scope_orga = ReportScopeOrga.find(params[:report_scope_orga_id])
      # TO DO : définir @report_scope_orga
      @report_scope_orga_user = ReportScopeOrgaUser.new

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
    @report_scope_orga = ReportScopeOrga.find(params[:report_scope_orga_id])

    # TO DO : définir @report_scope_orga et l'assigner à @report_scope_orga_user
    @report_scope_orga_user.report_scope_orga = @report_scope_orga
    @report_scope_orga_user.save
    redirect_to new_report_scope_orga_report_scope_orga_user_path(@report_scope_orga, query: params[:query])
  end

  private

  def report_scope_orga_user_params
    params.require(:report_scope_orga_user).permit(:user_id)
  end

end
