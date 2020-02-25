class ReportScopeOrgasController < ApplicationController
  def new
    @report_scope_orga = ReportScopeOrga.new()
    # A decommenter quand les routes sont actives pour l'orga
    # @orga = Orga.find(params[:orga_id])
    # @report_scope = Orga.find(params[:report_scope_id])


    # @user = current_user
    # authorize @report_scope_orgas
  end

  def create
    @report_scope_orga = ReportScopeOrga.new(report_scope_orga_params)
    # @orga = Orga.find(params[:orga_id])
    # @report_scope = Orga.find(params[:report_scope_id])
    # @user = current_user
    if @report_scope_orga.save
    # authorize @report_scope_orgas
    # redirect_to user_path(current_user) To be defined
    else
      render :new
    end
  end

  private

  def report_scope_orga_params
    params.require(:report_scope_orga).permit(:orga_id, :report_scope_id)
  end
end
