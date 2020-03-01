class TestorgasController < ApplicationController
  def index
    @testorga = Testorga.all
  end
end
