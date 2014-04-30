module ApplicationHelper
  def page_title
    @page_title || 'Psychlopedia'
  end

  def relocalize_url(locale)
    naked_url, params = request.original_url.split('?')
    if params
      locale_agnostic_params = params.split('&').delete_if { |param| param =~ /locale/ }
      locale_agnostic_params << "locale=#{locale}"
      desired_url = "#{naked_url}?#{locale_agnostic_params.join('&')}"
      desired_url
    else
      "#{naked_url}?locale=#{locale}"
    end
  end
end
