class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # XXX: i'll find another way...
  # before_filter :check_first_timer

  private

  def check_first_timer
    unless cookies.permanent.signed[:is_user_first_timer]
      cookies.permanent.signed[:is_user_first_timer] = true
      redirect_to about_url
    end
  end
end
