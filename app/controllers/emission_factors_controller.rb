class EmissionFactorsController < ApplicationController
  def index
    @emission_factors = EmissionFactor.all
  end
end
