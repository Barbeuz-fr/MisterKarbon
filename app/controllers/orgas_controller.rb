class OrgasController < ApplicationController

  def index
    @company = Company.find(params[:id])
    # Changer orga
    @orgas = Orga.all

    # affichage side bar
    @sidebar_show = true
  end

  def new
    @company = Company.find(params[:company_id])
    @orga = Orga.new
    @user = current_user

    # affichage side bar
    @sidebar_show = true
  end

  def create
    @orga = Orga.new(orga_params)
    @company = Company.find(params[:company_id])
    @orga.company = @company
    if @orga.save
      redirect_to company_path(@company)
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
    @orga = Orga.find(params[:id])
    @orga.destroy
    redirect_to root_path

  end

  private

  def orga_params
    params.require(:orga).permit(:name)
  end

end
