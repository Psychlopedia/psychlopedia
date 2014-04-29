class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :logged_in?

  before_action :set_locale

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
    set_correct_gotcha_implementation
  end

  def set_correct_gotcha_implementation
    Gotcha.unregister_all_types
    if I18n.locale == :en
      Gotcha.register_type BackwardGotcha
    else
      Gotcha.register_type SpanishBackwardGotcha
    end
  end

  def default_url_options(options = {})
    { locale: I18n.locale }
  end

  private

  def logged_in?
    session[:admin]
  end
end
