class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :show_project_create_nav
  before_action :sidebar_show

  def default_url_options
    { host: "http://www.karbonchain.com/" || "localhost:3000" }
  end

  def show_project_create_nav
    @project_create_1_nav = false
    @project_create_2_nav = false
    @project_create_3_nav = false
  end

  def sidebar_show
    @sidebar_show = false
  end
end
