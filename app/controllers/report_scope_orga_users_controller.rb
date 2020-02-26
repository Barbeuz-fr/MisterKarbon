class ReportScopeOrgaUsersController < ApplicationController

  def index
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

  def create

  end

end
