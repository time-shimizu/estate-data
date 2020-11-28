class BuyinfosController < ApplicationController
  def new
    @buyinfo = Buyinfo.new
  end
end
