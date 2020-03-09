class QuestionsController < ApplicationController

  def new
    @emission_module = EmissionModule.find(params[:emission_module_id])
    @question = Question.new
  end

  def create

  end

  def edit

  end

  def update

  end

  def destroy

  end
end
