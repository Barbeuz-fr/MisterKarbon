class ReportScopeOrgaUsersController < ApplicationController

  def index
    @report = Report.find(params[:report_id])
    @report_scope_orga_users = ReportScopeOrgaUser.all


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

end
