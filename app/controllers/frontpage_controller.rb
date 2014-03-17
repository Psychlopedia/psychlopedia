class FrontpageController < ApplicationController
  def index
    @experiences = Experience.all
  end
end
