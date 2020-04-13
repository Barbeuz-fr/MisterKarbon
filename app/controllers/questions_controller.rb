class QuestionsController < ApplicationController

  def new
    @emission_module = EmissionModule.find(params[:emission_module_id])
    @question = Question.new

    # affichage side bar
    @sidebar_show = true
  end

  def create
    @question = Question.new(question_params)
    @emission_module = EmissionModule.find(params[:emission_module_id])
    @question.emission_module = @emission_module
    @question.save
    redirect_to emission_module_path(@emission_module)
  end

  def edit
    @emission_module = EmissionModule.find(params[:emission_module_id])
    @question = Question.find(params[:id])

    # affichage side bar
    @sidebar_show = true
  end

  def update
    @emission_module = EmissionModule.find(params[:emission_module_id])
    @question = Question.find(params[:id])
    @question.update(question_params)
    redirect_to emission_module_path(@emission_module)
  end

  def destroy

  end

  private

  def question_params
    params.require(:question).permit(:content, :ademe_emission_factor_id, :calculation, :emission_module_id)
  end
end
