class TestorgasController < ApplicationController
  def index
    @testorgas = Testorga.all
  end
end
