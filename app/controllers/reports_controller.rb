class ReportsController < ApplicationController

  def index
    @reports = Report.all
    @report = Report.new()
  end

  def show
    @report = Report.find(params[:id])

    @module_scopes = EmissionModule.all

    @report_scopes = ReportScope.all

    @report_scope = ReportScope.new()
  end

  def create
    @report = Report.new(report_params)
    @report.user_id = User.last.id
    @report.company_id = Company.first.id
    @report.save!
    redirect_to reports_path
  end

  def destroy
    @report = Report.find(params[:id])
    @report.destroy
    redirect_to reports_path
  end

  def show
    @report = Report.find(params[:id])
  end

  def result
    @reports = Report.all
    @report = Report.find(params[:id])
    @report_scopes_array = @report.report_scopes

    # Output_array: array avec les hash de chaque emissions par question
    @output_array = []

    @report_scopes_array.each do |report_scope|
      report_scope.report_scope_orgas.each do |report_scope_orga|
        report_scope_orga.answers.each do |answer|
          if answer.calculation == true
            element = {
              answer: answer.content.to_f,
              answer_number: answer.id,
              ademe_factor: answer.question.ademe_emission_factor.emission_value.to_f,
              ademe_factor_unit: answer.question.ademe_emission_factor.unit,
              emission_value: answer.content.to_f * answer.question.ademe_emission_factor.emission_value.to_f,
              emission_module_name: report_scope.emission_module.name,
              orga_scope_name: report_scope_orga.orga.name
            }
            @output_array << element
          end
        end
      end
    end
  end



  private

  def report_params
    params.require(:report).permit(:name, :year, :company_id, :id, :user_id,  :photo)
  end


end

