class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :show_project_create_nav

  def show_project_create_nav
    @project_create_1_nav = false
    @project_create_2_nav = false
    @project_create_3_nav = false
  end

end
