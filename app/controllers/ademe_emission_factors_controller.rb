class AdemeEmissionFactorsController < ApplicationController

  def index
    @ademe_emission_factors = AdemeEmissionFactor.all
  end
end
