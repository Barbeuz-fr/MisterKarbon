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
    redirect_to report_report_scopes_path(@report.id)
  end

  def destroy
    @report = Report.find(params[:id])
    @report.destroy
    redirect_to reports_path
  end

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

  def result
    # Creation des instances
    @reports = Report.all
    @report = Report.find(params[:report_id])
    @report_scopes_array = @report.report_scopes

    # Output_array: array avec les hash de chaque emission par question
    @output_array = []
    @output_numbers = []

    # Definition de l'array de tous les résultats
    @report_scopes_array.each do |report_scope|
      report_scope.report_scope_orgas.each do |report_scope_orga|
        report_scope_orga.answers.each do |answer|
          if answer.calculation == true
            element = {
              answer: answer.content.to_f,
              answer_number: answer.id,
              ademe_factor: answer.question.ademe_emission_factor.emission_value.to_f,
              ademe_factor_unit: answer.question.ademe_emission_factor.unit,
              emission_answer_calculation: answer.content.to_f * answer.question.ademe_emission_factor.emission_value.to_f,
              emission_module_name: report_scope.emission_module.name,
              orga_scope_name: report_scope_orga.orga.name
            }
            @output_array << element
          end
        end
      end
    end

    # Definition des variables avec les données pour barchart simple
    @labels = []
    @emissions_bar_chart = []
    @output_array.each do |item|
      @emissions_bar_chart << item[:emission_answer_calculation]
      @labels << "#{item[:emission_module_name]} - #{item[:orga_scope_name]} - #{item[:answer_number]}"
    end



    # Definition des variables pour stackedbarchart (module x orga)
    # 1/ Axe X : emission modules
    @x_axis_modules = []
    @report_scopes_array.each do |report_scope|
      @x_axis_modules << report_scope.emission_module.name
    end

    # 2/ Creation d'un array avec autant d'array vide que de modules
    @y_axis_organizations = []
    @x_axis_modules.count.times do
      @y_axis_organizations << []
    end

    # 3/ Création d'un array pour stocker le nom des orga parcourues (en légende)
    @label_orga = []
    # 4/ Itérer sur les valeurs pour les stocker dans @y_axis_organizations
    @report_scopes_array.each_with_index do |report_scope, index_module|
      report_scope.report_scope_orgas.each_with_index do |report_scope_orga, index_orga|
        # total answer = total pour un module X orga
        total_answer = 0
        report_scope_orga.answers.each do |answer|
          if answer.calculation == true
            total_answer += answer.content.to_f
          end
        # on push le total dans l'array @y_axis_organizations
        end
      @y_axis_organizations[index_orga] << total_answer
      @label_orga << report_scope_orga.orga.name
      end
    end




    # total_answer = 0
    # @report_scopes_array.each do |report_scope|
    #   # On rentre dans un module

    #   report_scope.report_scope_orgas.each do |report_scope_orga|
    #     # On rentre dans un module x orga
    #     report_scope_orga.answers.each do |answer|
    #       if answer.calculation == true
    #         total_answer += answer.content
    #       end
    #     end
    #   end
    # end




    # Axe Y : total des questions par orga x module

  end

  private

  def report_params
    params.require(:report).permit(:name, :year, :company_id, :id, :user_id, :photo)
  end

end

