class EmissionModulesController < ApplicationController

  def index
    @emission_modules = EmissionModule.all

    # affichage side bar
    @sidebar_show = true
  end

  def new
    @emission_module = EmissionModule.new

    # affichage side bar
    @sidebar_show = true
  end

  def create
    @emission_module = EmissionModule.new(emission_module_params)
    @emission_module.save
    redirect_to emission_modules_path
  end

  def edit
    @emission_module = EmissionModule.find(params[:id])
  end

  def update
    @emission_module = EmissionModule.find(params[:id])
    @emission_module.update(emission_module_params)
    redirect_to emission_modules_path
  end

  def destroy
    @emission_module = EmissionModule.find(params[:id])


  end

  private

  def emission_module_params
    params.require(:emission_module).permit(:name, :scope)
  end
end
