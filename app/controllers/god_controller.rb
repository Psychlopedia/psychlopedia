class GodController < ApplicationController
  before_action :is_admin?

  def index
    @experiences = Experience.all
  end

  private

  def is_admin?
    redirect_to new_session_path unless session[:admin]
  end
end
