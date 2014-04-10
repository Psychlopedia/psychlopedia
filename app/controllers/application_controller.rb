class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_filter :check_first_timer

  private

  def check_first_timer
    unless cookies.permanent.signed[:reincident]
      cookies.permanent.signed[:reincident] = true
      redirect_to about_url
    end
  end
end
