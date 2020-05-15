class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :about, :mentions_legales ]

  def home
    render :layout => 'home'
  end

  def about
    render :layout => 'home'
  end

  def mentions_legales
    render :layout => 'home'
  end
end
