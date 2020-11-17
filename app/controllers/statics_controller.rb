class StaticsController < ApplicationController
  def home
    @sellinfo = Sellinfo.new
  end
end
