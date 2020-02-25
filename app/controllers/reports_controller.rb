class ReportsController < ApplicationController
  def index
    @reports = Report.all
  end


  def result
  end

end
