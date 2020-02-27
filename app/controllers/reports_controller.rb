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
    redirect_to  report_report_scopes_path(@report.id)
  end

  def destroy
    @report = Report.find(params[:id])
    @report.destroy
    redirect_to reports_path
  end

  # Laurent
  def show
    @report = Report.find(params[:id])

    # Identification s'il y a des reports avec le status "To send"
    @counter_reports_to_send = 0
    @report.report_scopes.each do |report_scope|
      report_scope.report_scope_orgas.each do |report_scope_orga|
        if report_scope_orga.status == "To send"
          @counter_reports_to_send += 1
        end
      end
    end

    # Calcul des KPIs d'avancement

    @status_to_send = 0
    @status_sent = 0
    @status_ongoing = 0
    @status_pending_validation = 0
    @status_done = 0
    @report.report_scopes.each do |report_scope|
      report_scope.report_scope_orgas.each do |report_scope_orga|
        if report_scope_orga.status == "To send"
          @status_to_send += 1
        elsif report_scope_orga.status == "Sent, not yet started"
          @status_sent += 1
        elsif report_scope_orga.status == "On-going"
          @status_ongoing += 1
        elsif report_scope_orga.status == "Pending validation"
          @status_pending_validation += 1
        elsif report_scope_orga.status == "Done"
          @status_done += 1
        end
      end
    end

    # Count total status
    @status_total = @status_to_send + @status_sent + @status_ongoing + @status_pending_validation + @status_done
  end

  # Laurent
  def result
    @reports = Report.all
    @report = Report.find(params[:report_id])
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
    params.require(:report).permit(:name, :year, :company_id, :id, :user_id, :photo)
  end

end

