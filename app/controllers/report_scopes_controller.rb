class ReportScopesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show, :new, :create ]

  def index
    @modules_scope1 = EmissionModule.where(scope: 1)
    @modules_scope2 = EmissionModule.where(scope: 2)
    @modules_scope3 = EmissionModule.where(scope: 3)

    @report_scopes = ReportScope.all
    @report_scope = ReportScope.new()
  end

  def create
    @report_scope = ReportScope.new(report_scope_params)
    @report_scope.save
  end

  private

  def report_scope_params
     params.require(:report_scope).permit(:emission_module_id)
  end
end
