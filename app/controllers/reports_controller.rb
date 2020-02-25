class ReportsController < ApplicationController
  def index
    @reports = Report.all
    @report = Report.new()
  end

  def create
    @report = Report.new(report_params)
    @report.user_id = User.last.id
    @report.company_id = Company.first.id
    @report.save!
    redirect_to reports_path
  end


  def result
    @reports = Report.all
    @report = Report.find(params[:id])
    @report_scopes_array = @report.report_scopes

    @output_calc = []

    @report_scopes_array.each do |report_scope|
      report_scope.answers.each do |answer|
        if answer.calculation == true
          element = {
            emission_value: answer.content * answer.question.ademe_emission_factor.emission_value,
            emission_module_name: report_scope.emission_module.name,
            orga_scope_name: report_scope.report_scope_orgas.orga.name
          }
          @output_calc << element
        end
      end
    end

    # Boucle sur report_scope_array
      # Boucle sur answers
    # si calculation = true
      # Output : array de hash avec:
        # emission_value =  answer.content * question.content
        # emission factor (Ademe_emission_factor.name)
        # type d'emission (emission_module.name)
        # orga scope (report_scope.report_scope_orga.orga.name)
    end

  private

  def report_params
    params.require(:report).permit(:name, :year, :company_id, :id, :user_id)
  end


end

