class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_filter :check_first_timer

  private

  def check_first_timer
    unless cookies.permanent.signed[:stale]
      cookies.permanent.signed[:stale] = true
      redirect_to about_url
    end
  end
end
