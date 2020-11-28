class DistancesController < ApplicationController
  def index
    @distances = Distance.all
  end
end
