class ActivityDataController < ApplicationController

  def fixed_energy
    @emission_factors = EmissionFactor.all
    @activity_data = ActivityDatum.new

  end

end
