class CompaniesController < ApplicationController

  def show
    @company = Company.find(params[:id])
    @user = current_user
    # affichage side bar
    @sidebar_show = true
  end
end
